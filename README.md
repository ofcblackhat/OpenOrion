# 🚀 OpenOrion v3.0 — Autonomous DevOps & Stack Deployment Engine

<div align="center">

```
 ██████╗ ██████╗ ███████╗███╗   ██╗ ██████╗ ██████╗ ██╗ ██████╗ ███╗   ██╗
██╔═══██╗██╔══██╗██╔════╝████╗  ██║██╔═══██╗██╔══██╗██║██╔═══██╗████╗  ██║
██║   ██║██████╔╝█████╗  ██╔██╗ ██║██║   ██║██████╔╝██║██║   ██║██╔██╗ ██║
██║   ██║██╔═══╝ ██╔══╝  ██║╚██╗██║██║   ██║██╔══██╗██║██║   ██║██║╚██╗██║
╚██████╔╝██║     ███████╗██║ ╚████║╚██████╔╝██║  ██║██║╚██████╔╝██║ ╚████║
 ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝
```

**Versão 100% Livre, Autônoma e Desacorrentada do SetupOrion**  
*Zero Telemetria • Zero Dependência de Servidores Terceiros • 115+ Ferramentas Open-Source*

</div>

---

## 🌟 O que é o OpenOrion?

O **OpenOrion** é uma suíte DevOps completa em Bash para automação de provisionamento, proxy reverso (**Traefik** com SSL automático Let's Encrypt), orquestração (**Docker Swarm & Portainer**) e deploy em 1-clique de mais de **115 aplicações open-source** prontas para produção.

Esta versão foi completamente auditada, limpa e desvinculada de qualquer fornecedor proprietário:
- 🚫 **Zero Telemetria:** Removidas todas as 243 requisições de tracking que enviavam o IP do seu servidor e as stacks instaladas para servidores de terceiros.
- 📦 **Autossuficiente:** Todos os templates (Grafana, Zep, Chatwoot, Quepasa/n8n, Formbricks) estão armazenados localmente no diretório `extras/`.
- ⚡ **Deploy Universal em 1 Comando:** Execute diretamente no seu VPS via curl ou clone local.
- 🔒 **Privacidade & Soberania:** Nenhum dado sai da sua máquina.

---

## ⚡ Instalação Rápida (1-Liner)

Em qualquer servidor **Debian 11/12** ou **Ubuntu 20.04/22.04/24.04** recém-formatado (como `root`):

```bash
bash <(curl -sSL https://raw.githubusercontent.com/ofcblackhat/OpenOrion/main/setup.sh)
```

Ou usando `wget`:

```bash
bash <(wget -qO- https://raw.githubusercontent.com/ofcblackhat/OpenOrion/main/setup.sh)
```

### 📂 Execução Local / Offline

Se você já clonou este repositório:

```bash
cd OpenOrion
chmod +x setup.sh openorion.sh
./setup.sh
```

---

## 📊 Comparativo: OpenOrion vs SetupOrion Legado

| Recurso | SetupOrion (Legado) | OpenOrion v3.0 (Este Projeto) |
|---|---|---|
| **Telemetria / Tracking** | 🔴 243 chamadas enviando IP e stacks | 🟢 **0 chamadas (100% Desativado)** |
| **Dependência de Servidores Externos** | 🔴 Depende de S3 e endpoints do fornecedor | 🟢 **100% Autônomo e Local** |
| **Templates & Dashboards** | 🔴 Baixados sob demanda de repositórios externos | 🟢 **Embutidos no pacote (`extras/`)** |
| **Licenciamento** | 🟡 MIT com travas e avisos comerciais | 🟢 **MIT Livre sem restrições** |
| **Banners & Links Comerciais** | 🔴 Grupos VIP, PIX e venda de suporte | 🟢 **Interface Limpa & Profissional** |
| **Suporte a Stacks** | 🟢 115 Aplicações | 🟢 **115+ Aplicações Otimizadas** |

---

## 🛠️ Catálogo de Ferramentas Suportadas (115+ Stacks)

### 🤖 IA, LLMs & Agentes
- **Dify**, **Flowise**, **Langflow**, **OpenWebUI**, **AnythingLLM**, **Ollama**, **Langfuse**, **Zep Memory**, **EvoAI**, **Firecrawl**

### 💬 Atendimento, WhatsApp & Chatbots
- **Chatwoot**, **Evolution API (v1, v2, Lite, Go)**, **Typebot**, **WPPConnect**, **Wuzapi**, **Quepasa**, **UnoAPI**, **TranscreveZap**, **Botpress**

### 🗄️ Bancos de Dados & Vector Stores
- **PostgreSQL**, **PGVector**, **MySQL**, **MongoDB**, **Redis**, **Qdrant**, **ClickHouse**, **RabbitMQ**, **phpMyAdmin**, **pgAdmin 4**, **RedisInsight**

### 📈 CRM, Vendas & Produtividade
- **EvoCRM**, **TwentyCRM**, **KrayinCRM**, **Baserow**, **NocoDB**, **Nocobase**, **Appsmith**, **ToolJet**, **Lowcoder**, **Mautic**, **AstraCampaign**

### 📑 Formulários & Assinatura Digital
- **Formbricks**, **HeyForm**, **Documenso**, **Docuseal**, **OpenSign**

### 🌐 Gestão, Wiki & Colaboração
- **Nextcloud**, **Outline**, **Docmost**, **Wiki.js**, **Focalboard**, **Planka**, **Wekan**, **OpenProject**, **HumHub**, **Excalidraw**, **Affine**

### 📊 Monitoramento, Logs & Infraestrutura
- **Traefik**, **Portainer**, **Uptime Kuma**, **Grafana & Prometheus**, **NetBox**, **Kafka UI**, **CheckMate**, **Duplicati**, **PgBackWeb**

### 🔒 Autenticação, Senhas & Utilitários
- **Authentik**, **Keycloak**, **Vaultwarden (Bitwarden)**, **Passbolt**, **Browserless**, **Gotenberg**, **Stirling PDF**, **Code-Server (VS Code)**, **RustDesk**, **MinIO (S3)**, **Supabase**, **Strapi**, **Directus**, **WordPress**, **Odoo**, **GLPI**, **Cal.com**, **Jitsi Meet**, **Azuracast**, **Shlink**, **Yourls**, **Ntfy**, **Traccar**, **SerpBear**, **OmniTools**, **Papra**, **ZeroByte**, **WiseMapping**, **Moodle**

---

## 📁 Estrutura do Repositório

```
OpenOrion/
├── setup.sh                 # Bootloader de inicialização e checagem de ambiente
├── openorion.sh             # Motor principal interativo com 115+ stacks
├── extras/                  # Templates, e-mails, dashboards e workflows offline
│   ├── Chatwoot/emails/     # Templates HTML de e-mails transacionais do Chatwoot
│   ├── Grafana/             # Dashboards e métricas do monitor Prometheus/Grafana
│   ├── Zep/                 # Configurações do Zep Memory Server
│   ├── quepasa_workflows/   # Workflows JSON prontos para N8N & Quepasa
│   ├── formbricks/          # Schemas do Cube.js para analytics do Formbricks
│   ├── Supabase/            # Configurações de deployment local do Supabase
│   └── Krayin/ / Meets/     # Configurações adicionais
└── README.md                # Documentação técnica completa
```

---

## 📜 Licença

Distribuído sob a **Licença MIT**. Sinta-se livre para utilizar em ambientes pessoais, empresariais ou comerciais com soberania total.
