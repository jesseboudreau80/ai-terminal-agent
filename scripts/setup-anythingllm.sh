#!/usr/bin/env bash
set -euo pipefail

echo "🐳 Setting up persistent AnythingLLM instance..."

# Create Docker network if missing
docker network inspect llmnet >/dev/null 2>&1 || docker network create llmnet

# Stop old container
docker rm -f anythingllm >/dev/null 2>&1 || true

# Make sure data dir exists
sudo mkdir -p /home/jesseboudreau/anythingllm_data
sudo chmod -R 777 /home/jesseboudreau/anythingllm_data

# Run AnythingLLM connected to LocalAI
docker run -d --name anythingllm --network llmnet --restart always -p 3001:3001 -v /home/jesseboudreau/anythingllm_data:/app/server/storage -e STORAGE_DIR=/app/server/storage -e LLM_PROVIDER=custom -e CUSTOM_PROVIDER_BASE_URL=http://localai:8080/v1 -e CUSTOM_PROVIDER_API_KEY=dummy-key mintplexlabs/anythingllm

echo "✅ AnythingLLM started. Access it at: http://localhost:3001"
echo "💾 Data persisted in /home/jesseboudreau/anythingllm_data"
