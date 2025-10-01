-- ------------------------------
-- 2. Usuários (Geradores de Resíduos) - 10 Entidades
-- ------------------------------
SET IDENTITY_INSERT Usuario ON;
INSERT INTO Usuario (id, nome, email, tipo_gerador, documento_identificacao)
VALUES
(1, 'Ana Silva', 'ana.silva@condominiosaopaulo.com.br', 'Grande Gerador (Condomínio Residencial)', '999.111.222-00'),
(2, 'Bruno Mendes', 'bruno.mendes@logisticasegura.com.br', 'Gerente de Logística (Indústria Química)', '999.333.444-00'),
(3, 'Carla Rocha', 'carla.rocha@pequenocomercio.com.br', 'Pessoa Jurídica (Pequeno Comércio/Restaurante)', '99.555.666/0001-77'),
(4, 'Daniel Lima', 'daniel.lima@clubeesportivo.com.br', 'Grande Gerador (Clube Esportivo/Lazer)', '00.777.888/0001-99'),
(5, 'Elisa Ferreira', 'elisa.ferreira@escritoriocorporativo.com.br', 'Pessoa Jurídica (Escritório Corporativo)', '01.999.000/0001-11'),
(6, 'Felipe Góes', 'felipe.goes@hospitalsantaclara.com.br', 'Grande Gerador (Hospital Privado)', '02.111.222/0001-22'),
(7, 'Giovanna Prado', 'giovanna.prado@shoppingavenida.com.br', 'Grande Gerador (Centro Comercial/Shopping)', '03.222.333/0001-33'),
(8, 'Hugo Santos', 'hugo.santos@mecanicapadrao.com.br', 'Pequeno Gerador (Pequena Oficina Mecânica)', '04.333.444/0001-44'),
(9, 'Isabela Castro', 'isabela.castro@redehoteis.com.br', 'Grande Gerador (Rede de Hotéis)', '05.444.555/0001-55'),
(10, 'João Nogueira', 'joao.nogueira@depositosp.com.br', 'Pessoa Física (Resíduos Especiais/Volumosos)', '999.555.666-00');
SET IDENTITY_INSERT Usuario OFF;
