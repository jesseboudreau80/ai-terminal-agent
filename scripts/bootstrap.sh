
#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")/.."



echo "[bootstrap] Updating apt..."

sudo apt-get update -y



echo "[bootstrap] Installing build tools..."

sudo apt-get install -y build-essential cmake wget curl



mkdir -p models build



if [ ! -d "llama.cpp" ]; then

  echo "[bootstrap] Cloning llama.cpp..."

  git clone https://github.com/ggerganov/llama.cpp.git

fi



echo "[bootstrap] Building llama.cpp..."

cd llama.cpp && make -j && cd ..



echo "[bootstrap] Downloading TinyLlama model..."

bash scripts/pull-model.sh



echo "[bootstrap] Done. Run: bash scripts/chat.sh"

