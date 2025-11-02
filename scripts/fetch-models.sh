#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."
mkdir -p models

echo "📦 Downloading recommended models into ./models"
echo "----------------------------------------------"

# TinyLlama (Lightweight chat)
if [ ! -f "models/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf" ]; then
  echo "⬇️  Fetching TinyLlama..."
  wget -q --show-progress -O models/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf \
  https://huggingface.co/TheBloke/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf
else
  echo "✅ TinyLlama already present."
fi

# Mistral (Balanced reasoning)
if [ ! -f "models/mistral-7b-instruct-v0.2.Q4_K_M.gguf" ]; then
  echo "⬇️  Fetching Mistral 7B..."
  wget -q --show-progress -O models/mistral-7b-instruct-v0.2.Q4_K_M.gguf \
  https://huggingface.co/TheBloke/Mistral-7B-Instruct-v0.2-GGUF/resolve/main/mistral-7b-instruct-v0.2.Q4_K_M.gguf
else
  echo "✅ Mistral already present."
fi

# CodeLlama (Coding)
if [ ! -f "models/codellama-7b-instruct.Q4_K_M.gguf" ]; then
  echo "⬇️  Fetching CodeLlama 7B..."
  wget -q --show-progress -O models/codellama-7b-instruct.Q4_K_M.gguf \
  https://huggingface.co/TheBloke/CodeLlama-7B-Instruct-GGUF/resolve/main/codellama-7b-instruct.Q4_K_M.gguf
else
  echo "✅ CodeLlama already present."
fi

# Phi-2 (Compact reasoning)
if [ ! -f "models/phi-2.Q4_K_M.gguf" ]; then
  echo "⬇️  Fetching Phi-2..."
  wget -q --show-progress -O models/phi-2.Q4_K_M.gguf \
  https://huggingface.co/TheBloke/phi-2-GGUF/resolve/main/phi-2.Q4_K_M.gguf
else
  echo "✅ Phi-2 already present."
fi

echo ""
echo "🎉 All model downloads complete!"
echo "To chat, try:"
echo "   bash scripts/tinyllama.sh"
echo "   bash scripts/mistral.sh"
echo "   bash scripts/codellama.sh"
echo ""
