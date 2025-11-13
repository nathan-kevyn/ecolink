CREATE TABLE IF NOT EXISTS futebol.Log_AtualizacaoPlacar (
    id INT IDENTITY(1,1) PRIMARY KEY,
    partida_id INT,
    data_atualizacao DATETIME DEFAULT GETDATE(),
    usuario NVARCHAR(100),
    mandante_placar_old INT,
    visitante_placar_old INT,
    mandante_placar_new INT,
    visitante_placar_new INT
);
GO

CREATE OR ALTER TRIGGER futebol.trg_Auditoria_AtualizacaoPlacar
ON futebol.Fato_Partida
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO futebol.Log_AtualizacaoPlacar (
        partida_id,
        usuario,
        mandante_placar_old, visitante_placar_old,
        mandante_placar_new, visitante_placar_new
    )
    SELECT 
        i.partida_id,
        SYSTEM_USER,
        d.mandante_placar, d.visitante_placar,
        i.mandante_placar, i.visitante_placar
    FROM deleted d
    INNER JOIN inserted i ON d.partida_id = i.partida_id
    WHERE 
        ISNULL(d.mandante_placar, -1) <> ISNULL(i.mandante_placar, -1)
        OR ISNULL(d.visitante_placar, -1) <> ISNULL(i.visitante_placar, -1);
END;
GO
-------------------TESTE----------------------------------------------------------------
UPDATE futebol.Fato_Partida
SET mandante_placar = mandante_placar + 1
WHERE partida_id = 123;
SELECT * FROM futebol.Log_AtualizacaoPlacar;
-----------------------------------------------------------------------------------------
CREATE OR ALTER TRIGGER futebol.trg_Prevent_Delete_Partida
ON futebol.Fato_Partida
INSTEAD OF DELETE
AS
BEGIN
    PRINT '❌ Exclusão de partidas não permitida para manter integridade histórica.';
END;
GO
-----------------------------TESTE----------------------------------
DELETE FROM futebol.Fato_Partida WHERE partida_id = 1;

Teste--
SELECT * FROM futebol.Fato_Partida WHERE Partida_ID = 1;

