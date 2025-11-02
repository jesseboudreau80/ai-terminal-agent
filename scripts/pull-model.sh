
#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")/.."



MODEL_URL="https://huggingface.co/TheBloke/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf?download=true"

MODEL_PATH="models/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf"



if [ ! -f "$MODEL_PATH" ]; then

  echo "[pull-model] Downloading TinyLlama model..."

  curl -L "$MODEL_URL" -o "$MODEL_PATH"

  echo "[pull-model] Model saved to $MODEL_PATH"

else

  echo "[pull-model] Model already exists."

fi

