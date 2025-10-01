-- ============================
-- TABELA: Usuario
-- ============================
CREATE TABLE Usuario (
    id INT PRIMARY KEY IDENTITY(1,1),
    email VARCHAR(100) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    idade INT NULL,
    telefone VARCHAR(20) NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    cep CHAR(8) NOT NULL,
    logradouro VARCHAR(100) NULL,
    numero VARCHAR(10) NULL,
    complemento VARCHAR(50) NULL,
    bairro VARCHAR(50) NULL,
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL,
    data_cadastro DATETIME DEFAULT GETDATE()
);

-- ============================
-- TABELA: Empresa
-- ============================
CREATE TABLE Empresa (
    id INT PRIMARY KEY IDENTITY(1,1),
    cnpj CHAR(14) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    tipo VARCHAR(20) NOT NULL CHECK (tipo IN ('Corporativa','Comerciante')),
    razao_social VARCHAR(100) NOT NULL,
    nome_fantasia VARCHAR(100) NULL,
    telefone VARCHAR(20) NULL,
    cep CHAR(8) NULL,
    logradouro VARCHAR(100) NULL,
    numero VARCHAR(10) NULL,
    complemento VARCHAR(50) NULL,
    bairro VARCHAR(50) NULL,
    cidade VARCHAR(50) NULL,
    estado CHAR(2) NULL,
    data_cadastro DATETIME DEFAULT GETDATE()
);

-- ============================
-- TABELA: ResponsavelEmpresa
-- ============================
CREATE TABLE ResponsavelEmpresa (
    id INT PRIMARY KEY IDENTITY(1,1),
    empresa_id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NULL,
    cargo VARCHAR(50) NULL,
    principal BIT DEFAULT 1,
    FOREIGN KEY (empresa_id) REFERENCES Empresa(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================
-- TABELA: TipoResiduo
-- ============================
CREATE TABLE TipoResiduo (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(50) NOT NULL UNIQUE,
    descricao TEXT NULL,
    icone VARCHAR(50) NULL,
    categoria VARCHAR(50) NULL
);

-- ============================
-- TABELA: UnidadeMedida
-- ============================
CREATE TABLE UnidadeMedida (
    id INT PRIMARY KEY IDENTITY(1,1),
    sigla VARCHAR(5) NOT NULL UNIQUE,
    descricao VARCHAR(50) NOT NULL
);

-- ============================
-- TABELA: PontoColeta
-- ============================
CREATE TABLE PontoColeta (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    cep CHAR(8) NULL,
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL,
    horario_funcionamento VARCHAR(100) NULL,
    responsavel VARCHAR(100) NULL,
    nota DECIMAL(3,2) DEFAULT 0,
    latitude DECIMAL(10,8) NULL,
    longitude DECIMAL(11,8) NULL,
    ativo BIT DEFAULT 1,
    data_cadastro DATETIME DEFAULT GETDATE()
);

-- ============================
-- TABELA: PontoColetaTipoResiduo
-- ============================
CREATE TABLE PontoColetaTipoResiduo (
    ponto_coleta_id INT NOT NULL,
    tipo_residuo_id INT NOT NULL,
    PRIMARY KEY (ponto_coleta_id, tipo_residuo_id),
    FOREIGN KEY (ponto_coleta_id) REFERENCES PontoColeta(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (tipo_residuo_id) REFERENCES TipoResiduo(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================
-- TABELA: Agendamento
-- ============================
CREATE TABLE Agendamento (
    id INT PRIMARY KEY IDENTITY(1,1),
    usuario_id INT NULL,
    empresa_id INT NULL,
    ponto_coleta_id INT NOT NULL,
    data_hora DATETIME NOT NULL,
    status VARCHAR(20) DEFAULT 'Agendado',
    observacoes TEXT NULL,
    data_criacao DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (empresa_id) REFERENCES Empresa(id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (ponto_coleta_id) REFERENCES PontoColeta(id) ON DELETE NO ACTION ON UPDATE CASCADE
);

-- ============================
-- TABELA: AgendamentoItem
-- ============================
CREATE TABLE AgendamentoItem (
    id INT PRIMARY KEY IDENTITY(1,1),
    agendamento_id INT NOT NULL,
    tipo_residuo_id INT NOT NULL,
    unidade_medida_id INT NOT NULL,
    quantidade DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (agendamento_id) REFERENCES Agendamento(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (tipo_residuo_id) REFERENCES TipoResiduo(id) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (unidade_medida_id) REFERENCES UnidadeMedida(id) ON DELETE NO ACTION ON UPDATE CASCADE
);

-- ============================
-- TABELA: Avaliacao
-- ============================
CREATE TABLE Avaliacao (
    id INT PRIMARY KEY IDENTITY(1,1),
    usuario_id INT NULL,
    empresa_id INT NULL,
    ponto_coleta_id INT NOT NULL,
    nota DECIMAL(2,1) NOT NULL,
    comentario TEXT NULL,
    data_avaliacao DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (empresa_id) REFERENCES Empresa(id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (ponto_coleta_id) REFERENCES PontoColeta(id) ON DELETE NO ACTION ON UPDATE CASCADE
);

-- ============================
-- TABELA: HistoricoReciclagem
-- ============================
CREATE TABLE HistoricoReciclagem (
    id INT PRIMARY KEY IDENTITY(1,1),
    usuario_id INT NULL,
    empresa_id INT NULL,
    ponto_coleta_id INT NULL,
    tipo_residuo_id INT NOT NULL,
    unidade_medida_id INT NOT NULL,
    data_reciclagem DATETIME NOT NULL,
    quantidade DECIMAL(10,2) NOT NULL,
    agendamento_id INT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (empresa_id) REFERENCES Empresa(id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (ponto_coleta_id) REFERENCES PontoColeta(id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (tipo_residuo_id) REFERENCES TipoResiduo(id) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (unidade_medida_id) REFERENCES UnidadeMedida(id) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (agendamento_id) REFERENCES Agendamento(id) ON DELETE NO ACTION ON UPDATE NO ACTION
);
