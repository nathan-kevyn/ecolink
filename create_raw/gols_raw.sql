CREATE TABLE futebol.gols_raw (
    partida_id INT NULL,
    rodada INT NULL,
    clube NVARCHAR(200) NULL,
    atleta NVARCHAR(200) NULL,
    minuto NVARCHAR(50) NULL,  -- '45+2', '90+1' ou número -> tratar depois
    tipo_gol NVARCHAR(100) NULL,  -- se houver (ex: 'pênalti', 'contra', etc.)
);