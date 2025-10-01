-- ------------------------------
-- 3. Pontos de Coleta (Ecopontos na Cidade de SP) - 10 Entidades
-- ------------------------------
-- Locais de referência para descarte voluntário em diversas Subprefeituras de SP.
SET IDENTITY_INSERT PontoColeta ON;
INSERT INTO PontoColeta (id, nome, endereco, subprefeitura, latitude, longitude, operadora)
VALUES
(1, 'Ecoponto Aricanduva - Viaduto Eng. Alberto Badra', 'Av. Aricanduva, 200 - Aricanduva, São Paulo - SP', 'Aricanduva/Formosa/Carrão', -23.5513, -46.5204, 'AMLURB/Prefeitura SP'),
(2, 'PEV Butantã / Jd. Maria do Carmo', 'R. Caminho do Engenho, 800 - Jd. Maria do Carmo, São Paulo - SP', 'Butantã', -23.5855, -46.7356, 'AMLURB/Prefeitura SP'),
(3, 'Ecoponto Sé / Glicério', 'Baixos do Viaduto Glicério - Sé, São Paulo - SP', 'Sé', -23.5582, -46.6293, 'AMLURB/Prefeitura SP'),
(4, 'Ecoponto Santo Dias', 'Travessa Rosifloras, 301 - Santo Dias, São Paulo - SP', 'Campo Limpo', -23.6591, -46.7570, 'AMLURB/Prefeitura SP'),
(5, 'Ecoponto Nova York', 'Rua Amália Vanso Magnólia - Vila Nova York, São Paulo - SP', 'Aricanduva/Formosa/Carrão', -23.5615, -46.5152, 'AMLURB/Prefeitura SP'),
(6, 'Ecoponto Jabaquara', 'Rua dos Comerciários, s/n - Jabaquara, São Paulo - SP', 'Jabaquara', -23.6521, -46.6375, 'AMLURB/Prefeitura SP'),
(7, 'Ecoponto Vila Maria', 'Rua do Imperador, 100 - Vila Maria, São Paulo - SP', 'Vila Maria/Vila Guilherme', -23.5118, -46.5925, 'AMLURB/Prefeitura SP'),
(8, 'Ecoponto Vila Prudente', 'Rua Doutor Roberto Feijó, 540 - Vila Prudente, São Paulo - SP', 'Vila Prudente', -23.5850, -46.5770, 'AMLURB/Prefeitura SP'),
(9, 'Ecoponto Pirituba', 'Rua Agrolândia, 120 - Pirituba, São Paulo - SP', 'Pirituba/Jaraguá', -23.4795, -46.7455, 'AMLURB/Prefeitura SP'),
(10, 'Ecoponto Sapopemba', 'Rua Engenheiro Guilherme Cristiano Frender, 800 - Sapopemba, São Paulo - SP', 'Sapopemba', -23.6067, -46.4950, 'AMLURB/Prefeitura SP');
SET IDENTITY_INSERT PontoColeta OFF;