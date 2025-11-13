
CREATE   VIEW [futebol].[vw_Analise_04_Arenas_Empates] AS
SELECT 
    a.nome AS arena,
    COUNT(*) AS total_empates
FROM futebol.Fato_Partida f
JOIN futebol.Dim_Arena a ON f.arena_id = a.arena_id
WHERE f.vencedor_id IS NULL OR f.mandante_placar = f.visitante_placar
GROUP BY a.nome;
GO
/****** Object:  View [futebol].[vw_Analise_05_Gols_Apos_85]    Script Date: 13/11/2025 11:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [futebol].[vw_Analise_05_Gols_Apos_85] AS
SELECT 
    c.nome AS clube,
    COUNT(*) AS gols_apos_85
FROM futebol.Fato_Gol g
JOIN futebol.Dim_Clube c ON g.clube_id = c.clube_id
WHERE TRY_CAST(LEFT(g.minuto, 2) AS INT) >= 85
GROUP BY c.nome;
GO


CREATE VIEW [futebol].[vw_Cartoes_Por_Clube] AS
SELECT 
    c.nome AS clube,
    COUNT(*) AS total_cartoes,
    SUM(CASE WHEN fc.tipo_cartao LIKE '%Vermelho%' THEN 1 ELSE 0 END) AS cartoes_vermelhos,
    SUM(CASE WHEN fc.tipo_cartao LIKE '%Amarelo%' THEN 1 ELSE 0 END) AS cartoes_amarelos
FROM futebol.Fato_Cartao fc
LEFT JOIN futebol.Dim_Clube c ON fc.clube_id = c.clube_id
WHERE c.nome IS NOT NULL
GROUP BY c.nome;
GO

CREATE VIEW [futebol].[vw_Cartoes_Por_Jogador] AS
SELECT 
    a.nome AS atleta,
    c.nome AS clube,
    COUNT(*) AS total_cartoes,
    SUM(CASE WHEN fc.tipo_cartao LIKE '%Vermelho%' THEN 1 ELSE 0 END) AS cartoes_vermelhos,
    SUM(CASE WHEN fc.tipo_cartao LIKE '%Amarelo%' THEN 1 ELSE 0 END) AS cartoes_amarelos,
    CAST(SUM(CASE WHEN fc.tipo_cartao LIKE '%Vermelho%' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS percentual_vermelhos
FROM futebol.Fato_Cartao fc
LEFT JOIN futebol.Dim_Atleta a ON fc.atleta_id = a.atleta_id
LEFT JOIN futebol.Dim_Clube c ON fc.clube_id = c.clube_id
WHERE a.nome IS NOT NULL
GROUP BY a.nome, c.nome
HAVING COUNT(*) > 0;
GO


CREATE VIEW [futebol].[vw_Clubes_Disciplina_Ranking] AS
WITH EstatisticasDisciplina AS (
    SELECT 
        c.nome AS clube,
        COUNT(fc.cartao_id) AS total_cartoes,
        COUNT(DISTINCT fc.partida_id) AS total_partidas,
        SUM(CASE WHEN fc.tipo_cartao LIKE '%Vermelho%' THEN 1 ELSE 0 END) AS cartoes_vermelhos,
        SUM(CASE WHEN fc.tipo_cartao LIKE '%Amarelo%' THEN 1 ELSE 0 END) AS cartoes_amarelos
    FROM futebol.Fato_Cartao fc
    LEFT JOIN futebol.Dim_Clube c ON fc.clube_id = c.clube_id
    WHERE c.nome IS NOT NULL
    GROUP BY c.nome
    HAVING COUNT(DISTINCT fc.partida_id) >= 5
)
SELECT 
    RANK() OVER (ORDER BY total_cartoes ASC) AS ranking_disciplina,
    RANK() OVER (ORDER BY total_cartoes DESC) AS ranking_indisciplina,
    clube,
    total_cartoes,
    total_partidas,
    cartoes_vermelhos,
    cartoes_amarelos
FROM EstatisticasDisciplina;
GO

CREATE VIEW [futebol].[vw_Clubes_Estilo_Jogo] AS
SELECT 
    c.nome AS clube,
    CAST(AVG(fec.posse_de_bola) AS DECIMAL(5,2)) AS media_posse_bola,
    CAST(AVG(fec.chutes_a_gol) AS DECIMAL(5,2)) AS media_chutes_a_gol,
    CASE 
        WHEN AVG(fec.posse_de_bola) >= 55 AND AVG(fec.chutes_a_gol) >= 5 THEN 'Ofensivo Dominante'
        WHEN AVG(fec.posse_de_bola) >= 55 AND AVG(fec.chutes_a_gol) < 5 THEN 'Posse sem Eficácia'
        WHEN AVG(fec.posse_de_bola) < 45 AND AVG(fec.chutes_a_gol) >= 5 THEN 'Contra-Ataque Eficaz'
        WHEN AVG(fec.posse_de_bola) < 45 AND AVG(fec.chutes_a_gol) < 5 THEN 'Defensivo'
        ELSE 'Equilibrado'
    END AS estilo_jogo
FROM futebol.Fato_Estatistica_Clube fec
LEFT JOIN futebol.Dim_Clube c ON fec.clube_id = c.clube_id
WHERE fec.posse_de_bola IS NOT NULL AND fec.chutes_a_gol IS NOT NULL
GROUP BY c.nome
HAVING COUNT(*) >= 5;
GO

CREATE VIEW [futebol].[vw_Clubes_Mais_Cartoes] AS
SELECT 
    c.nome AS clube,
    COUNT(*) AS total_cartoes,
    SUM(CASE WHEN fc.tipo_cartao LIKE '%Vermelho%' THEN 1 ELSE 0 END) AS vermelhos,
    SUM(CASE WHEN fc.tipo_cartao LIKE '%Amarelo%' THEN 1 ELSE 0 END) AS amarelos,
    CAST(SUM(CASE WHEN fc.tipo_cartao LIKE '%Vermelho%' THEN 1 ELSE 0 END) * 100.0 / NULLIF(COUNT(*), 0) AS DECIMAL(5,2)) AS indice_violencia
FROM futebol.Fato_Cartao fc
LEFT JOIN futebol.Dim_Clube c ON fc.clube_id = c.clube_id
WHERE c.nome IS NOT NULL
GROUP BY c.nome
HAVING COUNT(*) >= 10;
GO

CREATE VIEW [futebol].[vw_Comparacao_Posse_Clubes] AS
SELECT 
    c.nome AS clube,
    CAST(AVG(fec.posse_de_bola) AS DECIMAL(5,2)) AS media_posse_bola,
    COUNT(*) AS partidas_analisadas,
    SUM(CASE WHEN fec.posse_de_bola > 60 THEN 1 ELSE 0 END) AS partidas_alta_posse,
    SUM(CASE WHEN fec.posse_de_bola < 40 THEN 1 ELSE 0 END) AS partidas_baixa_posse
FROM futebol.Fato_Estatistica_Clube fec
LEFT JOIN futebol.Dim_Clube c ON fec.clube_id = c.clube_id
WHERE fec.posse_de_bola IS NOT NULL
GROUP BY c.nome;
GO

CREATE VIEW [futebol].[vw_Eficiencia_Ofensiva] AS
SELECT 
    c.nome AS clube,
    CAST(AVG(fec.posse_de_bola) AS DECIMAL(5,2)) AS media_posse_bola,
    CAST(AVG(fec.chutes_a_gol) AS DECIMAL(5,2)) AS media_chutes_a_gol,
    CAST(AVG(fec.chutes_a_gol) / NULLIF(AVG(fec.posse_de_bola), 0) * 100 AS DECIMAL(5,2)) AS indice_eficiencia
FROM futebol.Fato_Estatistica_Clube fec
LEFT JOIN futebol.Dim_Clube c ON fec.clube_id = c.clube_id
WHERE fec.posse_de_bola > 0 AND fec.chutes_a_gol IS NOT NULL
GROUP BY c.nome
HAVING COUNT(*) >= 3;
GO

CREATE   VIEW [futebol].[vw_Gols_Por_Minuto_Clube]
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

CREATE VIEW [futebol].[vw_Impacto_Jogador] AS
WITH EstatisticasJogadores AS (
    SELECT 
        a.nome AS atleta,
        c.nome AS clube,
        COUNT(*) AS total_gols,
        -- Gols que resultaram em empate
        SUM(CASE 
            WHEN (fg.clube_id = fp.mandante_id AND fp.mandante_placar = fp.visitante_placar) OR
                 (fg.clube_id = fp.visitante_id AND fp.visitante_placar = fp.mandante_placar) THEN 1 
            ELSE 0 
        END) AS gols_empate,
        
        -- Gols que resultaram em virada
        SUM(CASE 
            WHEN (fg.clube_id = fp.mandante_id AND fp.mandante_placar > fp.visitante_placar AND fg.minuto IS NOT NULL AND TRY_CAST(fg.minuto AS INT) > 0) OR
                 (fg.clube_id = fp.visitante_id AND fp.visitante_placar > fp.mandante_placar AND fg.minuto IS NOT NULL AND TRY_CAST(fg.minuto AS INT) > 0) THEN 1 
            ELSE 0 
        END) AS gols_virada,
        
        -- Gols de abertura (primeiro gol da partida)
        SUM(CASE 
            WHEN fg.minuto IS NOT NULL AND TRY_CAST(fg.minuto AS INT) <= 20 THEN 1 
            ELSE 0 
        END) AS gols_abertura
        
    FROM futebol.Fato_Gol fg
    LEFT JOIN futebol.Dim_Atleta a ON fg.atleta_id = a.atleta_id
    LEFT JOIN futebol.Dim_Clube c ON fg.clube_id = c.clube_id
    LEFT JOIN futebol.Fato_Partida fp ON fg.partida_id = fp.partida_id
    WHERE a.nome IS NOT NULL
    GROUP BY a.nome, c.nome
    HAVING COUNT(*) >= 3
)
SELECT 
    atleta,
    clube,
    gols_empate,
    gols_virada,
    gols_abertura,
    (gols_empate + gols_virada + gols_abertura) AS gols_decisivos
FROM EstatisticasJogadores;
GO

CREATE VIEW [futebol].[vw_Partidas_Estatisticas_Completas] AS
SELECT 
    fec.partida_id,
    c.nome AS clube,
    fec.posse_de_bola,
    fec.chutes_a_gol,
    CASE 
        WHEN fec.posse_de_bola >= 60 THEN 'Alta Posse'
        WHEN fec.posse_de_bola >= 40 THEN 'Média Posse'
        ELSE 'Baixa Posse'
    END AS classificacao_posse
FROM futebol.Fato_Estatistica_Clube fec
LEFT JOIN futebol.Dim_Clube c ON fec.clube_id = c.clube_id
WHERE fec.posse_de_bola IS NOT NULL AND fec.chutes_a_gol IS NOT NULL;
GO


CREATE VIEW [futebol].[vw_Posse_Bola_Clubes] AS
SELECT 
    c.nome AS clube,
    CAST(AVG(fec.posse_de_bola) AS DECIMAL(5,2)) AS media_posse_bola,
    CAST(MIN(fec.posse_de_bola) AS DECIMAL(5,2)) AS menor_posse_bola,
    CAST(MAX(fec.posse_de_bola) AS DECIMAL(5,2)) AS maior_posse_bola,
    COUNT(*) AS total_partidas_analisadas
FROM futebol.Fato_Estatistica_Clube fec
LEFT JOIN futebol.Dim_Clube c ON fec.clube_id = c.clube_id
WHERE fec.posse_de_bola IS NOT NULL
GROUP BY c.nome;
GO

CREATE VIEW [futebol].[vw_Posse_Bola_Partidas] AS
SELECT 
    fp.partida_id,
    c_mandante.nome AS clube_mandante,
    c_visitante.nome AS clube_visitante,
    fec_mandante.posse_de_bola AS posse_mandante,
    fec_visitante.posse_de_bola AS posse_visitante,
    fec_mandante.chutes_a_gol AS chutes_mandante,
    fec_visitante.chutes_a_gol AS chutes_visitante
FROM futebol.Fato_Partida fp
LEFT JOIN futebol.Fato_Estatistica_Clube fec_mandante 
    ON fp.partida_id = fec_mandante.partida_id 
LEFT JOIN futebol.Fato_Estatistica_Clube fec_visitante 
    ON fp.partida_id = fec_visitante.partida_id 
LEFT JOIN futebol.Dim_Clube c_mandante ON fec_mandante.clube_id = c_mandante.clube_id
LEFT JOIN futebol.Dim_Clube c_visitante ON fec_visitante.clube_id = c_visitante.clube_id
WHERE fec_mandante.posse_de_bola IS NOT NULL 
  AND fec_visitante.posse_de_bola IS NOT NULL
  AND fec_mandante.clube_id != fec_visitante.clube_id;
GO

CREATE VIEW [futebol].[vw_Possessao_Clube] AS
WITH EstatisticasPosse AS (
    SELECT 
        c.nome AS clube,
        COUNT(*) AS total_posse,
        COUNT(DISTINCT fec.partida_id) AS total_jogos,
        AVG(fec.posse_de_bola) AS posse_media_por_jogo
    FROM futebol.Fato_Estatistica_Clube fec
    LEFT JOIN futebol.Dim_Clube c ON fec.clube_id = c.clube_id
    WHERE fec.posse_de_bola IS NOT NULL
      AND c.nome IS NOT NULL
    GROUP BY c.nome
    HAVING COUNT(DISTINCT fec.partida_id) >= 5
)
SELECT 
    clube,
    total_posse,
    total_jogos,
    CAST(posse_media_por_jogo AS DECIMAL(5,2)) AS posse_media_por_jogo,
    RANK() OVER (ORDER BY posse_media_por_jogo DESC) AS ranking_posse
FROM EstatisticasPosse
WHERE clube IS NOT NULL
  AND total_posse IS NOT NULL
  AND total_jogos IS NOT NULL
  AND posse_media_por_jogo IS NOT NULL;
GO

CREATE VIEW [futebol].[vw_TempoMedio_Gol_Clube] AS
SELECT 
    c.nome AS clube,
    COUNT(*) AS total_gols,
    CAST(AVG(CAST(fg.minuto AS FLOAT)) AS DECIMAL(10,2)) AS media_minuto_gol,
    MIN(CAST(fg.minuto AS INT)) AS gol_mais_rapido,
    MAX(CAST(fg.minuto AS INT)) AS gol_mais_tardio
FROM futebol.Fato_Gol fg
LEFT JOIN futebol.Dim_Clube c ON fg.clube_id = c.clube_id
WHERE fg.minuto IS NOT NULL 
  AND TRY_CAST(fg.minuto AS INT) IS NOT NULL
  AND c.nome IS NOT NULL
GROUP BY c.nome
HAVING COUNT(*) >= 5;
GO

CREATE   VIEW [futebol].[vw_Vitorias_Menor_Possessao]
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


