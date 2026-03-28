#!/bin/bash

# ============================================================
# Script de setup — Red Team ARMS (Ubuntu)
# ============================================================

set -e  # Arrêt immédiat en cas d'erreur

echo ""
echo "============================================================"
echo "  🔴 Red Team ARMS — Setup Ubuntu"
echo "============================================================"
echo ""

# --- Étape 1 : Paquets système ---
echo "📦 [1/5] Installation des paquets système..."
sudo apt update -qq
sudo apt install -y python3 python3-pip python3-venv
echo "    ✅ Paquets système installés"

# --- Étape 2 : Environnement virtuel ---
echo ""
echo "🐍 [2/5] Création de l'environnement virtuel..."
python3 -m venv venv
echo "    ✅ Environnement virtuel créé dans ./venv"

# --- Étape 3 : Activation du venv ---
echo ""
echo "⚡ [3/5] Activation de l'environnement virtuel..."
source venv/bin/activate
echo "    ✅ Environnement virtuel activé"

# --- Étape 4 : Mise à jour de pip et installation des dépendances ---
echo ""
echo "📥 [4/5] Installation des dépendances Python..."
pip install --upgrade pip -q
pip install -r requirements.txt -q
echo "    ✅ Dépendances installées"

# --- Étape 5 : Fichier .env ---
echo ""
echo "🔑 [5/5] Configuration de l'environnement..."
if [ ! -f ".env" ]; then
    cp .env.example .env
    echo "    ⚠️  Fichier .env créé. Tu dois y ajouter ta clé API Anthropic :"
    echo "       nano .env"
else
    echo "    ✅ Fichier .env déjà existant"
fi

# --- Résumé ---
echo ""
echo "============================================================"
echo "  ✅ Setup terminé avec succès !"
echo "============================================================"
echo ""
echo "  👉 Étapes suivantes :"
echo ""
echo "  1. Ajoute ta clé API dans .env :"
echo "     nano .env"
echo ""
echo "  2. Active le venv (à chaque nouveau terminal) :"
echo "     source venv/bin/activate"
echo ""
echo "  3. Lance le serveur AgentOS :"
echo "     fastapi dev main.py"
echo ""
echo "  4. Connecte-toi sur os.agno.com :"
echo "     → Clique sur 'Add new OS'"
echo "     → Entrer l'URL : http://localhost:8000"
echo "     → Clique sur 'Connect'"
echo ""