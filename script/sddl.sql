-- =============================
-- TABELA: Usuario
-- =============================
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
    data_cadastro DATETIME NOT NULL DEFAULT GETDATE()
);
CREATE NONCLUSTERED INDEX idx_usuario_email ON Usuario(email);
CREATE NONCLUSTERED INDEX idx_usuario_cpf ON Usuario(cpf);
CREATE NONCLUSTERED INDEX idx_usuario_cidade ON Usuario(cidade);

-- =============================
-- TABELA: Empresa
-- =============================
CREATE TABLE Empresa (
    id INT PRIMARY KEY IDENTITY(1,1),
    cnpj CHAR(14) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    tipo VARCHAR(20) NOT NULL CHECK (tipo IN ('Corporativa', 'Comerciante')),
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
    data_cadastro DATETIME NOT NULL DEFAULT GETDATE()
);
CREATE NONCLUSTERED INDEX idx_empresa_cnpj ON Empresa(cnpj);
CREATE NONCLUSTERED INDEX idx_empresa_nome ON Emp
