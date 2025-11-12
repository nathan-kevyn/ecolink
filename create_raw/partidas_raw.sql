CREATE TABLE futebol.partidas_raw (
    partida_id INT NULL,       -- pode existir no CSV principal
    rodada INT NULL,
    data_partida NVARCHAR(50) NULL, -- se houver coluna de data
    dia NVARCHAR(50) NULL,     -- "Dia" (dia da semana)
    mandante NVARCHAR(200) NULL,
    visitante NVARCHAR(200) NULL,
    formacao_mandante NVARCHAR(100) NULL,
    formacao_visitante NVARCHAR(100) NULL,
    tecnico_mandante NVARCHAR(200) NULL,
    tecnico_visitante NVARCHAR(200) NULL,
    vencedor NVARCHAR(200) NULL, -- '-' = empate
    arena NVARCHAR(200) NULL,
    mandante_placar INT NULL,
    visitante_placar INT NULL,
    mandante_estado NVARCHAR(100) NULL,
    visitante_estado NVARCHAR(100) NULL,
);

