#!/usr/bin/env bash
set -euo pipefail

echo "🐍 Setting up LocalAI (offline inference engine)..."

# Create Docker network if missing
docker network inspect llmnet >/dev/null 2>&1 || docker network create llmnet

# Stop and remove old container
docker rm -f localai >/dev/null 2>&1 || true

# Run LocalAI with persistent and networked setup
docker run -d --name localai --network llmnet --restart always -p 8080:8080 -v /home/jesseboudreau/projects/ai-terminal-agent/models:/models -e THREADS=$(nproc) -e CONTEXT_SIZE=8192 -e MODELS_PATH=/models quay.io/go-skynet/local-ai:latest

echo "✅ LocalAI started and networked at: http://localhost:8080"
echo "💾 Models loaded from: /home/jesseboudreau/projects/ai-terminal-agent/models"
