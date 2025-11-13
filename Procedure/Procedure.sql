ALTER   PROCEDURE [futebol].[sp_Analise_Aproveitamento_Mandante_Visitante]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        c.nome AS clube,
        -- Aproveitamento como mandante
        CAST(ROUND(
            (1.0 * SUM(CASE WHEN f.vencedor_id = f.mandante_id THEN 1 
                            WHEN f.vencedor_id IS NULL THEN 0.5 ELSE 0 END)
            / NULLIF(COUNT(DISTINCT f.partida_id), 0)) * 100, 2) AS DECIMAL(5,2)
        ) AS aproveitamento_mandante,

        -- Aproveitamento como visitante
        CAST(ROUND(
            (1.0 * SUM(CASE WHEN f.vencedor_id = f.visitante_id THEN 1 
                            WHEN f.vencedor_id IS NULL THEN 0.5 ELSE 0 END)
            / NULLIF(COUNT(DISTINCT f.partida_id), 0)) * 100, 2) AS DECIMAL(5,2)
        ) AS aproveitamento_visitante
    FROM futebol.Fato_Partida f
    INNER JOIN futebol.Dim_Clube c 
        ON c.clube_id IN (f.mandante_id, f.visitante_id)
    GROUP BY c.nome
    ORDER BY c.nome;
END;
----------------------------------------------------------------------------------------------------------------
ALTER   PROCEDURE [futebol].[sp_Analise_Gols_Apos_85]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP 10
        clube,
        gols_finais
    FROM futebol.vw_Analise_05_Gols_Apos_85
    ORDER BY gols_finais DESC;
END;
-----------------------------------------------------------------------------------------------------------------------------
ALTER   PROCEDURE [futebol].[sp_Analise_Impacto_Jogador_Gols]
AS
BEGIN
    SET NOCOUNT ON;

    -- Seleção dos gols decisivos de jogadores
    WITH GolDecisivo AS (
        SELECT 
            g.partida_id,
            g.atleta_id,
            g.minuto,
            g.tipo_gol,
            p.mandante_placar AS placar_mandante_anterior,
            p.visitante_placar AS placar_visitante_anterior,
            -- Determina se o gol foi decisivo
            CASE 
                WHEN (p.mandante_placar = p.visitante_placar) THEN 'Empate' -- gol de empate
                WHEN (p.mandante_placar > p.visitante_placar) THEN 'Virada' -- gol de virada
            END AS tipo_gol_decisivo
        FROM futebol.Fato_Gol g
        LEFT JOIN futebol.Fato_Partida p ON g.partida_id = p.partida_id
    )
    -- Seleção final dos jogadores e seus gols decisivos
    SELECT
        a.nome AS atleta,
        SUM(CASE WHEN tipo_gol_decisivo = 'Empate' THEN 1 ELSE 0 END) AS gols_empate,
        SUM(CASE WHEN tipo_gol_decisivo = 'Virada' THEN 1 ELSE 0 END) AS gols_virada,
        COUNT(*) AS total_gols,
        CAST(ROUND(
            100.0 * SUM(CASE WHEN tipo_gol_decisivo IN ('Empate', 'Virada') THEN 1 ELSE 0 END) 
            / NULLIF(COUNT(*), 0), 2
        ) AS DECIMAL(5,2)) AS porcentagem_gols_decisivos
    FROM futebol.Dim_Atleta a
    JOIN GolDecisivo gd ON gd.atleta_id = a.atleta_id
    WHERE a.nome IS NOT NULL
    GROUP BY a.nome
    ORDER BY total_gols DESC;  -- Ordenando os jogadores pelo total de gols (em ordem decrescente)
END;
----------------------------------------------------------------------------------------------------------------------
ALTER   PROCEDURE [futebol].[sp_Analise_Jogadores_Cartoes_Finais]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP 10
        a.nome AS atleta,
        c.nome AS clube,
        COUNT(*) AS cartoes_finais
    FROM futebol.Fato_Cartao ca
    INNER JOIN futebol.Dim_Atleta a ON ca.atleta_id = a.atleta_id
    LEFT JOIN futebol.Dim_Clube c ON ca.clube_id = c.clube_id
    WHERE TRY_CAST(ca.minuto AS INT) >= 75
    GROUP BY a.nome, c.nome
    ORDER BY cartoes_finais DESC;
END;
-------------------------------------------------------------------------------------------------------------------------
ALTER   PROCEDURE [futebol].[sp_Analise_Media_Gols_Ano]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        ano,
        partidas,
        gols_totais,
        media_gols_partida
    FROM futebol.vw_Analise_02_Media_Gols_Ano
    ORDER BY ano;
END;