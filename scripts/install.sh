#!/usr/bin/env bash
set -euo pipefail

echo "🐾 Setting up AI Terminal Agent..."
echo "-----------------------------------"

# Move to project root
cd "$(dirname "$0")/.."

# Install dependencies
echo "[1/5] Installing system dependencies..."
sudo apt update -y
sudo apt install -y build-essential cmake wget curl git

# Clone llama.cpp if missing
if [ ! -d "llama.cpp" ]; then
  echo "[2/5] Cloning llama.cpp..."
  git clone https://github.com/ggerganov/llama.cpp.git
else
  echo "[2/5] llama.cpp already exists, skipping clone."
fi

# Build llama.cpp
echo "[3/5] Building llama.cpp..."
cd llama.cpp
mkdir -p build && cd build
cmake ..
make -j$(nproc)
cd ../..

# Create model directory
echo "[4/5] Ensuring models directory exists..."
mkdir -p models

# Set permissions
echo "[5/5] Making scripts executable..."
chmod +x scripts/*.sh || true

echo ""
echo "✅ Installation complete!"
echo "You can now download models using:"
echo "   bash scripts/fetch-models.sh"
echo ""
echo "Then start chatting with:"
echo "   bash scripts/tinyllama.sh"
echo ""
