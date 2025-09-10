# EcoLink - Sistema de Conexão para Reciclagem

## 📚 Índice

1. [Objetivo](#objetivo)
2. [Plano de Análise](#plano-de-análise)
3. [Próximas Etapas](#próximas-etapas)
4. [Estrutura do Banco de Dados](#estrutura-do-banco-de-dados)
5. [Scripts SQL](#scripts-sql)
6. [Membros do Grupo](#membros-do-grupo)
7. [Modelo Físico do Banco de Dados](#modelo-físico-do-banco-de-dados)

---

## ♻️ Objetivo

O **EcoLink** é um projeto destinado a otimizar o processo de reciclagem, conectando **usuários**, **empresas** e **pontos de coleta**. O principal objetivo do sistema é permitir o gerenciamento eficiente de resíduos recicláveis e facilitar o agendamento de coletas.

Este projeto busca:

* **Facilitar o descarte de resíduos recicláveis**, conectando usuários a pontos de coleta específicos.
* **Fornecer informações detalhadas** sobre os tipos de resíduos e as opções de coleta disponíveis em cada localidade.
* **Promover a reciclagem**, incentivando empresas e cidadãos a participarem ativamente de um processo sustentável.
* **Avaliar e otimizar os pontos de coleta e as empresas**, baseando-se em feedbacks dos usuários.

---

## ❓ Plano de Análise

O projeto EcoLink possui uma série de questões chave que precisam ser analisadas para otimizar o sistema e promover melhores práticas de reciclagem. As análises propostas incluem:

1. **Quantos usuários e empresas se cadastraram em cada mês?**

   * Objetivo: Avaliar a adesão dos usuários e empresas ao sistema ao longo do tempo.

2. **Em quais cidades ou estados há maior concentração de pontos de coleta ativos?**

   * Objetivo: Identificar as regiões mais bem servidas e planejar a expansão em áreas com baixa cobertura.

3. **Quais tipos de resíduos são mais agendados?**

   * Objetivo: Determinar os resíduos mais reciclados e os tipos de coleta mais demandados.

4. **Quantos agendamentos foram realizados em determinado período?**

   * Objetivo: Analisar a frequência de agendamentos de coletas ao longo de períodos mensais, trimestrais e anuais.

5. **Quais categorias de resíduos são mais recicladas (plástico, vidro, papel, etc.)?**

   * Objetivo: Entender as tendências de reciclagem e o impacto de campanhas de conscientização.

---

## 📆 Próximas Etapas

1. **Desenvolvimento do Processo de ETL em T-SQL**:

   * Criar um processo eficiente de ETL (extração, transformação e carga) para garantir que os dados estejam sempre atualizados e consistentes.

2. **Execução do ETL Completo**:

   * Implementar o processo de ETL completo no banco de dados.
   * Validar a carga de dados e realizar a exploração dos dados utilizando consultas SQL.

3. **Consultas DQL**:

   * Criar consultas de Data Query Language (DQL) para realizar análises em tempo real e gerar relatórios sobre a eficácia do sistema.

---

## 📌 Planejamento

O planejamento do projeto pode ser acompanhado pelo **Trello**, onde as tarefas estão organizadas em etapas, incluindo o desenvolvimento, testes e integração contínua.

---

## 📝 Informações Importantes do Projeto

* **Dataset**: Conjunto de dados que alimenta o sistema EcoLink.
* **Modelo Físico**: Estrutura do banco de dados, conforme ilustrado na imagem abaixo (o modelo físico contém informações detalhadas sobre as tabelas, relacionamentos e índices).
* **Plano de Análise**: Estratégias de análise para otimizar o uso e os processos de reciclagem.
* **Consultas DQL**: Definir consultas SQL para análise de dados.

---

## 👥 Membros do Grupo

* João Pedro Lima Gaspar
* Juliard Martins
* Kaue Pablo Soares
* Lucas Nogueira
* Nathan Kevyn

---

## 🏗️ Estrutura do Banco de Dados

O banco de dados foi projetado para suportar todas as operações necessárias para o funcionamento do sistema EcoLink. Ele contém tabelas relacionadas a **usuários**, **empresas**, **pontos de coleta**, **agendamentos**, **tipos de resíduos** e outros elementos-chave. A seguir estão as principais tabelas e seus campos:

### 1. **Usuário**

* **id**: Identificador único do usuário.
* **email**: Endereço de e-mail do usuário (único).
* **nome**: Nome completo do usuário.
* **idade**: Idade do usuário (opcional).
* **telefone**: Número de telefone do usuário (opcional).
* **cpf**: CPF do usuário (único).
* **senha\_hash**: Senha criptografada para autenticação.
* **cep**: Código postal do endereço do usuário.
* **logradouro, numero, complemento, bairro, cidade, estado**: Endereço completo do usuário.
* **data\_cadastro**: Data e hora do cadastro do usuário.

### 2. **Empresa**

* **id**: Identificador único da empresa.
* **cnpj**: CNPJ da empresa (único).
* **senha\_hash**: Senha criptografada para autenticação.
* **tipo**: Tipo de empresa (Corporativa ou Comerciante).
* **razao\_social**: Razão social da empresa.
* **nome\_fantasia**: Nome fantasia da empresa.
* **telefone**: Número de telefone da empresa.
* **cep, logradouro, numero, complemento, bairro, cidade, estado**: Endereço completo da empresa.
* **data\_cadastro**: Data e hora do cadastro da empresa.

### 3. **Ponto de Coleta**

* **id**: Identificador único do ponto de coleta.
* **nome**: Nome do ponto de coleta.
* **endereco**: Endereço completo do ponto de coleta.
* **cep, cidade, estado**: Localização do ponto de coleta.
* **horario\_funcionamento**: Horário de funcionamento do ponto.
* **responsavel**: Responsável pelo ponto de coleta.
* **nota**: Nota de avaliação do ponto de coleta (0 a 10).
* **latitude, longitude**: Coordenadas geográficas do ponto de coleta.
* **ativo**: Status do ponto de coleta (ativo ou inativo).
* **data\_cadastro**: Data e hora do cadastro do ponto de coleta.

### 4. **Agendamento**

* **id**: Identificador único do agendamento.
* **usuario\_id**: Identificador do usuário que fez o agendamento.
* **empresa\_id**: Identificador da empresa que participa do agendamento (se aplicável).
* **ponto\_coleta\_id**: Identificador do ponto de coleta escolhido.
* **data\_hora**: Data e hora do agendamento.
* **status**: Status do agendamento (Agendado, Concluído, Cancelado, etc.).
* **observacoes**: Observações adicionais sobre o agendamento.
* **data\_criacao**: Data e hora de criação do agendamento.

---

## 🖥️ Scripts SQL

O banco de dados é alimentado com as seguintes tabelas principais, e os scripts SQL abaixo definem as estruturas das tabelas e os índices:

```sql
-- Tabela de Usuários
CREATE TABLE Usuario (
    id INT PRIMARY KEY IDENTITY(1,1),
    email VARCHAR(100) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    idade INT NULL,
    telefone VARCHAR(20) NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
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

-- Criando índices
CREATE INDEX idx_usuario_email ON Usuario(email);
CREATE INDEX idx_usuario_cpf ON Usuario(cpf);

-- Outras tabelas seguem a mesma lógica de criação, como Empresa, PontoColeta, Agendamento, etc.
```

