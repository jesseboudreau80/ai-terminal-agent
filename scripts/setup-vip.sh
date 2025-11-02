
#!/usr/bin/env bash

set -euo pipefail



echo ""

echo "🐾 Welcome to the AI Terminal Agent — VIP Setup!"

echo "-----------------------------------------------"

echo "This script will automatically build llama.cpp, download models,"

echo "and launch your first local AI chat experience."

echo ""



cd "$(dirname "$0")/.."



# 1️⃣ Check dependencies

echo "📦 Checking dependencies..."

sudo apt update -y

sudo apt install -y git cmake build-essential curl wget



# 2️⃣ Initialize llama.cpp submodule

echo ""

echo "🔧 Setting up llama.cpp..."

git submodule update --init --recursive



cd llama.cpp

if [ ! -d build ]; then

  mkdir build

fi

cd build

cmake ..

make -j$(nproc)

cd ../..



# 3️⃣ Create models directory

mkdir -p models



# 4️⃣ Download TinyLlama (lightweight model for fast startup)

if [ ! -f "models/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf" ]; then

  echo ""

  echo "⬇️ Downloading TinyLlama model (~600MB)..."

  wget -O models/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf \

    https://huggingface.co/TheBloke/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf

else

  echo "✅ TinyLlama already present."

fi



# 5️⃣ Run a test chat

echo ""

echo "🚀 Launching your first AI chat..."

bash scripts/chat-switcher.sh tinyllama



echo ""

echo "✨ Setup complete! You can now run any of these:"

echo "  bash scripts/chat-switcher.sh mistral"

echo "  bash scripts/chat-switcher.sh codellama"

echo "  bash scripts/chat-switcher.sh phi2"

echo "  bash scripts/chat-switcher.sh mythomax"

echo ""

echo "🐶 Run it local. Run it fast. Run it private. — 🧠 AI Terminal Agent"

