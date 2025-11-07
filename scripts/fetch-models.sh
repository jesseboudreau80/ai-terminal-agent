#!/usr/bin/env bash
set -euo pipefail

echo "📦 Checking and fetching all necessary models..."
mkdir -p models

# --- TinyLlama (Lightweight chat) ---
if [ ! -f "models/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf" ]; then
  echo "🐣 Fetching TinyLlama..."
  wget -q --show-progress -O models/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf \
    https://huggingface.co/TheBloke/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf
else
  echo "✅ TinyLlama already present."
fi

# --- Mistral (Balanced reasoning) ---
if [ ! -f "models/mistral-7b-instruct.Q4_K_M.gguf" ]; then
  echo "🌪️ Fetching Mistral 7B..."
  wget -q --show-progress -O models/mistral-7b-instruct.Q4_K_M.gguf \
    https://huggingface.co/TheBloke/Mistral-7B-Instruct-v0.2-GGUF/resolve/main/mistral-7b-instruct-v0.2.Q4_K_M.gguf
else
  echo "✅ Mistral already present."
fi

# --- Optional models (disable for now) ---
# if [ ! -f "models/codellama-7b-instruct.Q4_K_M.gguf" ]; then
#   echo "💻 Fetching CodeLlama 7B..."
#   wget -q --show-progress -O models/codellama-7b-instruct.Q4_K_M.gguf \
#     https://huggingface.co/TheBloke/CodeLlama-7B-Instruct-GGUF/resolve/main/codellama-7b-instruct.Q4_K_M.gguf
# else
#   echo "✅ CodeLlama already present."
# fi

# if [ ! -f "models/phi-2.Q4_K_M.gguf" ]; then
#   echo "🧮 Fetching Phi-2..."
#   wget -q --show-progress -O models/phi-2.Q4_K_M.gguf \
#     https://huggingface.co/TheBloke/phi-2-GGUF/resolve/main/phi-2.Q4_K_M.gguf
# else
#   echo "✅ Phi-2 already present."
# fi

# --- MiniLM (Embedding model) ---
if [ ! -f "models/all-MiniLM-L6-v2.Q4_K_M.gguf" ]; then
  echo "🧩 Fetching all-MiniLM-L6-v2 embedder..."
  wget -q --show-progress -O models/all-MiniLM-L6-v2.Q4_K_M.gguf \
    https://huggingface.co/ggml-org/sentence-transformers_all-MiniLM-L6-v2-GGUF/resolve/main/all-MiniLM-L6-v2.Q4_K_M.gguf
else
  echo "✅ MiniLM embedder already present."
fi

echo ""
echo "🎯 All model downloads complete! Models ready in ./models"
