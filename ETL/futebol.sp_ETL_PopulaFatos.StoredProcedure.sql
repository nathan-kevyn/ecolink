
ALTER   PROCEDURE [futebol].[sp_ETL_PopulaFatos]
AS
BEGIN
    SET NOCOUNT ON;
    PRINT '🚀 Iniciando ETL das tabelas FATO...';

    ---------------------------------------------------
    -- 1. FATO_PARTIDA
    ---------------------------------------------------
    MERGE futebol.Fato_Partida AS destino
    USING (
        SELECT DISTINCT
            p.partida_id,
            p.rodada,
            cm.clube_id AS mandante_id,
            cv.clube_id AS visitante_id,
            tm.tecnico_id AS tecnico_mandante_id,
            tv.tecnico_id AS tecnico_visitante_id,
            cw.clube_id AS vencedor_id,
            a.arena_id,
            t.tempo_id,
            p.mandante_placar,
            p.visitante_placar
        FROM futebol.partidas_raw p
        LEFT JOIN futebol.Dim_Clube cm ON cm.nome = LTRIM(RTRIM(p.mandante))
        LEFT JOIN futebol.Dim_Clube cv ON cv.nome = LTRIM(RTRIM(p.visitante))
        LEFT JOIN futebol.Dim_Tecnico tm ON tm.nome = LTRIM(RTRIM(p.tecnico_mandante))
        LEFT JOIN futebol.Dim_Tecnico tv ON tv.nome = LTRIM(RTRIM(p.tecnico_visitante))
        LEFT JOIN futebol.Dim_Clube cw ON cw.nome = LTRIM(RTRIM(p.vencedor))
        LEFT JOIN futebol.Dim_Arena a ON a.nome = LTRIM(RTRIM(p.arena))
        LEFT JOIN futebol.Dim_Tempo t ON t.data_partida = TRY_CAST(p.data_partida AS DATE)
    ) AS origem
    ON destino.partida_id = origem.partida_id
    WHEN NOT MATCHED THEN
        INSERT (partida_id, rodada, mandante_id, visitante_id, tecnico_mandante_id, tecnico_visitante_id, vencedor_id, arena_id, tempo_id, mandante_placar, visitante_placar)
        VALUES (origem.partida_id, origem.rodada, origem.mandante_id, origem.visitante_id, origem.tecnico_mandante_id, origem.tecnico_visitante_id, origem.vencedor_id, origem.arena_id, origem.tempo_id, origem.mandante_placar, origem.visitante_placar);

    PRINT '✅ Fato_Partida populada.';

    ---------------------------------------------------
    -- 2. FATO_ESTATISTICA_CLUBE
    ---------------------------------------------------
    MERGE futebol.Fato_Estatistica_Clube AS destino
    USING (
        SELECT DISTINCT
            e.partida_id,
            c.clube_id,
            TRY_CAST(e.chutes_a_gol AS INT) AS chutes_a_gol,
            TRY_CAST(REPLACE(e.posse_de_bola, '%', '') AS DECIMAL(5,2)) AS posse_de_bola
        FROM futebol.estatisticas_raw e
        LEFT JOIN futebol.Dim_Clube c ON c.nome = LTRIM(RTRIM(e.clube))
        WHERE e.partida_id IS NOT NULL
    ) AS origem
    ON destino.partida_id = origem.partida_id AND destino.clube_id = origem.clube_id
    WHEN NOT MATCHED THEN
        INSERT (partida_id, clube_id, chutes_a_gol, posse_de_bola)
        VALUES (origem.partida_id, origem.clube_id, origem.chutes_a_gol, origem.posse_de_bola);

    PRINT '✅ Fato_Estatistica_Clube populada.';

    ---------------------------------------------------
    -- 3. FATO_GOL
    ---------------------------------------------------
    MERGE futebol.Fato_Gol AS destino
    USING (
        SELECT DISTINCT
            g.partida_id,
            c.clube_id,
            a.atleta_id,
            g.minuto,
            g.tipo_gol
        FROM futebol.gols_raw g
        LEFT JOIN futebol.Dim_Clube c ON c.nome = LTRIM(RTRIM(g.clube))
        LEFT JOIN futebol.Dim_Atleta a ON a.nome = LTRIM(RTRIM(g.atleta))
        WHERE g.partida_id IS NOT NULL
    ) AS origem
    ON destino.partida_id = origem.partida_id
       AND destino.clube_id = origem.clube_id
       AND destino.atleta_id = origem.atleta_id
       AND destino.minuto = origem.minuto
    WHEN NOT MATCHED THEN
        INSERT (partida_id, clube_id, atleta_id, minuto, tipo_gol)
        VALUES (origem.partida_id, origem.clube_id, origem.atleta_id, origem.minuto, origem.tipo_gol);

    PRINT '✅ Fato_Gol populada.';
    ---------------------------------------------------
    -- 4. FATO_CARTÃO
    ---------------------------------------------------
        INSERT INTO futebol.Fato_Cartao (partida_id, clube_id, atleta_id, tipo_cartao, minuto)
SELECT 
    c.partida_id,
    dc.clube_id,
    da.atleta_id,
    c.cartao,
    TRY_CAST(c.minuto AS INT)
FROM futebol.cartoes_raw c
LEFT JOIN futebol.Dim_Clube dc 
    ON UPPER(REPLACE(REPLACE(REPLACE(dc.nome,'-',' '),'.',''),',','')) =
       UPPER(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(c.clube)),'-',' '),'.',''),',',''))
LEFT JOIN futebol.Dim_Atleta da 
    ON LTRIM(RTRIM(da.nome)) = LTRIM(RTRIM(c.atleta))
WHERE c.partida_id IS NOT NULL;

PRINT '✅ Fato_Cartao populada.';

    ------------------------------------------------------------
    -- Finalização
    ------------------------------------------------------------
    PRINT '🎯 ETL das Fatos concluído com sucesso!';
END;
