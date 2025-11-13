ALTER PROCEDURE [futebol].[sp_Analise_Jogadores_Cartoes_Finais]
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
----------------------------------------------------------------------------------
ALTER PROCEDURE [futebol].[sp_Arenas_Mais_Empates]
    @TopN INT = 10
AS
BEGIN
    SELECT TOP (@TopN) *
    FROM [futebol].[vw_Analise_04_Arenas_Empates]
    ORDER BY total_empates DESC;
END;
---------------------------------------------------------------------------------------
ALTER PROCEDURE [futebol].[sp_Clubes_Disciplina]
    @Tipo VARCHAR(20) = 'AMBOS' -- 'DISCIPLINADOS', 'INDISCIPLINADOS', 'AMBOS'
AS
BEGIN
    IF @Tipo = 'DISCIPLINADOS'
        SELECT TOP 10 *
        FROM [futebol].[vw_Clubes_Disciplina_Ranking]
        ORDER BY ranking_disciplina;
    
    ELSE IF @Tipo = 'INDISCIPLINADOS'
        SELECT TOP 10 *
        FROM [futebol].[vw_Clubes_Disciplina_Ranking]
        ORDER BY ranking_indisciplina;
    
    ELSE
        SELECT *
        FROM [futebol].[vw_Clubes_Disciplina_Ranking]
        ORDER BY total_cartoes DESC;
END;
------------------------------------------------------------------------------------
ALTER PROCEDURE [futebol].[sp_Jogadores_Virada]
    @TopN INT = 10
AS
BEGIN
    SELECT TOP (@TopN) *
    FROM [futebol].[vw_Impacto_Jogador]
    ORDER BY gols_decisivos DESC;
END;
