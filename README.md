# 🧠 AI Terminal Agent
### Local LLM Chat — Fast, Private, and 100% Offline

Welcome to the **AI Terminal Agent**, a lightweight local-AI environment powered by [llama.cpp](https://github.com/ggerganov/llama.cpp).  
It runs directly from your terminal — no APIs, no tokens, no cloud costs.

---

## 🚀 Quick Start

```bash
# Clone with submodules (important!)
git clone --recurse-submodules https://github.com/jesseboudreau80/ai-terminal-agent.git
cd ai-terminal-agent

# (Optional) Pull latest llama.cpp updates
git submodule update --init --recursive

# Run your local chat
bash scripts/chat.sh
You’ll see:

markdown
Copy code
🐾 Starting your AI Terminal Agent...
--------------------------------------
Type your prompt and press Enter. Type 'exit' to quit.
💬 Example Prompts
pgsql
Copy code
User> summarize the benefits of running an AI model locally
User> write a bash script that monitors CPU usage
User> explain how to set up FastAPI + React
User> act as a dog daycare training simulator (game logic)
🧩 Switching Models
Place additional .gguf models into the models/ folder — for example:

Model	Size	Ideal For	Example
TinyLlama 1.1B	~0.6 GB	Quick answers, lightweight systems	tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf
Mistral 7B	~4 GB	Deeper reasoning	mistral-7b-instruct.Q4_K_M.gguf
CodeLlama 7B	~4 GB	Coding help	codellama-7b-instruct.Q4_K_M.gguf
Phi-2	~2 GB	General purpose & teaching	phi-2.Q4_K_M.gguf

Edit scripts/chat.sh and update:

bash
Copy code
MODEL="models/<your_model>.gguf"
Then rerun:

bash
Copy code
bash scripts/chat.sh
💻 Customize Your Session
The scripts/chat.sh uses:

bash
Copy code
PARAMS="--n 200 -c 2048 -t $(nproc) --temp 0.7 --top-p 0.9 --no-warmup --simple-io --no-cnv"
You can tweak:

--temp → creativity (0.3 = focused, 1.0 = wild)

-n → number of tokens (response length)

--top-p / --top-k → randomness balance

⚙️ Building llama.cpp manually
If llama.cpp doesn’t build automatically:

bash
Copy code
cd llama.cpp
mkdir -p build && cd build
cmake ..
make -j$(nproc)
cd ../..
🧠 Advanced Usage
Mode	Command	Description
Simple CLI chat	bash scripts/chat.sh	Default mode
Coding assistant	Edit system prompt to "You are a coding assistant"	
Offline batch inference	./llama.cpp/build/bin/llama-cli -m models/model.gguf -p "prompt"	
Warp-style inline assist	Pipe from terminal: echo "summarize this code" | bash scripts/chat.sh	

🧰 Folder Overview
bash
Copy code
ai-terminal-agent/
│
├── scripts/           # CLI launcher + config
├── models/            # Drop your .gguf models here (ignored by Git)
├── llama.cpp/         # Submodule for inference engine
├── .gitignore
├── .gitmodules
└── README.md
