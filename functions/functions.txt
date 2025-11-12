use BrasileiraoDB

CREATE OR ALTER FUNCTION futebol.fn_MediaGolsPorPartida (@clube_id INT)
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @media DECIMAL(10,2);

    SELECT @media = 
        CAST(SUM(CASE 
            WHEN mandante_id = @clube_id THEN mandante_placar
            WHEN visitante_id = @clube_id THEN visitante_placar
            ELSE 0 
        END) AS DECIMAL(10,2)) / COUNT(DISTINCT partida_id)
    FROM futebol.Fato_Partida
    WHERE mandante_id = @clube_id OR visitante_id = @clube_id;

    RETURN @media;
END;
GO

CREATE OR ALTER FUNCTION futebol.fn_CartoesAmarelosJogador (@atleta_id INT)
RETURNS INT
AS
BEGIN
    DECLARE @cartoes_amarelos INT;

    SELECT @cartoes_amarelos = COUNT(*)
    FROM futebol.Fato_Cartao
    WHERE atleta_id = @atleta_id AND tipo_cartao = 'Amarelo';

    RETURN @cartoes_amarelos;
END;
GO


SELECT futebol.fn_MediaGolsPorPartida(111) AS MediaGols;  -- Troque '1' pelo ID do clube
SELECT futebol.fn_CartoesAmarelosJogador(91) AS CartoesAmarelos;  -- Troque '100' pelo ID do jogador

------PARA TESTE O CLUBE ID COMEÇA NO 91 E VAI ATÉ 135---
------PARA TESTE O ATLETA ID COMEÇA NO 3065 E VAI ATÉ 4596---
------ESQUECI DE RESETAR AS ID NOS TESTE DE INSERÇÃO RS----

SELECT clube_id, nome
FROM futebol.Dim_Clube;
