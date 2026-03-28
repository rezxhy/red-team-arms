"""
main.py — AgentOS Red Team ARMS
BNP Paribas | Atelier Conformité & Finance Agentique

Ce fichier expose la Red Team comme un serveur FastAPI
connectable à os.agno.com pour le monitoring et la démo.

Usage :
    source venv/bin/activate
    fastapi dev main.py

Puis connecter sur : https://os.agno.com → Add new OS → http://localhost:8000
"""

import os

from agno.os import AgentOS
from dotenv import load_dotenv

# Chargement des variables d'environnement (.env)
load_dotenv()

# Vérification de la clé API
if not os.getenv("GROQ_API_KEY") or os.getenv("GROQ_API_KEY") == "gsk_...":
    raise EnvironmentError(
        "\n❌ GROQ_API_KEY non configurée.\n"
        "   → Crée une clé gratuite sur : https://console.groq.com\n"
        "   → Ouvre le fichier .env et renseigne ta clé.\n"
        "   → Commande : nano .env\n"
    )

from team.red_team_arms import red_team_arms

# ============================================================
# AGENTOS — Expose la Red Team comme une API FastAPI
# Accessible sur http://localhost:8000
# Connectable à os.agno.com pour le monitoring
# ============================================================
agent_os = AgentOS(
    teams=[red_team_arms],  # La Red Team complète avec ses 5 agents
    tracing=True,           # Active la traçabilité des décisions (requis AI Act)
)

# Point d'entrée FastAPI (utilisé par : fastapi dev main.py)
app = agent_os.get_app()