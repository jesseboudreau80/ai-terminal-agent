🧠 AI Terminal Agent
Local LLM Chat — Fast, Private, and 100% Offline

Welcome to the AI Terminal Agent, a lightweight local-AI environment powered by llama.cpp
.
It runs directly from your terminal — no APIs, no tokens, no cloud costs.

🚀 Quick Start
# Clone with submodules (important!)
git clone --recurse-submodules https://github.com/jesseboudreau80/ai-terminal-agent.git
cd ai-terminal-agent

# (Optional) Pull latest llama.cpp updates
git submodule update --init --recursive

# Build llama.cpp
cd llama.cpp
mkdir -p build && cd build
cmake ..
make -j$(nproc)
cd ../..

# Start your local chat
bash scripts/chat.sh


You’ll see:

🐾 Starting your AI Terminal Agent...
--------------------------------------
Type your prompt and press Enter. Type 'exit' to quit.

💬 Example Prompts
User> summarize the benefits of running an AI model locally  
User> write a bash script that monitors CPU usage  
User> explain how to set up FastAPI + React  
User> act as a dog daycare training simulator (game logic)

🧩 Switching Models

Place additional .gguf model files into your models/ folder.
Here are some suggested options:

Model	Size	Ideal For	Example
TinyLlama 1.1B	~0.6 GB	Fast, lightweight chat	tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf
Mistral 7B	~4 GB	Balanced reasoning	mistral-7b-instruct-v0.2.Q4_K_M.gguf
CodeLlama 7B	~4 GB	Coding and dev tasks	codellama-7b-instruct.Q4_K_M.gguf
Phi-2	~2 GB	Teaching & general use	phi-2.Q4_K_M.gguf
MythoMax 13B	~7 GB	Creative writing / story generation	mythomax-l2-13b.Q4_K_M.gguf
⚡ One-Command Model Launchers

Each model has its own launcher script under scripts/ for quick swapping.

bash scripts/tinyllama.sh     # Fast, lightweight assistant  
bash scripts/mistral.sh       # Deeper reasoning  
bash scripts/codellama.sh     # Coding and CLI tasks  
bash scripts/phi2.sh          # Concise, generalist model  
bash scripts/mythomax.sh      # Creative writing and storytelling  


You can even create terminal aliases for faster access:

alias tinychat='bash ~/projects/ai-terminal-agent/scripts/tinyllama.sh'
alias codellama='bash ~/projects/ai-terminal-agent/scripts/codellama.sh'

🧠 Advanced Usage
Mode	Command	Description
Simple chat	bash scripts/chat.sh	Default terminal mode
Switch model	bash scripts/mistral.sh	Run specific model
Code assistant	Edit system prompt in script	Tailor to coding tasks
Batch inference	./llama.cpp/build/bin/llama-cli -m models/model.gguf -p "prompt"	Headless generation
Warp-style inline assist	echo "summarize this code" | bash scripts/chat.sh	Inline terminal helper
🧰 Folder Overview
ai-terminal-agent/
│
├── scripts/           # CLI launchers + config files
├── models/            # Drop your .gguf models here (ignored by Git)
├── llama.cpp/         # Submodule for inference engine
├── .gitignore
├── .gitmodules
└── README.md

🧑‍🤝‍🧑 For New Users (like Darcee)
# Clone Jesse’s repo
git clone --recurse-submodules https://github.com/jesseboudreau80/ai-terminal-agent.git
cd ai-terminal-agent

# Build llama.cpp engine
cd llama.cpp
mkdir -p build && cd build
cmake ..
make -j$(nproc)
cd ../..

# Download at least one model into models/
# Example (TinyLlama)
wget -P models/ https://huggingface.co/TheBloke/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf

# Launch chat
bash scripts/tinyllama.sh


That’s it — she’ll have the same local AI terminal chat running in minutes 🔥

🏁 Credits

LLM Runtime: llama.cpp

Project Owner: Jesse Boudreau

Special Thanks: Darcee for testing the first build 💙

“Run it local. Run it fast. Run it private.” — 🧠 AI Terminal Agent
