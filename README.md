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
  Cruzar dados coletivos e individuais para gerar relatórios táticos e estratégicos.  

- 🧤 **Comissões Técnicas e Analistas de Jogo:**  
  Monitorar o comportamento dos clubes em momentos decisivos e a eficiência sob pressão.  

- 💼 **Gestores e Diretores de Futebol:**  
  Apoiar decisões de investimento e contratações com base em dados históricos e indicadores de performance.  

---

## 🔍 **Plano de Análise**

O projeto inclui um conjunto de **consultas analíticas** voltadas à exploração de padrões técnicos e táticos do Brasileirão.  

*(mantido igual ao conteúdo anterior — perguntas analíticas 1 a 7)*  

---

## ⚙️ **Estrutura Geral do Projeto**

O projeto adota uma arquitetura **ETL + Data Warehouse**, com três camadas principais:

1. **Camada Raw (Bruta)** – Recebe dados originais (`gols_raw`, `estatisticas_raw`, `cartoes_raw`, `partidas_raw`);  
2. **Camada Dimensional** – Estruturas de referência fixas (Clubes, Técnicos, Arenas, Atletas e Tempo);  
3. **Camada Fato** – Consolida eventos e métricas (Partidas, Gols, Cartões e Estatísticas).  

---

## 🧱 **Estrutura do Banco de Dados**

Modelo **estrela (Star Schema)** com:

- **5 Dimensões:** `Dim_Clube`, `Dim_Tecnico`, `Dim_Arena`, `Dim_Atleta`, `Dim_Tempo`.  
- **4 Fatos:** `Fato_Partida`, `Fato_Estatistica_Clube`, `Fato_Gol`, `Fato_Cartao`.  

---

## 🧾 **Tabelas Brutas (RAW)**

*(mantido igual — descrição de `gols_raw`, `estatisticas_raw`, `cartoes_raw` com exemplo de BULK INSERT)*  

---

## 🧩 **Scripts SQL**

- `tabelas_dim.sql` → criação das tabelas dimensionais.  
- `tabelas_fato.sql` → criação das tabelas fato.  
- `gols_raw.sql`, `estatisticas_raw.sql`, `cartoes_raw.sql` → tabelas brutas.  
- `sp_ETL_PopulaDimensoes.sql` → carga de dimensões.  
- `sp_ETL_PopulaFatos.sql` → carga de fatos.  
- `funcoes.sql` → funções analíticas.  

---

## 🧮 **Funções e Procedures**

- **Funções:**  
  - `fn_MediaGolsPorPartida()`  
  - `fn_CartoesAmarelosJogador()`  

- **Procedures ETL:**  
  - `sp_ETL_PopulaDimensoes()`  
  - `sp_ETL_PopulaFatos()`  

---

## 🗓️ **Próximas Etapas**

1. Automatizar ETL completo;  
2. Validar dados (gols, cartões, partidas);  
3. Criar *views* analíticas;  
4. Desenvolver dashboards em Power BI/Tableau;  
5. Adicionar modelos de previsão.  

---

## 👥 **Membros do Grupo**

- João Pedro Lima Gaspar  
- Juliard Martins  
- Kaue Pablo Soares  
- Lucas Nogueira  
- Nathan Kevyn  

---

## 🏗️ **Modelo Físico do Banco de Dados**

O modelo estrela possui **5 dimensões**, **4 fatos** e **3 tabelas brutas (RAW)**, interligadas por chaves primárias e estrangeiras, permitindo **consultas OLAP e relatórios de performance**.  

---

## 🌐 **Dicionário de Dados (HTML)**

O dicionário completo das tabelas fato foi documentado em formato HTML, com design interativo e detalhamento técnico.  

📄 **Arquivo:** [`Dicionario de dados site.html`](sandbox:/mnt/data/Dicionario%20de%20dados%20site.html)  
🔍 **Conteúdo:** estrutura das tabelas `Fato_Partida`, `Fato_Estatistica_Clube`, `Fato_Gol` e `Fato_Cartao`, incluindo **tipos, chaves, índices e descrições**.  

