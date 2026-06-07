# ♻️ ReciclaJá — API REST

API funcional em **Node.js + Express** que conecta **pontos de coleta** de materiais recicláveis a **usuários** interessados em reciclar. Implementa operações **CRUD completas** para **3 entidades** com banco de dados relacional.

---

## 🧱 Entidades

| Entidade | Descrição | Relacionamento |
|----------|-----------|----------------|
| **usuarios** | Pessoas cadastradas que querem reciclar | — |
| **pontos_coleta** | Locais cadastrados que recebem recicláveis | — |
| **coletas** | Registro de uma reciclagem (liga usuário ↔ ponto) | FK para `usuarios` e `pontos_coleta` |

A entidade **coletas** cria a relação **N:N** entre usuários e pontos, demonstrando a comunicação entre tabelas (com `JOIN` para trazer os nomes).

---

## 🛠️ Tecnologias

- **Node.js 22+** + **Express** — servidor e rotas
- **SQLite** via `node:sqlite` (nativo do Node 22 — **não precisa instalar banco**)
- **zod** — validação de dados de entrada
- **bcryptjs** — hash de senhas
- **cors** + **morgan** — middlewares de apoio

> O código de acesso ao banco (`db.prepare(...).run()/.get()/.all()`) é idêntico ao do pacote `better-sqlite3`. Para trocar de driver ou de banco (MySQL/Postgres), basta alterar **uma linha** em `src/config/database.js`.

---

## 🚀 Como rodar

> Pré-requisito: **Node.js versão 22.5 ou superior** (`node -v`).

```bash
# 1. Instalar dependências
npm install

# 2. Criar as tabelas
npm run db:init

# 3. (Opcional) Popular com dados de exemplo
npm run db:seed

# 4. Subir a API
npm start          # ou: npm run dev  (reinicia ao salvar)
```

A API sobe em **http://localhost:3000**. Teste rápido:

```bash
curl http://localhost:3000/api/health
```

Há um arquivo **`requests.http`** com exemplos de todas as rotas (use a extensão *REST Client* do VS Code, ou importe no Insomnia/Postman).

---

## 📁 Estrutura do projeto

```
reciclaja-api/
├── src/
│   ├── server.js              # ponto de entrada
│   ├── app.js                 # configuração do Express
│   ├── config/
│   │   ├── env.js             # variáveis de ambiente
│   │   └── database.js        # conexão com o banco
│   ├── database/
│   │   ├── schema.sql         # definição das tabelas
│   │   ├── init.js            # cria as tabelas
│   │   └── seed.js            # dados de exemplo
│   ├── middlewares/
│   │   ├── validate.js        # validação (zod)
│   │   ├── notFound.js        # 404
│   │   └── errorHandler.js    # tratamento central de erros
│   ├── utils/
│   │   └── ApiError.js        # erro com status HTTP
│   ├── routes/
│   │   └── index.js           # agregador das rotas /api
│   └── modules/               # um módulo por entidade
│       ├── usuarios/
│       ├── pontos/
│       └── coletas/
│           ├── *.repository.js  # acesso ao banco (SQL)
│           ├── *.service.js     # regras de negócio
│           ├── *.controller.js  # entrada/saída HTTP
│           ├── *.routes.js      # mapeamento das rotas
│           └── *.schema.js      # validação dos dados
├── requests.http
├── package.json
└── README.md
```

**Arquitetura em camadas** (separação de responsabilidades):

```
Requisição → Rotas → Validação → Controller → Service → Repository → Banco
```

---

## 📡 Endpoints

Base: `http://localhost:3000/api`

### Usuários — `/usuarios`
| Método | Rota | Ação |
|--------|------|------|
| GET | `/usuarios` | Lista todos |
| GET | `/usuarios/:id` | Busca por id |
| POST | `/usuarios` | Cria |
| PUT | `/usuarios/:id` | Atualiza |
| DELETE | `/usuarios/:id` | Remove |

### Pontos de coleta — `/pontos`
| Método | Rota | Ação |
|--------|------|------|
| GET | `/pontos` | Lista (filtros: `?cidade=`, `?ativo=true`) |
| GET | `/pontos/:id` | Busca por id |
| POST | `/pontos` | Cria |
| PUT | `/pontos/:id` | Atualiza |
| DELETE | `/pontos/:id` | Remove |

### Coletas — `/coletas`
| Método | Rota | Ação |
|--------|------|------|
| GET | `/coletas` | Lista (filtros: `?usuario_id=`, `?ponto_id=`, `?status=`) |
| GET | `/coletas/:id` | Busca por id |
| POST | `/coletas` | Cria (valida se usuário e ponto existem) |
| PUT | `/coletas/:id` | Atualiza |
| DELETE | `/coletas/:id` | Remove |

---

## 📦 Exemplos de corpo (JSON)

**Criar usuário** — `POST /api/usuarios`
```json
{
  "nome": "Ana Recicladora",
  "email": "ana@email.com",
  "senha": "senha123",
  "telefone": "11999990001",
  "cidade": "São Paulo"
}
```

**Criar ponto** — `POST /api/pontos`
```json
{
  "nome": "EcoPonto Centro",
  "endereco": "Praça da Sé, 100",
  "cidade": "São Paulo",
  "latitude": -23.5505,
  "longitude": -46.6333,
  "materiais": ["papel", "plástico", "vidro"],
  "horario": "Seg-Sex 8h-18h",
  "ativo": true
}
```

**Criar coleta** — `POST /api/coletas`
```json
{
  "usuario_id": 1,
  "ponto_id": 1,
  "material": "papel",
  "quantidade_kg": 5.5,
  "status": "agendada",
  "data_agendada": "2026-06-20"
}
```

---

## ⚠️ Respostas de erro (padrão)

| Código | Quando |
|--------|--------|
| `400` | Dados inválidos (com lista de campos) ou FK inexistente |
| `404` | Recurso ou rota não encontrada |
| `409` | Conflito (ex.: e-mail já cadastrado) |
| `500` | Erro interno |

Exemplo de erro de validação:
```json
{
  "erro": "Dados inválidos",
  "detalhes": [
    { "campo": "email", "mensagem": "e-mail inválido" }
  ]
}
```

---

## 🔒 Observações

- As senhas são armazenadas com **hash bcrypt** e nunca retornam nas respostas.
- O banco fica em `data/reciclaja.db` (criado automaticamente; ignorado pelo Git).
- Senha padrão dos usuários do seed: `senha123`.
