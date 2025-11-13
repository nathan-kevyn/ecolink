CREATE TABLE futebol.Fato_Partida (
    partida_id INT PRIMARY KEY,
    rodada INT,
    data_partida DATE,
    mandante_id INT,
    visitante_id INT,
    tecnico_mandante_id INT,
    tecnico_visitante_id INT,
    vencedor_id INT NULL,
    arena_id INT,
    mandante_placar INT,
    visitante_placar INT,
    mandante_estado NVARCHAR(50),
    visitante_estado NVARCHAR(50),
    CONSTRAINT FK_Partida_Mandante FOREIGN KEY (mandante_id) REFERENCES futebol.Dim_Clube(clube_id),
    CONSTRAINT FK_Partida_Visitante FOREIGN KEY (visitante_id) REFERENCES futebol.Dim_Clube(clube_id),
    CONSTRAINT FK_Partida_Vencedor FOREIGN KEY (vencedor_id) REFERENCES futebol.Dim_Clube(clube_id),
    CONSTRAINT FK_Partida_TecMand FOREIGN KEY (tecnico_mandante_id) REFERENCES futebol.Dim_Tecnico(tecnico_id),
    CONSTRAINT FK_Partida_TecVis FOREIGN KEY (tecnico_visitante_id) REFERENCES futebol.Dim_Tecnico(tecnico_id),
    CONSTRAINT FK_Partida_Arena FOREIGN KEY (arena_id) REFERENCES futebol.Dim_Arena(arena_id),
    CONSTRAINT FK_Partida_Tempo FOREIGN KEY (data_partida) REFERENCES futebol.Dim_Tempo(data_partida)
);

CREATE TABLE futebol.Fato_Estatistica_Clube (
    estatistica_id INT IDENTITY(1,1) PRIMARY KEY,
    partida_id INT NOT NULL,
    clube_id INT NOT NULL,
    chutes INT,
    chutes_a_gol INT,
    posse_de_bola DECIMAL(5,2),
    passes INT,
    precisao_passes DECIMAL(5,2),
    faltas INT,
    cartoes_amarelos INT,
    cartoes_vermelhos INT,
    impedimentos INT,
    escanteios INT,
    CONSTRAINT FK_Estatistica_Partida FOREIGN KEY (partida_id) REFERENCES futebol.Fato_Partida(partida_id),
    CONSTRAINT FK_Estatistica_Clube FOREIGN KEY (clube_id) REFERENCES futebol.Dim_Clube(clube_id)
);

CREATE TABLE futebol.Fato_Gol (
    gol_id INT IDENTITY(1,1) PRIMARY KEY,
    partida_id INT NOT NULL,
    clube_id INT NOT NULL,
    atleta_id INT NULL,
    minuto INT,
    tipo_gol NVARCHAR(50) NULL,
    CONSTRAINT FK_Gol_Partida FOREIGN KEY (partida_id) REFERENCES futebol.Fato_Partida(partida_id),
    CONSTRAINT FK_Gol_Clube FOREIGN KEY (clube_id) REFERENCES futebol.Dim_Clube(clube_id),
    CONSTRAINT FK_Gol_Atleta FOREIGN KEY (atleta_id) REFERENCES futebol.Dim_Atleta(atleta_id)
);

CREATE TABLE futebol.Fato_Cartao (
    cartao_id INT IDENTITY(1,1) PRIMARY KEY,
    partida_id INT NOT NULL,
    clube_id INT NULL,
    atleta_id INT NULL,
    tipo_cartao NVARCHAR(20) NULL,
    minuto INT NULL,
    FOREIGN KEY (partida_id) REFERENCES futebol.Fato_Partida(partida_id),
    FOREIGN KEY (clube_id) REFERENCES futebol.Dim_Clube(clube_id),
    FOREIGN KEY (atleta_id) REFERENCES futebol.Dim_Atleta(atleta_id)
);

CREATE INDEX IX_Fato_Partida_Data ON futebol.Fato_Partida(data_partida);
CREATE INDEX IX_Fato_Estatistica_Partida ON futebol.Fato_Estatistica_Clube(partida_id);
CREATE INDEX IX_Fato_Gol_Minuto ON futebol.Fato_Gol(minuto);

