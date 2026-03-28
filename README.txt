Framework  : Agno (https://docs.agno.com)
Modèle IA  : Groq — Llama 3.3 70B (gratuit)
Interface  : os.agno.com
Règlement  : DORA · MiCA · AI Act · RGPD
Date rendu : Dimanche 29 Mars 2026 à 00h00

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  INSTALLATION (À FAIRE UNE SEULE FOIS)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  1. Ouvrir un terminal Ubuntu et aller dans le dossier du projet :
       cd ~/red_teams

  2. Rendre le script exécutable et le lancer :
       chmod +x setup.sh
       ./setup.sh

     Ce script installe automatiquement :
       ✔ Python 3, pip et venv (via apt)
       ✔ L'environnement virtuel (dossier venv/)
       ✔ Toutes les dépendances Python (requirements.txt)
       ✔ Le fichier .env à partir de env.example

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  OBTENIR LA CLÉ API GROQ (GRATUITE)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1. Aller sur : https://console.groq.com
  
2. Créer un compte (connexion Google possible)
  
3. Cliquer sur "API Keys" dans le menu gauche
  
4. Cliquer sur "Create API Key"
  
5. Copier la clé générée (commence par "gsk_...")
  
6. Coller la clé dans le fichier .env :
nano .env

Modifier la ligne :
GROQ_API_KEY=gsk_...

Sauvegarder : Ctrl+O → Entrée → Ctrl+X

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  LANCER LE SERVEUR (À CHAQUE SESSION)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Ouvrir un terminal et exécuter ces 3 commandes dans l'ordre :

    cd ~/red_teams
    source venv/bin/activate
    fastapi dev main.py

  Le serveur est prêt quand tu vois :
       INFO    Uvicorn running on http://127.0.0.1:8000

  IMPORTANT : Ne ferme JAMAIS ce terminal pendant la session.
              Si tu fermes le terminal, relancer les 3 commandes ci-dessus.

  OPTION PORT PERSONNALISÉ (si le port 8000 est déjà utilisé) :
  fastapi dev main.py --port 7777

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  CONNEXION À OS.AGNO.COM
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  1. Ouvrir le navigateur et aller sur : https://os.agno.com
  2. Créer un compte (Google ou email)
  3. Cliquer sur "Add new OS"
  4. Remplir le formulaire :

       Environment  →  Local
       Endpoint URL →  http://localhost:8000
                       (ou http://localhost:7777 si port personnalisé)
       OS Name      →  Red Team ARMS

  5. Cliquer sur "Connect"
  6. Vérifier que le statut affiche "Running"

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  UTILISER LA RED TEAM DANS OS.AGNO.COM
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  1. Dans le dashboard os.agno.com, cliquer sur "Chat"
  2. Sélectionner "Red Team ARMS — BNP Paribas" dans la liste
  3. Coller le message suivant dans le chat :

  ─────────────────────────────────────────────────────────────────────────────
  Lance une simulation complète d'attaque contre le système ARMS de BNP Paribas.

  Scénario 1 (cyber) : Exploitation de l'API KYC tierce (Jumio)
  pour injecter de fausses validations d'identité et contourner les contrôles LCB-FT.

  Scénario 2 (IA/Data) : Data poisoning progressif sur le modèle de détection
  pour induire des faux négatifs sur les transactions crypto < 10 000 €.

  Fournis pour chaque scénario :
  - Les étapes de l'attaque
  - Le point de rupture critique
  - Les infractions DORA / MiCA / AI Act
  - Le score de risque final (0 à 1)
  - Les recommandations
  ─────────────────────────────────────────────────────────────────────────────

  4. Attendre les réponses des 5 agents dans l'ordre :
       #01 Agent Reconnaissance    → carte des surfaces d'attaque
       #02 Agent Attaquant         → scénario cyber step-by-step
       #03 Agent IA Adversaire     → data poisoning
       #04 Agent Compliance Breaker → infractions réglementaires
       #05 Agent Risk Scoring      → score final + recommandations

  LIMITE GROQ GRATUIT : attendre 2-3 minutes entre les messages
  si tu vois l'erreur "Rate limit exceeded".


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  RÉSOLUTION DES PROBLÈMES FRÉQUENTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  PROBLÈME : "GROQ_API_KEY non configurée"
  SOLUTION  : Vérifier le contenu du fichier .env
                cat .env
              La clé doit commencer par "gsk_" et ne pas être "gsk_..."

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  LIENS UTILES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Documentation Agno    : https://docs.agno.com
  Interface AgentOS     : https://os.agno.com
  Clé API Groq          : https://console.groq.com
  Règlement DORA        : https://www.eba.europa.eu (Digital Operational Resilience Act)
  Règlement MiCA        : https://www.esma.europa.eu (Markets in Crypto-Assets)
  EU AI Act             : https://digital-strategy.ec.europa.eu
