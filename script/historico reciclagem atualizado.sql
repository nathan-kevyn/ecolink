
-- Script de Inserção de Dados - HistoricoReciclagem
-- Projeto EcoLink
-- Dados de 2020 e 2021
DECLARE @unidade_ton_id INT = (SELECT id FROM UnidadeMedida WHERE sigla = 'TON');

-- Inserções de 2020-01
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 10, 6, 9, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2020-01-01', 317183, 1 UNION ALL
SELECT 1, 1, 6, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2020-01-01', 11783, 2 UNION ALL
SELECT 6, 3, 4, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2020-01-01', 32876, 3 UNION ALL
SELECT 2, 5, 5, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2020-01-01', 34419, 4 UNION ALL
SELECT 4, 10, 10, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2020-01-01', 16538, 5 UNION ALL
SELECT 7, 6, 2, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2020-01-01', 13182, 6 UNION ALL
SELECT 7, 2, 6, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2020-01-01', 25333, 7 UNION ALL
SELECT 2, 8, 3, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2020-01-01', 4165, 8 UNION ALL
SELECT 8, 6, 3, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2020-01-01', 7714, 9 UNION ALL
SELECT 10, 4, 2, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2020-01-01', 6365, 10 UNION ALL
SELECT 10, 9, 5, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2020-01-01', 1249, 11 UNION ALL
SELECT 8, 10, 4, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2020-01-01', 5236, 12 UNION ALL
SELECT 8, 5, 8, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2020-01-01', 2711, 13 UNION ALL
SELECT 8, 6, 4, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2020-01-01', 1629, 14 UNION ALL
SELECT 3, 3, 10, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2020-01-01', 1321, 15 UNION ALL
SELECT 5, 2, 4, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2020-01-01', 659, 16;

-- Inserções de 2020-02
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 8, 8, 1, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2020-02-01', 317183, 17 UNION ALL
SELECT 2, 5, 9, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2020-02-01', 11783, 18 UNION ALL
SELECT 3, 3, 9, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2020-02-01', 32876, 19 UNION ALL
SELECT 9, 8, 10, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2020-02-01', 34419, 20 UNION ALL
SELECT 10, 8, 9, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2020-02-01', 16538, 21 UNION ALL
SELECT 8, 4, 7, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2020-02-01', 13182, 22 UNION ALL
SELECT 9, 5, 4, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2020-02-01', 25333, 23 UNION ALL
SELECT 10, 1, 6, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2020-02-01', 4165, 24 UNION ALL
SELECT 8, 6, 6, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2020-02-01', 7714, 25 UNION ALL
SELECT 3, 6, 1, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2020-02-01', 6365, 26 UNION ALL
SELECT 8, 2, 3, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2020-02-01', 1249, 27 UNION ALL
SELECT 3, 1, 4, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2020-02-01', 5236, 28 UNION ALL
SELECT 6, 4, 2, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2020-02-01', 2711, 29 UNION ALL
SELECT 1, 7, 5, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2020-02-01', 1629, 30 UNION ALL
SELECT 1, 2, 1, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2020-02-01', 1321, 31 UNION ALL
SELECT 6, 2, 4, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2020-02-01', 659, 32;

-- Inserções de 2020-03
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 7, 4, 8, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2020-03-01', 317183, 33 UNION ALL
SELECT 10, 7, 7, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2020-03-01', 11783, 34 UNION ALL
SELECT 5, 6, 3, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2020-03-01', 32876, 35 UNION ALL
SELECT 6, 6, 7, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2020-03-01', 34419, 36 UNION ALL
SELECT 1, 8, 8, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2020-03-01', 16538, 37 UNION ALL
SELECT 7, 9, 4, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2020-03-01', 13182, 38 UNION ALL
SELECT 10, 1, 2, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2020-03-01', 25333, 39 UNION ALL
SELECT 10, 9, 3, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2020-03-01', 4165, 40 UNION ALL
SELECT 3, 5, 4, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2020-03-01', 7714, 41 UNION ALL
SELECT 4, 2, 7, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2020-03-01', 6365, 42 UNION ALL
SELECT 6, 9, 5, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2020-03-01', 1249, 43 UNION ALL
SELECT 5, 6, 1, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2020-03-01', 5236, 44 UNION ALL
SELECT 4, 4, 5, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2020-03-01', 2711, 45 UNION ALL
SELECT 10, 4, 9, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2020-03-01', 1629, 46 UNION ALL
SELECT 3, 10, 8, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2020-03-01', 1321, 47 UNION ALL
SELECT 3, 7, 8, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2020-03-01', 659, 48;

-- Inserções de 2020-04
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 2, 1, 7, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2020-04-01', 317183, 49 UNION ALL
SELECT 8, 2, 9, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2020-04-01', 11783, 50 UNION ALL
SELECT 9, 10, 4, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2020-04-01', 32876, 51 UNION ALL
SELECT 2, 8, 6, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2020-04-01', 34419, 52 UNION ALL
SELECT 2, 10, 1, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2020-04-01', 16538, 53 UNION ALL
SELECT 9, 9, 6, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2020-04-01', 13182, 54 UNION ALL
SELECT 3, 10, 2, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2020-04-01', 25333, 55 UNION ALL
SELECT 8, 4, 1, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2020-04-01', 4165, 56 UNION ALL
SELECT 10, 6, 7, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2020-04-01', 7714, 57 UNION ALL
SELECT 8, 8, 5, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2020-04-01', 6365, 58 UNION ALL
SELECT 6, 2, 5, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2020-04-01', 1249, 59 UNION ALL
SELECT 7, 1, 7, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2020-04-01', 5236, 60 UNION ALL
SELECT 4, 6, 9, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2020-04-01', 2711, 61 UNION ALL
SELECT 2, 3, 3, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2020-04-01', 1629, 62 UNION ALL
SELECT 2, 8, 1, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2020-04-01', 1321, 63 UNION ALL
SELECT 5, 4, 8, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2020-04-01', 659, 64;

-- Inserções de 2020-05
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 9, 1, 4, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2020-05-01', 317183, 65 UNION ALL
SELECT 5, 4, 7, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2020-05-01', 11783, 66 UNION ALL
SELECT 7, 3, 4, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2020-05-01', 32876, 67 UNION ALL
SELECT 5, 4, 10, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2020-05-01', 34419, 68 UNION ALL
SELECT 4, 9, 9, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2020-05-01', 16538, 69 UNION ALL
SELECT 7, 5, 7, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2020-05-01', 13182, 70 UNION ALL
SELECT 9, 6, 9, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2020-05-01', 25333, 71 UNION ALL
SELECT 3, 5, 8, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2020-05-01', 4165, 72 UNION ALL
SELECT 5, 3, 3, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2020-05-01', 7714, 73 UNION ALL
SELECT 1, 7, 6, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2020-05-01', 6365, 74 UNION ALL
SELECT 8, 9, 2, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2020-05-01', 1249, 75 UNION ALL
SELECT 6, 3, 7, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2020-05-01', 5236, 76 UNION ALL
SELECT 10, 8, 5, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2020-05-01', 2711, 77 UNION ALL
SELECT 6, 9, 5, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2020-05-01', 1629, 78 UNION ALL
SELECT 6, 7, 10, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2020-05-01', 1321, 79 UNION ALL
SELECT 9, 9, 5, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2020-05-01', 659, 80;

-- Inserções de 2020-06
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 1, 9, 6, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2020-06-01', 317183, 81 UNION ALL
SELECT 5, 5, 5, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2020-06-01', 11783, 82 UNION ALL
SELECT 7, 10, 9, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2020-06-01', 32876, 83 UNION ALL
SELECT 8, 5, 4, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2020-06-01', 34419, 84 UNION ALL
SELECT 4, 9, 9, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2020-06-01', 16538, 85 UNION ALL
SELECT 6, 8, 8, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2020-06-01', 13182, 86 UNION ALL
SELECT 10, 5, 5, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2020-06-01', 25333, 87 UNION ALL
SELECT 8, 7, 8, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2020-06-01', 4165, 88 UNION ALL
SELECT 9, 3, 4, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2020-06-01', 7714, 89 UNION ALL
SELECT 5, 7, 4, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2020-06-01', 6365, 90 UNION ALL
SELECT 3, 1, 10, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2020-06-01', 1249, 91 UNION ALL
SELECT 1, 8, 7, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2020-06-01', 5236, 92 UNION ALL
SELECT 8, 1, 8, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2020-06-01', 2711, 93 UNION ALL
SELECT 3, 1, 1, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2020-06-01', 1629, 94 UNION ALL
SELECT 7, 7, 8, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2020-06-01', 1321, 95 UNION ALL
SELECT 2, 5, 8, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2020-06-01', 659, 96;

-- Inserções de 2020-07
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 8, 6, 4, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2020-07-01', 317183, 97 UNION ALL
SELECT 3, 10, 1, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2020-07-01', 11783, 98 UNION ALL
SELECT 3, 1, 5, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2020-07-01', 32876, 99 UNION ALL
SELECT 7, 8, 5, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2020-07-01', 34419, 100 UNION ALL
SELECT 6, 5, 7, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2020-07-01', 16538, 101 UNION ALL
SELECT 7, 7, 8, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2020-07-01', 13182, 102 UNION ALL
SELECT 8, 9, 5, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2020-07-01', 25333, 103 UNION ALL
SELECT 2, 1, 4, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2020-07-01', 4165, 104 UNION ALL
SELECT 10, 1, 5, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2020-07-01', 7714, 105 UNION ALL
SELECT 8, 10, 6, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2020-07-01', 6365, 106 UNION ALL
SELECT 5, 1, 1, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2020-07-01', 1249, 107 UNION ALL
SELECT 6, 3, 8, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2020-07-01', 5236, 108 UNION ALL
SELECT 4, 5, 9, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2020-07-01', 2711, 109 UNION ALL
SELECT 10, 7, 8, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2020-07-01', 1629, 110 UNION ALL
SELECT 1, 9, 7, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2020-07-01', 1321, 111 UNION ALL
SELECT 7, 3, 10, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2020-07-01', 659, 112;

-- Inserções de 2020-08
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 9, 4, 10, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2020-08-01', 317183, 113 UNION ALL
SELECT 5, 2, 10, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2020-08-01', 11783, 114 UNION ALL
SELECT 2, 6, 10, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2020-08-01', 32876, 115 UNION ALL
SELECT 7, 9, 2, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2020-08-01', 34419, 116 UNION ALL
SELECT 10, 6, 8, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2020-08-01', 16538, 117 UNION ALL
SELECT 9, 3, 8, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2020-08-01', 13182, 118 UNION ALL
SELECT 9, 6, 2, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2020-08-01', 25333, 119 UNION ALL
SELECT 2, 8, 7, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2020-08-01', 4165, 120 UNION ALL
SELECT 6, 3, 10, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2020-08-01', 7714, 121 UNION ALL
SELECT 2, 5, 5, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2020-08-01', 6365, 122 UNION ALL
SELECT 10, 8, 7, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2020-08-01', 1249, 123 UNION ALL
SELECT 2, 7, 6, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2020-08-01', 5236, 124 UNION ALL
SELECT 8, 1, 10, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2020-08-01', 2711, 125 UNION ALL
SELECT 1, 7, 10, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2020-08-01', 1629, 126 UNION ALL
SELECT 3, 3, 7, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2020-08-01', 1321, 127 UNION ALL
SELECT 2, 4, 3, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2020-08-01', 659, 128;

-- Inserções de 2020-09
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 1, 8, 4, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2020-09-01', 317183, 129 UNION ALL
SELECT 8, 1, 10, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2020-09-01', 11783, 130 UNION ALL
SELECT 4, 6, 9, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2020-09-01', 32876, 131 UNION ALL
SELECT 4, 6, 3, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2020-09-01', 34419, 132 UNION ALL
SELECT 7, 9, 5, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2020-09-01', 16538, 133 UNION ALL
SELECT 3, 5, 3, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2020-09-01', 13182, 134 UNION ALL
SELECT 8, 6, 8, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2020-09-01', 25333, 135 UNION ALL
SELECT 10, 10, 2, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2020-09-01', 4165, 136 UNION ALL
SELECT 7, 9, 1, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2020-09-01', 7714, 137 UNION ALL
SELECT 4, 5, 4, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2020-09-01', 6365, 138 UNION ALL
SELECT 1, 5, 5, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2020-09-01', 1249, 139 UNION ALL
SELECT 8, 6, 7, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2020-09-01', 5236, 140 UNION ALL
SELECT 3, 7, 9, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2020-09-01', 2711, 141 UNION ALL
SELECT 7, 8, 1, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2020-09-01', 1629, 142 UNION ALL
SELECT 4, 5, 2, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2020-09-01', 1321, 143 UNION ALL
SELECT 7, 5, 10, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2020-09-01', 659, 144;

-- Inserções de 2020-10
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 2, 7, 3, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2020-10-01', 317183, 145 UNION ALL
SELECT 6, 2, 1, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2020-10-01', 11783, 146 UNION ALL
SELECT 4, 5, 4, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2020-10-01', 32876, 147 UNION ALL
SELECT 5, 7, 4, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2020-10-01', 34419, 148 UNION ALL
SELECT 2, 7, 5, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2020-10-01', 16538, 149 UNION ALL
SELECT 9, 6, 5, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2020-10-01', 13182, 150 UNION ALL
SELECT 4, 4, 1, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2020-10-01', 25333, 151 UNION ALL
SELECT 9, 5, 3, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2020-10-01', 4165, 152 UNION ALL
SELECT 3, 6, 7, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2020-10-01', 7714, 153 UNION ALL
SELECT 10, 6, 7, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2020-10-01', 6365, 154 UNION ALL
SELECT 7, 1, 4, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2020-10-01', 1249, 155 UNION ALL
SELECT 10, 3, 2, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2020-10-01', 5236, 156 UNION ALL
SELECT 5, 3, 10, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2020-10-01', 2711, 157 UNION ALL
SELECT 1, 1, 4, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2020-10-01', 1629, 158 UNION ALL
SELECT 5, 8, 5, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2020-10-01', 1321, 159 UNION ALL
SELECT 4, 3, 10, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2020-10-01', 659, 160;

-- Inserções de 2020-11
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 8, 4, 7, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2020-11-01', 317183, 161 UNION ALL
SELECT 1, 9, 4, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2020-11-01', 11783, 162 UNION ALL
SELECT 8, 10, 7, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2020-11-01', 32876, 163 UNION ALL
SELECT 6, 10, 1, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2020-11-01', 34419, 164 UNION ALL
SELECT 7, 6, 3, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2020-11-01', 16538, 165 UNION ALL
SELECT 7, 4, 3, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2020-11-01', 13182, 166 UNION ALL
SELECT 1, 4, 2, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2020-11-01', 25333, 167 UNION ALL
SELECT 6, 7, 5, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2020-11-01', 4165, 168 UNION ALL
SELECT 6, 7, 8, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2020-11-01', 7714, 169 UNION ALL
SELECT 10, 9, 8, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2020-11-01', 6365, 170 UNION ALL
SELECT 8, 3, 10, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2020-11-01', 1249, 171 UNION ALL
SELECT 1, 3, 4, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2020-11-01', 5236, 172 UNION ALL
SELECT 6, 9, 9, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2020-11-01', 2711, 173 UNION ALL
SELECT 2, 6, 8, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2020-11-01', 1629, 174 UNION ALL
SELECT 2, 10, 7, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2020-11-01', 1321, 175 UNION ALL
SELECT 3, 8, 7, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2020-11-01', 659, 176;

-- Inserções de 2020-12
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 1, 4, 8, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2020-12-01', 317183, 177 UNION ALL
SELECT 3, 10, 7, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2020-12-01', 11783, 178 UNION ALL
SELECT 3, 4, 6, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2020-12-01', 32876, 179 UNION ALL
SELECT 8, 7, 2, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2020-12-01', 34419, 180 UNION ALL
SELECT 3, 8, 9, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2020-12-01', 16538, 181 UNION ALL
SELECT 5, 9, 10, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2020-12-01', 13182, 182 UNION ALL
SELECT 1, 7, 9, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2020-12-01', 25333, 183 UNION ALL
SELECT 10, 5, 4, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2020-12-01', 4165, 184 UNION ALL
SELECT 10, 3, 7, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2020-12-01', 7714, 185 UNION ALL
SELECT 8, 2, 8, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2020-12-01', 6365, 186 UNION ALL
SELECT 1, 9, 4, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2020-12-01', 1249, 187 UNION ALL
SELECT 2, 6, 3, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2020-12-01', 5236, 188 UNION ALL
SELECT 3, 6, 9, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2020-12-01', 2711, 189 UNION ALL
SELECT 5, 6, 5, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2020-12-01', 1629, 190 UNION ALL
SELECT 10, 2, 5, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2020-12-01', 1321, 191 UNION ALL
SELECT 5, 10, 6, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2020-12-01', 659, 192;

-- Inserções de 2021-01
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 1, 4, 3, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2021-01-01', 317183, 193 UNION ALL
SELECT 7, 2, 7, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2021-01-01', 11783, 194 UNION ALL
SELECT 10, 8, 5, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2021-01-01', 32876, 195 UNION ALL
SELECT 6, 1, 2, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2021-01-01', 34419, 196 UNION ALL
SELECT 5, 7, 6, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2021-01-01', 16538, 197 UNION ALL
SELECT 4, 2, 4, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2021-01-01', 13182, 198 UNION ALL
SELECT 3, 1, 3, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2021-01-01', 25333, 199 UNION ALL
SELECT 9, 9, 7, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2021-01-01', 4165, 200 UNION ALL
SELECT 10, 10, 5, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2021-01-01', 7714, 201 UNION ALL
SELECT 8, 4, 10, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2021-01-01', 6365, 202 UNION ALL
SELECT 7, 2, 6, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2021-01-01', 1249, 203 UNION ALL
SELECT 7, 2, 10, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2021-01-01', 5236, 204 UNION ALL
SELECT 3, 9, 4, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2021-01-01', 2711, 205 UNION ALL
SELECT 1, 1, 4, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2021-01-01', 1629, 206 UNION ALL
SELECT 7, 3, 4, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2021-01-01', 1321, 207 UNION ALL
SELECT 2, 3, 3, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2021-01-01', 659, 208;

-- Inserções de 2021-02
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 10, 4, 7, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2021-02-01', 317183, 209 UNION ALL
SELECT 5, 2, 10, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2021-02-01', 11783, 210 UNION ALL
SELECT 1, 2, 2, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2021-02-01', 32876, 211 UNION ALL
SELECT 2, 6, 5, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2021-02-01', 34419, 212 UNION ALL
SELECT 10, 10, 1, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2021-02-01', 16538, 213 UNION ALL
SELECT 4, 2, 9, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2021-02-01', 13182, 214 UNION ALL
SELECT 9, 3, 7, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2021-02-01', 25333, 215 UNION ALL
SELECT 6, 1, 2, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2021-02-01', 4165, 216 UNION ALL
SELECT 2, 7, 2, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2021-02-01', 7714, 217 UNION ALL
SELECT 6, 3, 4, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2021-02-01', 6365, 218 UNION ALL
SELECT 4, 2, 6, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2021-02-01', 1249, 219 UNION ALL
SELECT 7, 1, 9, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2021-02-01', 5236, 220 UNION ALL
SELECT 9, 4, 6, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2021-02-01', 2711, 221 UNION ALL
SELECT 7, 10, 4, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2021-02-01', 1629, 222 UNION ALL
SELECT 4, 2, 1, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2021-02-01', 1321, 223 UNION ALL
SELECT 5, 4, 4, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2021-02-01', 659, 224;

-- Inserções de 2021-03
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 7, 3, 3, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2021-03-01', 317183, 225 UNION ALL
SELECT 7, 7, 5, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2021-03-01', 11783, 226 UNION ALL
SELECT 9, 2, 9, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2021-03-01', 32876, 227 UNION ALL
SELECT 4, 1, 4, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2021-03-01', 34419, 228 UNION ALL
SELECT 1, 7, 7, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2021-03-01', 16538, 229 UNION ALL
SELECT 3, 6, 6, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2021-03-01', 13182, 230 UNION ALL
SELECT 10, 5, 1, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2021-03-01', 25333, 231 UNION ALL
SELECT 9, 4, 6, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2021-03-01', 4165, 232 UNION ALL
SELECT 8, 10, 7, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2021-03-01', 7714, 233 UNION ALL
SELECT 5, 3, 4, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2021-03-01', 6365, 234 UNION ALL
SELECT 2, 10, 10, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2021-03-01', 1249, 235 UNION ALL
SELECT 10, 7, 3, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2021-03-01', 5236, 236 UNION ALL
SELECT 2, 9, 5, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2021-03-01', 2711, 237 UNION ALL
SELECT 6, 7, 3, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2021-03-01', 1629, 238 UNION ALL
SELECT 4, 9, 8, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2021-03-01', 1321, 239 UNION ALL
SELECT 7, 2, 5, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2021-03-01', 659, 240;

-- Inserções de 2021-04
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 1, 2, 7, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2021-04-01', 317183, 241 UNION ALL
SELECT 10, 8, 5, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2021-04-01', 11783, 242 UNION ALL
SELECT 7, 7, 6, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2021-04-01', 32876, 243 UNION ALL
SELECT 6, 7, 2, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2021-04-01', 34419, 244 UNION ALL
SELECT 10, 6, 5, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2021-04-01', 16538, 245 UNION ALL
SELECT 8, 10, 7, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2021-04-01', 13182, 246 UNION ALL
SELECT 4, 7, 6, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2021-04-01', 25333, 247 UNION ALL
SELECT 4, 8, 9, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2021-04-01', 4165, 248 UNION ALL
SELECT 3, 4, 4, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2021-04-01', 7714, 249 UNION ALL
SELECT 9, 9, 3, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2021-04-01', 6365, 250 UNION ALL
SELECT 8, 5, 6, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2021-04-01', 1249, 251 UNION ALL
SELECT 8, 10, 9, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2021-04-01', 5236, 252 UNION ALL
SELECT 1, 7, 10, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2021-04-01', 2711, 253 UNION ALL
SELECT 10, 1, 4, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2021-04-01', 1629, 254 UNION ALL
SELECT 10, 7, 8, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2021-04-01', 1321, 255 UNION ALL
SELECT 6, 3, 10, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2021-04-01', 659, 256;

-- Inserções de 2021-05
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 5, 2, 8, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2021-05-01', 317183, 257 UNION ALL
SELECT 7, 5, 10, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2021-05-01', 11783, 258 UNION ALL
SELECT 8, 9, 5, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2021-05-01', 32876, 259 UNION ALL
SELECT 5, 6, 4, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2021-05-01', 34419, 260 UNION ALL
SELECT 6, 4, 9, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2021-05-01', 16538, 261 UNION ALL
SELECT 4, 7, 8, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2021-05-01', 13182, 262 UNION ALL
SELECT 8, 5, 9, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2021-05-01', 25333, 263 UNION ALL
SELECT 9, 4, 10, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2021-05-01', 4165, 264 UNION ALL
SELECT 4, 6, 4, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2021-05-01', 7714, 265 UNION ALL
SELECT 4, 5, 5, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2021-05-01', 6365, 266 UNION ALL
SELECT 4, 8, 2, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2021-05-01', 1249, 267 UNION ALL
SELECT 8, 4, 1, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2021-05-01', 5236, 268 UNION ALL
SELECT 4, 10, 1, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2021-05-01', 2711, 269 UNION ALL
SELECT 10, 5, 8, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2021-05-01', 1629, 270 UNION ALL
SELECT 9, 7, 7, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2021-05-01', 1321, 271 UNION ALL
SELECT 5, 8, 7, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2021-05-01', 659, 272;

-- Inserções de 2021-06
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 3, 5, 2, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2021-06-01', 317183, 273 UNION ALL
SELECT 2, 8, 5, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2021-06-01', 11783, 274 UNION ALL
SELECT 10, 4, 10, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2021-06-01', 32876, 275 UNION ALL
SELECT 5, 9, 9, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2021-06-01', 34419, 276 UNION ALL
SELECT 5, 8, 4, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2021-06-01', 16538, 277 UNION ALL
SELECT 4, 5, 7, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2021-06-01', 13182, 278 UNION ALL
SELECT 1, 6, 1, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2021-06-01', 25333, 279 UNION ALL
SELECT 10, 3, 4, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2021-06-01', 4165, 280 UNION ALL
SELECT 7, 1, 6, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2021-06-01', 7714, 281 UNION ALL
SELECT 9, 5, 7, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2021-06-01', 6365, 282 UNION ALL
SELECT 4, 5, 6, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2021-06-01', 1249, 283 UNION ALL
SELECT 7, 8, 7, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2021-06-01', 5236, 284 UNION ALL
SELECT 1, 2, 3, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2021-06-01', 2711, 285 UNION ALL
SELECT 10, 4, 5, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2021-06-01', 1629, 286 UNION ALL
SELECT 9, 5, 9, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2021-06-01', 1321, 287 UNION ALL
SELECT 2, 1, 1, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2021-06-01', 659, 288;

-- Inserções de 2021-07
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 1, 4, 8, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2021-07-01', 317183, 289 UNION ALL
SELECT 1, 3, 1, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2021-07-01', 11783, 290 UNION ALL
SELECT 7, 8, 3, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2021-07-01', 32876, 291 UNION ALL
SELECT 10, 10, 10, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2021-07-01', 34419, 292 UNION ALL
SELECT 9, 5, 8, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2021-07-01', 16538, 293 UNION ALL
SELECT 4, 2, 4, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2021-07-01', 13182, 294 UNION ALL
SELECT 4, 8, 4, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2021-07-01', 25333, 295 UNION ALL
SELECT 3, 8, 10, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2021-07-01', 4165, 296 UNION ALL
SELECT 4, 1, 8, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2021-07-01', 7714, 297 UNION ALL
SELECT 1, 2, 10, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2021-07-01', 6365, 298 UNION ALL
SELECT 7, 2, 1, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2021-07-01', 1249, 299 UNION ALL
SELECT 9, 8, 4, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2021-07-01', 5236, 300 UNION ALL
SELECT 1, 10, 6, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2021-07-01', 2711, 301 UNION ALL
SELECT 10, 3, 5, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2021-07-01', 1629, 302 UNION ALL
SELECT 6, 4, 2, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2021-07-01', 1321, 303 UNION ALL
SELECT 8, 8, 1, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2021-07-01', 659, 304;

-- Inserções de 2021-08
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 8, 9, 10, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2021-08-01', 317183, 305 UNION ALL
SELECT 10, 10, 4, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2021-08-01', 11783, 306 UNION ALL
SELECT 10, 5, 3, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2021-08-01', 32876, 307 UNION ALL
SELECT 3, 4, 2, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2021-08-01', 34419, 308 UNION ALL
SELECT 7, 7, 8, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2021-08-01', 16538, 309 UNION ALL
SELECT 3, 8, 7, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2021-08-01', 13182, 310 UNION ALL
SELECT 6, 5, 2, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2021-08-01', 25333, 311 UNION ALL
SELECT 6, 1, 10, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2021-08-01', 4165, 312 UNION ALL
SELECT 6, 5, 7, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2021-08-01', 7714, 313 UNION ALL
SELECT 5, 2, 9, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2021-08-01', 6365, 314 UNION ALL
SELECT 3, 1, 7, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2021-08-01', 1249, 315 UNION ALL
SELECT 7, 3, 1, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2021-08-01', 5236, 316 UNION ALL
SELECT 5, 8, 5, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2021-08-01', 2711, 317 UNION ALL
SELECT 7, 4, 5, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2021-08-01', 1629, 318 UNION ALL
SELECT 10, 2, 2, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2021-08-01', 1321, 319 UNION ALL
SELECT 1, 8, 4, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2021-08-01', 659, 320;

-- Inserções de 2021-09
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 9, 1, 1, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2021-09-01', 317183, 321 UNION ALL
SELECT 6, 8, 6, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2021-09-01', 11783, 322 UNION ALL
SELECT 8, 5, 10, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2021-09-01', 32876, 323 UNION ALL
SELECT 3, 5, 7, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2021-09-01', 34419, 324 UNION ALL
SELECT 9, 3, 7, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2021-09-01', 16538, 325 UNION ALL
SELECT 10, 3, 5, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2021-09-01', 13182, 326 UNION ALL
SELECT 5, 4, 3, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2021-09-01', 25333, 327 UNION ALL
SELECT 2, 3, 7, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2021-09-01', 4165, 328 UNION ALL
SELECT 1, 5, 9, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2021-09-01', 7714, 329 UNION ALL
SELECT 10, 6, 4, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2021-09-01', 6365, 330 UNION ALL
SELECT 1, 9, 9, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2021-09-01', 1249, 331 UNION ALL
SELECT 5, 7, 3, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2021-09-01', 5236, 332 UNION ALL
SELECT 10, 5, 2, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2021-09-01', 2711, 333 UNION ALL
SELECT 6, 3, 9, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2021-09-01', 1629, 334 UNION ALL
SELECT 4, 7, 6, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2021-09-01', 1321, 335 UNION ALL
SELECT 8, 10, 1, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2021-09-01', 659, 336;

-- Inserções de 2021-10
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 6, 2, 8, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2021-10-01', 317183, 337 UNION ALL
SELECT 10, 2, 6, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2021-10-01', 11783, 338 UNION ALL
SELECT 6, 10, 1, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2021-10-01', 32876, 339 UNION ALL
SELECT 3, 8, 9, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2021-10-01', 34419, 340 UNION ALL
SELECT 3, 10, 9, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2021-10-01', 16538, 341 UNION ALL
SELECT 10, 1, 8, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2021-10-01', 13182, 342 UNION ALL
SELECT 7, 3, 5, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2021-10-01', 25333, 343 UNION ALL
SELECT 4, 7, 10, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2021-10-01', 4165, 344 UNION ALL
SELECT 6, 10, 8, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2021-10-01', 7714, 345 UNION ALL
SELECT 9, 1, 7, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2021-10-01', 6365, 346 UNION ALL
SELECT 7, 10, 10, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2021-10-01', 1249, 347 UNION ALL
SELECT 9, 4, 3, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2021-10-01', 5236, 348 UNION ALL
SELECT 7, 1, 2, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2021-10-01', 2711, 349 UNION ALL
SELECT 2, 4, 1, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2021-10-01', 1629, 350 UNION ALL
SELECT 5, 2, 8, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2021-10-01', 1321, 351 UNION ALL
SELECT 1, 5, 8, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2021-10-01', 659, 352;

-- Inserções de 2021-11
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 6, 5, 6, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2021-11-01', 317183, 353 UNION ALL
SELECT 6, 6, 1, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2021-11-01', 11783, 354 UNION ALL
SELECT 7, 3, 1, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2021-11-01', 32876, 355 UNION ALL
SELECT 4, 8, 6, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2021-11-01', 34419, 356 UNION ALL
SELECT 1, 6, 4, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2021-11-01', 16538, 357 UNION ALL
SELECT 9, 6, 9, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2021-11-01', 13182, 358 UNION ALL
SELECT 1, 8, 1, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2021-11-01', 25333, 359 UNION ALL
SELECT 4, 10, 10, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2021-11-01', 4165, 360 UNION ALL
SELECT 1, 9, 5, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2021-11-01', 7714, 361 UNION ALL
SELECT 10, 10, 9, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2021-11-01', 6365, 362 UNION ALL
SELECT 6, 1, 7, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2021-11-01', 1249, 363 UNION ALL
SELECT 7, 7, 4, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2021-11-01', 5236, 364 UNION ALL
SELECT 10, 10, 7, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2021-11-01', 2711, 365 UNION ALL
SELECT 5, 6, 5, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2021-11-01', 1629, 366 UNION ALL
SELECT 5, 3, 8, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2021-11-01', 1321, 367 UNION ALL
SELECT 1, 9, 6, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2021-11-01', 659, 368;

-- Inserções de 2021-12
INSERT INTO HistoricoReciclagem (usuario_id, empresa_id, ponto_coleta_id, tipo_residuo_id, unidade_medida_id, data_reciclagem, quantidade, agendamento_id)
SELECT 7, 1, 5, (SELECT id FROM TipoResiduo WHERE nome='DOMICILIAR'), @unidade_ton_id, '2021-12-01', 317183, 369 UNION ALL
SELECT 4, 4, 3, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MECANIZADO'), @unidade_ton_id, '2021-12-01', 11783, 370 UNION ALL
SELECT 2, 1, 9, (SELECT id FROM TipoResiduo WHERE nome='ECOPONTO'), @unidade_ton_id, '2021-12-01', 32876, 371 UNION ALL
SELECT 1, 7, 10, (SELECT id FROM TipoResiduo WHERE nome='DIVERSOS'), @unidade_ton_id, '2021-12-01', 34419, 372 UNION ALL
SELECT 8, 6, 3, (SELECT id FROM TipoResiduo WHERE nome='ESGOTO'), @unidade_ton_id, '2021-12-01', 16538, 373 UNION ALL
SELECT 8, 2, 10, (SELECT id FROM TipoResiduo WHERE nome='PISCINAO'), @unidade_ton_id, '2021-12-01', 13182, 374 UNION ALL
SELECT 7, 5, 4, (SELECT id FROM TipoResiduo WHERE nome='CORREGOS'), @unidade_ton_id, '2021-12-01', 25333, 375 UNION ALL
SELECT 8, 1, 3, (SELECT id FROM TipoResiduo WHERE nome='VARRICAO'), @unidade_ton_id, '2021-12-01', 4165, 376 UNION ALL
SELECT 1, 7, 6, (SELECT id FROM TipoResiduo WHERE nome='SELETIVA'), @unidade_ton_id, '2021-12-01', 7714, 377 UNION ALL
SELECT 4, 6, 2, (SELECT id FROM TipoResiduo WHERE nome='FEIRA_LIVRE'), @unidade_ton_id, '2021-12-01', 6365, 378 UNION ALL
SELECT 4, 8, 1, (SELECT id FROM TipoResiduo WHERE nome='ENTULHO_MANUAL'), @unidade_ton_id, '2021-12-01', 1249, 379 UNION ALL
SELECT 1, 10, 6, (SELECT id FROM TipoResiduo WHERE nome='PODA'), @unidade_ton_id, '2021-12-01', 5236, 380 UNION ALL
SELECT 1, 3, 8, (SELECT id FROM TipoResiduo WHERE nome='GRANDE_GERADOR_SAUDE'), @unidade_ton_id, '2021-12-01', 2711, 381 UNION ALL
SELECT 6, 9, 9, (SELECT id FROM TipoResiduo WHERE nome='REJEITO_CMT_CMJ'), @unidade_ton_id, '2021-12-01', 1629, 382 UNION ALL
SELECT 3, 2, 3, (SELECT id FROM TipoResiduo WHERE nome='BOCA_DE_LOBO'), @unidade_ton_id, '2021-12-01', 1321, 383 UNION ALL
SELECT 7, 4, 10, (SELECT id FROM TipoResiduo WHERE nome='PEQUENO_GERADOR_SAUDE'), @unidade_ton_id, '2021-12-01', 659, 384;
