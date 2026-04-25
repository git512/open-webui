#cd ~/open-webui/backend; source ../.venv/bin/activate; export #OPENAI_API_BASE_URL=http://192.168.11.250:19090/v1; export OPENAI_API_KEY=sk-local; #python3 -m uvicorn open_webui.main:app --host 0.0.0.0 --port 8080


#!/bin/bash
cd ~/open-webui/backend
source ../.venv/bin/activate
# === Backend Config ===
export OPENAI_API_BASE_URL=http://192.168.11.250:19090/v1
export OPENAI_API_KEY=sk-local

# === Existing TTS settings (keep these) ===
export AUDIO_TTS_ENGINE=openai
export AUDIO_TTS_OPENAI_API_BASE_URL=http://192.168.11.250:8880/v1
export AUDIO_TTS_OPENAI_API_KEY=not-needed

# === New: Web Search Settings ===
export ENABLE_WEB_SEARCH=True          # or WEB_SEARCH_ENABLED=True depending on version
export WEB_SEARCH_TRUST_ENV=True       # Helps with proxies/networking

# === change number of cpu threads for whisper ===
export WHISPER_CPU_THREADS=38
# If using a specific engine via env (optional)
# export WEB_SEARCH_ENGINE=brave
# export BRAVE_SEARCH_API_KEY=your_key_here

python3 -m uvicorn open_webui.main:app --host 0.0.0.0 --port 8080
