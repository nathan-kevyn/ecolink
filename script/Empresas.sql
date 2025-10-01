-- ------------------------------
-- 1. Empresas (Recicladoras / Gerenciadoras de Resíduos) - 10 Entidades
-- ------------------------------
SET IDENTITY_INSERT Empresa ON;
INSERT INTO Empresa (id, nome, cnpj, tipo_servico, email_contato, telefone)
VALUES 
(1, 'EcoGiro Soluções Ambientais', '01.123.456/0001-89', 'Coleta Seletiva e Beneficiamento', 'contato@ecogiro.com.br', '(11) 3000-1000'),
(2, 'Recicla+ Gestão de Resíduos', '02.987.654/0001-21', 'Tratamento de Resíduos Industriais e Volumosos', 'comercial@reciclamais.com.br', '(11) 3000-2000'),
(3, 'Sustenta SP Coleta Inteligente', '03.333.333/0001-33', 'Logística Reversa de Eletrônicos', 'faleconosco@sustentasp.com.br', '(11) 3000-3000'),
(4, 'GreenCycle Logística Reversa', '04.444.444/0001-44', 'Reciclagem de Plásticos e Metais de Alta Densidade', 'atendimento@greencycle.com.br', '(11) 3000-4000'),
(5, 'Metrópole Ambiental S/A', '05.555.555/0001-55', 'Destinação Final e Triagem de Resíduos Sólidos Urbanos', 'contato@metropoleambiental.com.br', '(11) 3000-5000'),
(6, 'Zelo Resíduos Especiais', '06.666.666/0001-66', 'Gerenciamento de Resíduos de Serviços de Saúde (RSS)', 'rrs@zeloresiduos.com.br', '(11) 3000-6000'),
(7, 'TransPorte Limpo SP', '07.777.777/0001-77', 'Transporte e Disposição de Entulhos', 'logistica@transportelimpo.com.br', '(11) 3000-7000'),
(8, 'Reutiliza Já! Cooperativa', '08.888.888/0001-88', 'Cooperativa de Catadores e Beneficiamento de Secos', 'contato@reutilizaja.org.br', '(11) 3000-8000'),
(9, 'Central de Triagem Oeste', '09.999.999/0001-99', 'Triagem de Materiais Recicláveis', 'comercial@triagemoeste.com.br', '(11) 3000-9000'),
(10, 'BioDestino Tratamento', '10.101.101/0001-10', 'Compostagem e Tratamento de Orgânicos', 'info@biodestino.com.br', '(11) 3000-0000');
SET IDENTITY_INSERT Empresa OFF;