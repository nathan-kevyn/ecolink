CREATE TABLE futebol.estatisticas_raw (
    partida_id INT NULL,
    rodada INT NULL,
    clube NVARCHAR(200) NULL,
    chutes INT NULL,
    chutes_a_gol INT NULL,
    posse_de_bola NVARCHAR(20) NULL,   -- ex: '54%' -> tratar no ETL
    passes INT NULL,
    precisao_passes NVARCHAR(20) NULL, -- ex: '82%' -> tratar no ETL
    faltas INT NULL,
    cartao_amarelo INT NULL,
    cartao_vermelho INT NULL,
    impedimentos INT NULL,
    escanteios INT NULL,
    tempo_ativo NVARCHAR(50) NULL,     -- caso exista
    outros NVARCHAR(MAX) NULL,
    raw_line NVARCHAR(MAX) NULL
);
