#!/usr/bin/env bash
# ==============================================================================
#  ██████╗ ██████╗ ███████╗███╗   ██╗ ██████╗ ██████╗ ██╗ ██████╗ ███╗   ██╗
# ██╔═══██╗██╔══██╗██╔════╝████╗  ██║██╔═══██╗██╔══██╗██║██╔═══██╗████╗  ██║
# ██║   ██║██████╔╝█████╗  ██╔██╗ ██║██║   ██║██████╔╝██║██║   ██║██╔██╗ ██║
# ██║   ██║██╔═══╝ ██╔══╝  ██║╚██╗██║██║   ██║██╔══██╗██║██║   ██║██║╚██╗██║
# ╚██████╔╝██║     ███████╗██║ ╚████║╚██████╔╝██║  ██║██║╚██████╔╝██║ ╚████║
#  ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝
# ==============================================================================
# OpenOrion v3.0.0 — Autonomous DevOps & Stack Deployment Engine
# 100% Open-Source | Zero Telemetria | Independência Total de Fornecedores
# ==============================================================================

set -e

# Configurações do Repositório OpenOrion
REPO_URL="https://raw.githubusercontent.com/ofcblackhat/OpenOrion/main"
GIT_REPO="https://github.com/ofcblackhat/OpenOrion.git"
INSTALL_DIR="/root/openorion"

# Cores
verde="\e[32m"
amarelo="\e[33m"
branco="\e[97m"
bege="\e[93m"
vermelho="\e[91m"
ciano="\e[36m"
reset="\e[0m"

banner() {
    clear
    echo -e "$verde===================================================================================================$reset"
    echo -e "$verde=                                                                                                 $verde=$reset"
    echo -e "$verde=   $branco ██████╗ ██████╗ ███████╗███╗   ██╗ ██████╗ ██████╗ ██╗ ██████╗ ███╗   ██╗                 $verde=$reset"
    echo -e "$verde=   $branco██╔═══██╗██╔══██╗██╔════╝████╗  ██║██╔═══██╗██╔══██╗██║██╔═══██╗████╗  ██║                 $verde=$reset"
    echo -e "$verde=   $branco██║   ██║██████╔╝█████╗  ██╔██╗ ██║██║   ██║██████╔╝██║██║   ██║██╔██╗ ██║                 $verde=$reset"
    echo -e "$verde=   $branco██║   ██║██╔═══╝ ██╔══╝  ██║╚██╗██║██║   ██║██╔══██╗██║██║   ██║██║╚██╗██║                 $verde=$reset"
    echo -e "$verde=   $branco╚██████╔╝██║     ███████╗██║ ╚████║╚██████╔╝██║  ██║██║╚██████╔╝██║ ╚████║                 $verde=$reset"
    echo -e "$verde=   $branco ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝                 $verde=$reset"
    echo -e "$verde=                                                                                                 $verde=$reset"
    echo -e "$verde=                     $branco OpenOrion v3.0 — DevOps & Stack Deployment Engine                          $verde=$reset"
    echo -e "$verde=                               $ciano 100% Open Source | Zero Telemetria                                 $verde=$reset"
    echo -e "$verde=                                                                                                 $verde=$reset"
    echo -e "$verde===================================================================================================$reset"
    echo ""
}

banner
echo -e "$ciano[*] Iniciando checagem de ambiente do OpenOrion...$reset"
sleep 1

# 1. Checagem de privilégios de ROOT
if [ "$(id -u)" -ne 0 ]; then
    echo -e "$vermelho[!] Este script precisa ser executado como root. Abortando.$reset"
    exit 1
fi

# 2. Criar diretório de trabalho
mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR"

# 3. Atualizar repositórios e instalar utilitários essenciais
echo -e "$ciano[1/6] Atualizando listas de pacotes...$reset"
export DEBIAN_FRONTEND=noninteractive
apt-get update -y > /dev/null 2>&1 || true

echo -e "$ciano[2/6] Instalando dependências de sistema (curl, wget, jq, git, python3, dialog)...$reset"
apt-get install -y sudo apt-utils dialog jq apache2-utils git python3 neofetch curl wget ca-certificates > /dev/null 2>&1 || true

# 4. Checagem e Configuração do Docker
echo -e "$ciano[3/6] Verificando Docker e Docker Swarm...$reset"
if ! command -v docker &> /dev/null; then
    echo -e "$amarelo[i] Docker não encontrado. Instalando Docker oficial...$reset"
    curl -fsSL https://get.docker.com | bash > /dev/null 2>&1
    systemctl enable docker > /dev/null 2>&1 || true
    systemctl start docker > /dev/null 2>&1 || true
fi

# Ajuste do Docker API Version
mkdir -p /etc/systemd/system/docker.service.d >/dev/null 2>&1
cat > /etc/systemd/system/docker.service.d/override.conf <<EOF
[Service]
Environment=DOCKER_MIN_API_VERSION=1.24
EOF
systemctl daemon-reload >/dev/null 2>&1 || true
systemctl restart docker >/dev/null 2>&1 || true

# 5. Inicializar Docker Swarm se ainda não estiver ativo
if ! docker info 2>/dev/null | grep -q "Swarm: active"; then
    echo -e "$ciano[4/6] Inicializando Docker Swarm...$reset"
    docker swarm init > /dev/null 2>&1 || true
fi

# 6. Carregar o motor OpenOrion e os Extras
echo -e "$ciano[5/6] Preparando motor OpenOrion e templates offline...$reset"

if [ -f "./openorion.sh" ]; then
    echo -e "$verde[OK] openorion.sh local detectado.$reset"
elif [ -f "../openorion.sh" ]; then
    cp "../openorion.sh" ./openorion.sh
    echo -e "$verde[OK] openorion.sh copiado do diretório superior.$reset"
else
    echo -e "$ciano[i] Baixando openorion.sh do repositório...$reset"
    curl -sSL "${REPO_URL}/openorion.sh" -o "./openorion.sh" || {
        echo -e "$vermelho[!] Falha ao baixar via raw. Tentando clone do repositório...$reset"
        git clone --depth 1 "$GIT_REPO" /tmp/openorion_repo > /dev/null 2>&1 || true
        if [ -f "/tmp/openorion_repo/openorion.sh" ]; then
            cp -r /tmp/openorion_repo/* "$INSTALL_DIR/"
            rm -rf /tmp/openorion_repo
        fi
    }
fi

# Garantir permissão de execução
chmod +x ./openorion.sh

echo -e "$verde[6/6] Ambiente pronto! Lançando OpenOrion...$reset"
sleep 1

# 7. Executar o OpenOrion Engine
exec ./openorion.sh
