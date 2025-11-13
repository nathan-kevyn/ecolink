USE BrasileiraoDB;
GO

-- ============================================
-- ROLE 1: ANALISTA (somente leitura)
-- ============================================
CREATE ROLE role_analista AUTHORIZATION dbo;
GO

-- Permissão para SELECT em todas as tabelas e views
GRANT SELECT ON SCHEMA::futebol TO role_analista;
GO


-- ============================================
-- ROLE 2: OPERADOR ETL (pode executar ETL e atualizar dados)
-- ============================================
CREATE ROLE role_operador_etl AUTHORIZATION dbo;
GO

-- Permissão para executar procedures de ETL
GRANT EXECUTE ON OBJECT::futebol.sp_ETL_PopulaDimensoes TO role_operador_etl;
GRANT EXECUTE ON OBJECT::futebol.sp_ETL_PopulaFatos TO role_operador_etl;

-- Pode inserir e atualizar dados nas tabelas fato e dimensão
GRANT INSERT, UPDATE ON SCHEMA::futebol TO role_operador_etl;
GO


-- ============================================
-- ROLE 3: ADMINISTRADOR DE DADOS (acesso total)
-- ============================================
CREATE ROLE role_admin_dados AUTHORIZATION dbo;
GO

-- Permissões completas
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON SCHEMA::futebol TO role_admin_dados;
GO
