
#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")/.."



MODEL="models/mistral-7b-instruct-v0.2.Q4_K_M.gguf"

LLAMA="./llama.cpp/build/bin/llama-cli"



if [ ! -f "$MODEL" ]; then

  echo "[chat] ❌ Model not found at $MODEL"

  exit 1

fi



if [ ! -f "$LLAMA" ]; then

  echo "[chat] ❌ llama-cli binary not found. Try rebuilding llama.cpp."

  exit 1

fi



echo ""

echo "🐾 Starting your AI Terminal Agent..."

echo "--------------------------------------"

echo "Type your prompt and press Enter. Type 'exit' to quit."

echo ""



PARAMS="-n 200 -c 2048 -t $(nproc) --temp 0.7 --top-p 0.9 --no-warmup --simple-io -no-cnv"



while true; do

  read -p "User> " prompt

  if [[ "$prompt" == "exit" ]]; then

    echo "Goodbye!"

    break

  fi

  echo ""

  echo "Assistant>"

  $LLAMA -m "$MODEL" $PARAMS -p "$prompt" 2>/dev/null

  echo ""

done

