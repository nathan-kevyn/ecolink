# ⚽ **Brasileirão Analytics – Sistema de Dados do Campeonato Brasileiro (2004–2024)**  

📚 **Índice**
1. [Objetivo](#-objetivo)  
2. [Plano de Análise](#-plano-de-análise)  
3. [Estrutura Geral do Projeto](#-estrutura-geral-do-projeto)  
4. [Estrutura do Banco de Dados](#-estrutura-do-banco-de-dados)  
5. [Tabelas Brutas (RAW)](#-tabelas-brutas-raw)  
6. [Scripts SQL](#-scripts-sql)  
7. [Funções e Procedures](#-funções-e-procedures)  
8. [Próximas Etapas](#-próximas-etapas)  
9. [Membros do Grupo](#-membros-do-grupo)  
10. [Modelo Físico do Banco de Dados](#-modelo-físico-do-banco-de-dados)  
11. [Dicionário de Dados (HTML)](#-dicionário-de-dados-html)  

---

## 🏆 **Objetivo**

O **Brasileirão Analytics** é um sistema de **modelagem, análise e inteligência esportiva** voltado para o **Campeonato Brasileiro de Futebol – Série A**, abrangendo o período de **2004 a 2024**.  

O projeto reúne informações detalhadas sobre **partidas, clubes, técnicos, atletas, arenas, gols, cartões e estatísticas de desempenho**, estruturadas em um **banco de dados analítico relacional**.  

Além do valor histórico, o sistema foi desenhado com **aplicações práticas para clubes de futebol**, permitindo análises de desempenho, scouting, inteligência esportiva e suporte à tomada de decisão em diferentes áreas técnicas e administrativas.

---

### ⚙️ **Aplicações práticas dentro dos clubes**

- 🧠 **Departamentos de Scout e Análise de Mercado:**  
  Avaliar jogadores com base em desempenho real, mapear talentos e comparar estatísticas ao longo das temporadas.  

- 📊 **Departamentos de Inteligência e Desempenho Esportivo:**  
  Cruzar dados coletivos e individuais para gerar relatórios táticos e estratégicos, identificando tendências como aumento de posse ou queda na precisão de passes.  

- 🧤 **Comissões Técnicas e Analistas de Jogo:**  
  Monitorar o comportamento dos clubes em momentos decisivos e a eficiência de jogadores sob pressão.  

- 💼 **Gestores e Diretores de Futebol:**  
  Apoiar decisões de investimento, contratações e gestão de elenco com dados consolidados e históricos de 20 temporadas.  

---

### 🎯 **Objetivos principais do projeto**

- Centralizar dados históricos do Brasileirão em uma única base confiável.  
- Criar uma estrutura analítica escalável para **dashboards, relatórios e algoritmos de previsão**.  
- Oferecer uma plataforma para **scouting, estatísticas avançadas e estudos de performance**.  
- Incentivar a cultura **data-driven** no futebol brasileiro.  

---

## 🔍 **Plano de Análise**

O projeto propõe um conjunto de **análises esportivas complexas e contextuais**, com foco em desempenho técnico, comportamento sob pressão e evolução tática.  

### 🧩 **Consultas e perguntas analíticas sugeridas**

1. **Clubes Decisivos no Fechamento:**  
   Quais clubes marcaram mais gols **nos últimos 15 minutos das partidas (após os 85')**?  
   ➤ *Objetivo:* Identificar equipes que mais decidem jogos nos acréscimos e mantêm intensidade até o fim.

2. **Jogadores Mais “Quentes”:**  
   Quais são os **10 jogadores que receberam mais cartões (amarelos e/ou vermelhos)** em partidas realizadas **a partir de 2003**, nos **minutos finais (85’ em diante)**?  
   ➤ *Objetivo:* Analisar comportamento emocional e disciplina em momentos de pressão.

3. **Evolução do Número de Gols:**  
   Como a **média de gols por partida** evoluiu ao longo das temporadas?  
   ➤ *Objetivo:* Detectar tendências ofensivas e avaliar se o “espetáculo do gol” tem aumentado ou diminuído ao longo dos anos.

4. **Aproveitamento de Mandante vs. Visitante:**  
   Qual é a diferença de **pontos por jogo** entre times atuando em casa e fora, por temporada?  
   ➤ *Objetivo:* Mensurar o peso do mando de campo e sua variação histórica.

5. **Jogadores de Virada:**  
   Quais jogadores **mais marcaram gols que resultaram em empates ou viradas**?  
   ➤ *Objetivo:* Identificar atletas decisivos e sua contribuição direta para resultados positivos.

6. **Tendências Táticas:**  
   Houve evolução na **posse de bola média, número de passes ou precisão** por partida entre 2004 e 2024?  
   ➤ *Objetivo:* Estudar como o futebol brasileiro se modernizou tecnicamente.

7. **Clubes com Maior Disciplina e Indisciplina:**  
   Quais equipes apresentam o **maior e o menor número médio de cartões por partida**?  
   ➤ *Objetivo:* Avaliar padrões de comportamento e estilo de jogo (mais físico ou técnico).

---

## ⚙️ **Estrutura Geral do Projeto**

O projeto adota uma arquitetura **ETL + Data Warehouse**, com três camadas principais:

1. **Camada Raw (Bruta):**  
   Recebe dados originais (`gols_raw`, `estatisticas_raw`, `cartoes_raw`, `partidas_raw`).  

2. **Camada Dimensional:**  
   Estruturas de referência fixas — clubes, técnicos, arenas, atletas e tempo.  

3. **Camada Fato:**  
   Consolida eventos e métricas — partidas, gols, cartões e estatísticas.  

---

## 🧱 **Estrutura do Banco de Dados**

O modelo segue o padrão **estrela (Star Schema)**, otimizando consultas analíticas.

### 🔹 **Tabelas Dimensionais**
- **Dim_Clube** – Identificação dos clubes e estados.  
- **Dim_Tecnico** – Técnicos participantes do campeonato.  
- **Dim_Arena** – Estádios, cidades e estados.  
- **Dim_Atleta** – Jogadores e posições.  
- **Dim_Tempo** – Datas e atributos derivados (ano, mês, dia da semana).  

### 🔸 **Tabelas Fato**
- **Fato_Partida** – Resultados, técnicos, arenas e mandos.  
- **Fato_Estatistica_Clube** – Chutes, passes, posse, faltas, precisão.  
- **Fato_Gol** – Autor, tipo e minuto do gol.  
- **Fato_Cartao** – Jogador, tipo e minuto do cartão.  

---

## 🧾 **Tabelas Brutas (RAW)**

### `futebol.gols_raw`
Registra os gols de cada partida.  
Campos: `partida_id`, `rodada`, `clube`, `atleta`, `minuto`, `tipo_gol`.

### `futebol.estatisticas_raw`
Armazena as estatísticas por clube.  
Campos: `partida_id`, `rodada`, `clube`, `chutes`, `posse_de_bola`, `passes`, `faltas`, `cartao_amarelo`, `cartao_vermelho`, etc.

### `futebol.cartoes_raw`
Registra os cartões aplicados.  
Campos: `partida_id`, `rodada`, `clube`, `cartao`, `atleta`, `num_camisa`, `posicao`, `minuto`.

📦 **Exemplo de carga (BULK INSERT):**
```sql
BULK INSERT futebol.cartoes_raw
FROM 'C:\campeonato-brasileiro-cartoes-clean.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001'
);
```

---

## 🧩 **Scripts SQL**

- `tabelas_dim.sql` → criação das tabelas dimensionais.  
- `tabelas_fato.sql` → criação das tabelas fato.  
- `gols_raw.sql` | `estatisticas_raw.sql` | `cartoes_raw.sql` → tabelas de dados brutos.  
- `sp_ETL_PopulaDimensoes.sql` → procedure de carga das dimensões.  
- `sp_ETL_PopulaFatos.sql` → procedure de carga das tabelas fato via `MERGE`.  
- `funcoes.sql` → funções analíticas personalizadas.  

---

## 🧮 **Funções e Procedures**

### Funções criadas
- **`fn_MediaGolsPorPartida`** – média de gols por clube.  
- **`fn_CartoesAmarelosJogador`** – contagem de cartões amarelos por atleta.  

### Procedures ETL
- **`sp_ETL_PopulaDimensoes`** – limpa e popula dimensões (clubes, técnicos, arenas, atletas e datas).  
- **`sp_ETL_PopulaFatos`** – realiza *UPSERTs* e vincula fatos às dimensões.  

---

## 🗓️ **Próximas Etapas**

1. **Automatizar o ETL completo** com execução sequencial das procedures.  
2. **Validar dados** e conferir totais de gols, cartões e partidas.  
3. **Desenvolver views analíticas** com as consultas propostas.  
4. **Criar dashboards interativos** em Power BI/Tableau.  
5. **Adicionar predições e modelos de regressão** para evolução de desempenho.  

---

## 👥 **Membros do Grupo**

- João Pedro Lima Gaspar  
- Juliard Martins  
- Kaue Pablo Soares  
- Lucas Nogueira  
- Nathan Kevyn  

---

## 🏗️ **Modelo Físico do Banco de Dados**

O modelo estrela do **Brasileirão Analytics** conta com:  
- **5 dimensões:** Clube, Técnico, Arena, Atleta e Tempo.  
- **4 fatos:** Partida, Estatística_Clube, Gol e Cartão.  
- **3 tabelas RAW:** dados de staging para o processo ETL.  

🔗 Relações estruturadas com **chaves primárias e estrangeiras**, permitindo consultas OLAP e relatórios otimizados.   

---

## 🌐 **Dicionário de Dados (HTML)**

O dicionário completo das tabelas fato foi documentado em formato HTML interativo, com detalhamento técnico completo.  

📄 **Arquivo:** [Dicionário de dados site.html](https://github.com/nathan-kevyn/Brasileirao-Analytics-Sistema-de-Dados-do-Campeonato-Brasileiro-2004-2024-/raw/main/site.html)

🔍 **Conteúdo:** estrutura das tabelas `Fato_Partida`, `Fato_Estatistica_Clube`, `Fato_Gol` e `Fato_Cartao`, incluindo **tipos de dados, chaves primárias e estrangeiras, índices e descrições**.  
