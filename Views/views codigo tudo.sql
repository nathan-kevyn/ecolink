
--------------------------------------------------------------------
CREATE OR ALTER VIEW futebol.vw_TempoMedio_Gol_Clube
AS
SELECT 
    c.nome AS clube,
    COUNT(fg.gol_id) AS total_gols,
    AVG(TRY_CAST(fg.minuto AS FLOAT)) AS media_minuto_gol,
    MIN(TRY_CAST(fg.minuto AS FLOAT)) AS gol_mais_rapido,
    MAX(TRY_CAST(fg.minuto AS FLOAT)) AS gol_mais_tardio
FROM futebol.Fato_Gol fg
INNER JOIN futebol.Dim_Clube c 
    ON fg.clube_id = c.clube_id
WHERE fg.minuto IS NOT NULL
GROUP BY c.nome;
GO

SELECT 
    RANK() OVER (ORDER BY AVG(TRY_CAST(fg.minuto AS FLOAT))) AS posicao,
    c.nome AS clube,
    COUNT(fg.gol_id) AS total_gols,
    ROUND(AVG(TRY_CAST(fg.minuto AS FLOAT)), 2) AS media_minuto_gol
FROM futebol.Fato_Gol fg
INNER JOIN futebol.Dim_Clube c 
    ON fg.clube_id = c.clube_id
WHERE fg.minuto IS NOT NULL
GROUP BY c.nome
ORDER BY posicao;

---------------------------------------------------------------------------------
CREATE OR ALTER VIEW futebol.vw_Eficiencia_Chutes_Clube
AS
WITH gols_por_time AS (
    SELECT 
        clube_id,
        COUNT(*) AS total_gols
    FROM futebol.Fato_Gol
    GROUP BY clube_id
),
chutes_por_time AS (
    SELECT 
        clube_id,
        SUM(TRY_CAST(chutes AS FLOAT)) AS total_chutes,
        SUM(TRY_CAST(chutes_a_gol AS FLOAT)) AS total_chutes_a_gol
    FROM futebol.Fato_Estatistica_Clube
    GROUP BY clube_id
)
SELECT 
    c.nome AS clube,
    ISNULL(ct.total_chutes, 0) AS total_chutes,
    ISNULL(ct.total_chutes_a_gol, 0) AS total_chutes_a_gol,
    ISNULL(gt.total_gols, 0) AS total_gols,

    -- ✅ Quantos chutes a gol são necessários pra fazer 1 gol
    CASE 
        WHEN gt.total_gols > 0 THEN 
            ROUND(ct.total_chutes_a_gol / gt.total_gols, 2)
        ELSE NULL
    END AS chutes_a_gol_por_gol,

    -- ✅ Eficiência: % de chutes a gol que viram gol
    CASE 
        WHEN ct.total_chutes_a_gol > 0 AND gt.total_gols > 0 THEN 
            ROUND((gt.total_gols * 100.0) / ct.total_chutes_a_gol, 2)
        ELSE NULL
    END AS eficiencia_percentual

FROM futebol.Dim_Clube c
LEFT JOIN chutes_por_time ct ON c.clube_id = ct.clube_id
LEFT JOIN gols_por_time gt ON c.clube_id = gt.clube_id;
GO



SELECT 
    clube,
    total_chutes_a_gol,
    total_gols,
    chutes_a_gol_por_gol,
    eficiencia_percentual
FROM futebol.vw_Eficiencia_Chutes_Clube
WHERE total_gols > 0
    AND total_chutes_a_gol >= total_gols
ORDER BY chutes_a_gol_por_gol ASC;
-----------------------------------------------------------------------------------
CREATE OR ALTER VIEW futebol.vw_Impeditos_Clube
AS
WITH impedimentos_por_clube AS (
    SELECT 
        c.clube_id,
        c.nome AS clube,
        SUM(ISNULL(TRY_CAST(fec.impedimentos AS INT), 0)) AS total_impedimentos,
        COUNT(DISTINCT fec.partida_id) AS total_jogos
    FROM futebol.Fato_Estatistica_Clube fec
    INNER JOIN futebol.Dim_Clube c ON c.clube_id = fec.clube_id
    GROUP BY c.clube_id, c.nome
)
SELECT 
    clube,
    total_impedimentos,
    total_jogos,
    -- Quantos impedimentos por jogo
    CASE 
        WHEN total_jogos > 0 THEN ROUND(CAST(total_impedimentos AS FLOAT) / total_jogos, 2)
        ELSE NULL
    END AS impedimentos_por_jogo,
    RANK() OVER (ORDER BY total_impedimentos DESC) AS ranking_impedimentos
FROM impedimentos_por_clube;
GO

-- Exemplo de consulta
SELECT *
FROM futebol.vw_Impeditos_Clube
ORDER BY ranking_impedimentos ASC;
---------------------------------------------------------------------------------------
CREATE OR ALTER VIEW futebol.vw_Possessao_Clube
AS
WITH posse_por_clube AS (
    SELECT 
        c.clube_id,
        c.nome AS clube,
        SUM(TRY_CAST(REPLACE(fec.posse_de_bola, '%', '') AS FLOAT)) AS total_posse,
        COUNT(DISTINCT fec.partida_id) AS total_jogos
    FROM futebol.Fato_Estatistica_Clube fec
    INNER JOIN futebol.Dim_Clube c ON c.clube_id = fec.clube_id
    GROUP BY c.clube_id, c.nome
)
SELECT 
    clube,
    total_posse,
    total_jogos,
    -- Média de posse por jogo
    CASE 
        WHEN total_jogos > 0 THEN ROUND(total_posse / total_jogos, 2)
        ELSE NULL
    END AS posse_media_por_jogo,
    RANK() OVER (ORDER BY total_posse DESC) AS ranking_posse
FROM posse_por_clube;
GO

-- Exemplo de consulta
SELECT *
FROM futebol.vw_Possessao_Clube
ORDER BY ranking_posse ASC;
-----------------------------------------------------------------------------------------------
CREATE OR ALTER VIEW futebol.vw_Vitorias_Menor_Possessao
AS
WITH posse_partida AS (
    SELECT 
        fp.partida_id,
        fp.mandante_id,
        fp.visitante_id,
        fp.mandante_placar,
        fp.visitante_placar,
        TRY_CAST(REPLACE(fem.posse_de_bola, '%', '') AS FLOAT) AS mandante_posse,
        TRY_CAST(REPLACE(fev.posse_de_bola, '%', '') AS FLOAT) AS visitante_posse
    FROM futebol.Fato_Partida fp
    INNER JOIN futebol.Fato_Estatistica_Clube fem 
        ON fp.partida_id = fem.partida_id AND fp.mandante_id = fem.clube_id
    INNER JOIN futebol.Fato_Estatistica_Clube fev 
        ON fp.partida_id = fev.partida_id AND fp.visitante_id = fev.clube_id
)
SELECT 
    c.nome AS clube,
    pp.partida_id,
    CASE 
        WHEN pp.mandante_placar > pp.visitante_placar THEN pp.mandante_placar
        ELSE pp.visitante_placar
    END AS gols_marcados,
    CASE 
        WHEN pp.mandante_placar > pp.visitante_placar THEN pp.visitante_placar
        ELSE pp.mandante_placar
    END AS gols_sofridos,
    CASE 
        WHEN pp.mandante_placar > pp.visitante_placar THEN pp.mandante_posse
        ELSE pp.visitante_posse
    END AS posse_do_vencedor,
    CASE 
        WHEN pp.mandante_placar > pp.visitante_placar THEN pp.visitante_posse
        ELSE pp.mandante_posse
    END AS posse_do_perdedor
FROM posse_partida pp
INNER JOIN futebol.Dim_Clube c 
    ON c.clube_id = CASE 
                        WHEN pp.mandante_placar > pp.visitante_placar THEN pp.mandante_id
                        ELSE pp.visitante_id
                    END
WHERE 
    -- O vencedor tinha menos posse que o adversário
    CASE 
        WHEN pp.mandante_placar > pp.visitante_placar THEN pp.mandante_posse
        ELSE pp.visitante_posse
    END < CASE 
             WHEN pp.mandante_placar > pp.visitante_placar THEN pp.visitante_posse
             ELSE pp.mandante_posse
         END;
GO

-- Exemplo de consulta
SELECT *
FROM futebol.vw_Vitorias_Menor_Possessao
ORDER BY posse_do_vencedor ASC;
---------------------------------------------------------------------------------------------------
CREATE OR ALTER VIEW futebol.vw_Precisao_Passes_Clube
AS
WITH estatisticas_por_clube AS (
    SELECT 
        c.clube_id,
        c.nome AS clube,
        SUM(TRY_CAST(REPLACE(fec.precisao_passes, '%', '') AS FLOAT)) AS total_precisao,
        COUNT(DISTINCT fec.partida_id) AS total_jogos
    FROM futebol.Fato_Estatistica_Clube fec
    INNER JOIN futebol.Dim_Clube c ON c.clube_id = fec.clube_id
    GROUP BY c.clube_id, c.nome
)
SELECT 
    clube,
    total_precisao,
    total_jogos,
    CASE 
        WHEN total_jogos > 0 THEN ROUND(total_precisao / total_jogos, 2)
        ELSE NULL
    END AS precisao_media_por_jogo,
    RANK() OVER (ORDER BY total_precisao DESC) AS ranking_precisao
FROM estatisticas_por_clube;
GO

-- Exemplo de consulta
SELECT *
FROM futebol.vw_Precisao_Passes_Clube
ORDER BY ranking_precisao ASC;
-------------------------------------------------------------------------
CREATE OR ALTER VIEW futebol.vw_Clubes_Mais_Faltosos
AS
WITH estatisticas_por_clube AS (
    SELECT 
        c.clube_id,
        c.nome AS clube,
        SUM(TRY_CAST(fec.faltas AS INT)) AS total_faltas,
        COUNT(DISTINCT fec.partida_id) AS total_jogos
    FROM futebol.Fato_Estatistica_Clube fec
    INNER JOIN futebol.Dim_Clube c ON c.clube_id = fec.clube_id
    GROUP BY c.clube_id, c.nome
)
SELECT 
    clube,
    total_faltas,
    total_jogos,
    CASE 
        WHEN total_jogos > 0 THEN ROUND(CAST(total_faltas AS FLOAT) / total_jogos, 2)
        ELSE NULL
    END AS faltas_media_por_jogo,
    RANK() OVER (ORDER BY total_faltas DESC) AS ranking_faltas
FROM estatisticas_por_clube;
GO

-- Exemplo de consulta
SELECT *
FROM futebol.vw_Clubes_Mais_Faltosos
ORDER BY ranking_faltas ASC;
------------------------------------------------------------------------------------
CREATE OR ALTER VIEW futebol.vw_Gols_Por_Minuto_Clube
AS
WITH gols_minuto AS (
    SELECT 
        c.clube_id,
        c.nome AS clube,
        COUNT(*) AS total_gols,
        SUM(CASE 
                WHEN TRY_CAST(g.minuto AS INT) IS NOT NULL THEN TRY_CAST(g.minuto AS INT)
                ELSE 0
            END) AS soma_minutos
    FROM futebol.Fato_Gol g
    INNER JOIN futebol.Dim_Clube c ON c.clube_id = g.clube_id
    GROUP BY c.clube_id, c.nome
)
SELECT 
    clube,
    total_gols,
    soma_minutos,
    CASE 
        WHEN soma_minutos > 0 THEN ROUND(CAST(total_gols AS FLOAT) / soma_minutos, 4)
        ELSE NULL
    END AS gols_por_minuto,
    RANK() OVER (ORDER BY CAST(total_gols AS FLOAT) / NULLIF(soma_minutos,0) DESC) AS ranking_gols_por_minuto
FROM gols_minuto;
GO

-- Exemplo de consulta
SELECT *
FROM futebol.vw_Gols_Por_Minuto_Clube
ORDER BY ranking_gols_por_minuto ASC;
-------------------------------------------------------------------------------------------------------