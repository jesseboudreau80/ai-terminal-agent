
#!/usr/bin/env bash

set -euo pipefail



cd "$(dirname "$0")/.."



MODEL="${1:-tinyllama}"

MODEL_PATH=""



case "$MODEL" in

  tinyllama)

    MODEL_PATH="models/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf"

    ;;

  mistral)

    MODEL_PATH="models/mistral-7b-instruct.Q4_K_M.gguf"

    ;;

  codellama)

    MODEL_PATH="models/codellama-7b-instruct.Q4_K_M.gguf"

    ;;

  phi2)

    MODEL_PATH="models/phi-2.Q4_K_M.gguf"

    ;;

  mythomax)

    MODEL_PATH="models/mythomax-l2-13b.Q4_K_M.gguf"

    ;;

  *)

    echo "❌ Unknown model: $MODEL"

    echo "Usage: bash scripts/chat-switcher.sh [tinyllama|mistral|codellama|phi2|mythomax]"

    exit 1

    ;;

esac



LLAMA="./llama.cpp/build/bin/llama-cli"



if [ ! -f "$MODEL_PATH" ]; then

  echo "[chat] ❌ Model file not found: $MODEL_PATH"

  exit 1

fi



if [ ! -f "$LLAMA" ]; then

  echo "[chat] ❌ llama-cli binary missing. Run 'bash scripts/install.sh' first."

  exit 1

fi



echo ""

echo "🐾 Launching AI Terminal Agent with model: $MODEL"

echo "----------------------------------------------"

echo ""



# Adjust flags per model

if [ "$MODEL" = "tinyllama" ]; then

  PARAMS="-n 200 -c 2048 -t $(nproc) --temp 0.7 --top-p 0.9 --no-warmup"

else

  PARAMS="-n 200 -c 2048 -t $(nproc) --temp 0.7 --top-p 0.9 --no-warmup --simple-io"

fi



"$LLAMA" -m "$MODEL_PATH" $PARAMS -p "Hello! You are running the $MODEL model."

