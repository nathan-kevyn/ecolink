
CREATE TABLE Usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    idade INT,
    telefone VARCHAR(20),
    cpf CHAR(11) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    cep CHAR(8) NOT NULL,
    logradouro VARCHAR(100),
    numero VARCHAR(10),
    complemento VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_usuario_email ON Usuario(email);
CREATE INDEX idx_usuario_cpf ON Usuario(cpf);

CREATE TABLE Empresa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cnpj CHAR(14) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    razao_social VARCHAR(100) NOT NULL,
    nome_fantasia VARCHAR(100),
    telefone VARCHAR(20),
    cep CHAR(8),
    logradouro VARCHAR(100),
    numero VARCHAR(10),
    complemento VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado CHAR(2),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    CHECK (tipo IN ('Corporativa', 'Comerciante'))
);

CREATE INDEX idx_empresa_cnpj ON Empresa(cnpj);
CREATE INDEX idx_empresa_nome ON Empresa(nome_fantasia);

CREATE TABLE ResponsavelEmpresa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    empresa_id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    cargo VARCHAR(50),
    principal TINYINT(1) DEFAULT 1,
    FOREIGN KEY (empresa_id) REFERENCES Empresa(id) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE INDEX idx_responsavel_email ON ResponsavelEmpresa(email);

CREATE TABLE TipoResiduo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT,
    icone VARCHAR(50),
    categoria VARCHAR(50)
);

CREATE UNIQUE INDEX idx_tipo_residuo_nome ON TipoResiduo(nome);

CREATE TABLE UnidadeMedida (
    id INT PRIMARY KEY AUTO_INCREMENT,
    sigla VARCHAR(5) NOT NULL,
    descricao VARCHAR(50) NOT NULL
);

CREATE UNIQUE INDEX idx_unidade_sigla ON UnidadeMedida(sigla);

CREATE TABLE PontoColeta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    cep CHAR(8),
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL,
    horario_funcionamento VARCHAR(100),
    responsavel VARCHAR(100),
    nota DECIMAL(3,2) DEFAULT 0,
    latitude DECIMAL(10,8),
    longitude DECIMAL(11,8),
    ativo TINYINT(1) DEFAULT 1,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_ponto_cidade ON PontoColeta(cidade);
CREATE INDEX idx_ponto_estado ON PontoColeta(estado);
CREATE INDEX idx_ponto_geo ON PontoColeta(latitude, longitude);

CREATE TABLE PontoColetaTipoResiduo (
    ponto_coleta_id INT NOT NULL,
    tipo_residuo_id INT NOT NULL,
    PRIMARY KEY (ponto_coleta_id, tipo_residuo_id),
    FOREIGN KEY (ponto_coleta_id) REFERENCES PontoColeta(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (tipo_residuo_id) REFERENCES TipoResiduo(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Agendamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    empresa_id INT,
    ponto_coleta_id INT NOT NULL,
    data_hora DATETIME NOT NULL,
    status VARCHAR(20) DEFAULT 'Agendado',
    observacoes TEXT,
    data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
        ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (empresa_id) REFERENCES Empresa(id)
        ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (ponto_coleta_id) REFERENCES PontoColeta(id)
        ON DELETE NO ACTION ON UPDATE CASCADE

);

CREATE INDEX idx_agendamento_data ON Agendamento(data_hora);
CREATE INDEX idx_agendamento_status ON Agendamento(status);

CREATE TABLE AgendamentoItem (
    id INT PRIMARY KEY AUTO_INCREMENT,
    agendamento_id INT NOT NULL,
    tipo_residuo_id INT NOT NULL,
    unidade_medida_id INT NOT NULL,
    quantidade DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (agendamento_id) REFERENCES Agendamento(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (tipo_residuo_id) REFERENCES TipoResiduo(id)
        ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (unidade_medida_id) REFERENCES UnidadeMedida(id)
        ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE INDEX idx_agendamento_item ON AgendamentoItem(agendamento_id);

CREATE TABLE Avaliacao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    empresa_id INT,
    ponto_coleta_id INT NOT NULL,
    nota DECIMAL(2,1) NOT NULL,
    comentario TEXT,
    data_avaliacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
        ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (empresa_id) REFERENCES Empresa(id)
        ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (ponto_coleta_id) REFERENCES PontoColeta(id)
        ON DELETE NO ACTION ON UPDATE CASCADE

);

CREATE INDEX idx_avaliacao_ponto ON Avaliacao(ponto_coleta_id);
CREATE INDEX idx_avaliacao_data ON Avaliacao(data_avaliacao);

CREATE TABLE HistoricoReciclagem (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    empresa_id INT,
    ponto_coleta_id INT,
    tipo_residuo_id INT NOT NULL,
    unidade_medida_id INT NOT NULL,
    data_reciclagem DATETIME NOT NULL,
    quantidade DECIMAL(10,2) NOT NULL,
    agendamento_id INT,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
        ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (empresa_id) REFERENCES Empresa(id)
        ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (ponto_coleta_id) REFERENCES PontoColeta(id)
        ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (tipo_residuo_id) REFERENCES TipoResiduo(id)
        ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (unidade_medida_id) REFERENCES UnidadeMedida(id)
        ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (agendamento_id) REFERENCES Agendamento(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
    
);

CREATE INDEX idx_historico_usuario ON HistoricoReciclagem(usuario_id);
CREATE INDEX idx_historico_empresa ON HistoricoReciclagem(empresa_id);
CREATE INDEX idx_historico_data ON HistoricoReciclagem(data_reciclagem);
