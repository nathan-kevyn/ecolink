CREATE TABLE futebol.Dim_Clube (
    clube_id INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(150) NOT NULL,
    estado NVARCHAR(50) NULL
);

CREATE TABLE futebol.Dim_Tecnico (
    tecnico_id INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(150) NOT NULL
);

CREATE TABLE futebol.Dim_Arena (
    arena_id INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(150) NOT NULL,
    cidade NVARCHAR(100) NULL,
    estado NVARCHAR(50) NULL
);

CREATE TABLE futebol.Dim_Atleta (
    atleta_id INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(150) NOT NULL,
    posicao NVARCHAR(100) NULL
);

CREATE TABLE futebol.Dim_Tempo (
    data_partida DATE PRIMARY KEY,
    ano INT,
    mes INT,
    dia INT,
    dia_semana NVARCHAR(20)
);

