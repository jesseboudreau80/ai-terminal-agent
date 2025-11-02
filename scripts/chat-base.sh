#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

LLAMA="./llama.cpp/build/bin/llama-cli"
MODEL="${MODEL:-models/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf}"

if [ ! -f "$MODEL" ]; then
  echo "❌ Model not found at $MODEL"
  exit 1
fi

if [ ! -f "$LLAMA" ]; then
  echo "❌ llama-cli binary not found. Try rebuilding llama.cpp."
  exit 1
fi

echo ""
echo "🐾 Starting your AI Terminal Agent with model: $(basename "$MODEL")"
echo "---------------------------------------------------------"
echo "Type your prompt and press Enter. Type 'exit' to quit."
echo ""

PARAMS="--n 200 -c 2048 -t $(nproc) --temp 0.7 --top-p 0.9 --no-warmup --simple-io --no-cnv"

while true; do
  read -p "User> " prompt
  [ "$prompt" = "exit" ] && break
  echo ""
  "$LLAMA" -m "$MODEL" $PARAMS -p "$prompt" 2>/dev/null
  echo ""
done

