# 🧠 AI Terminal Agent
### Local LLM Chat — Fast, Private, and 100% Offline

Welcome to the **AI Terminal Agent**, a lightweight local-AI environment powered by [llama.cpp](https://github.com/ggerganov/llama.cpp).  
Run open-source LLMs right in your terminal — **no APIs, no tokens, no cloud costs.**

---

## 🚀 Quick Start

```bash
# Clone with submodules (important!)
git clone --recurse-submodules https://github.com/jesseboudreau80/ai-terminal-agent.git
cd ai-terminal-agent

# (Optional) Pull latest llama.cpp updates
git submodule update --init --recursive

# Run your first chat (TinyLlama default)
bash scripts/chat-switcher.sh tinyllama
You’ll see:

markdown
Copy code
🐾 Starting your AI Terminal Agent...
--------------------------------------
Type your prompt and press Enter. Type 'exit' to quit.
Example prompts:

pgsql
Copy code
User> summarize the benefits of running an AI model locally
User> write a bash script that monitors CPU usage
User> explain how to set up FastAPI + React
User> act as a dog daycare training simulator (game logic)
🏆 VIP Setup (One Command Install)
Want the full experience — build, model download, and chat — in one go?

bash
Copy code
git clone --recurse-submodules https://github.com/jesseboudreau80/ai-terminal-agent.git
cd ai-terminal-agent
bash scripts/setup-vip.sh
This will:

🧰 Build llama.cpp

📦 Install dependencies

💾 Download TinyLlama automatically

💬 Launch your first local AI chat

After setup, you can switch models instantly:

bash
Copy code
bash scripts/chat-switcher.sh mistral
bash scripts/chat-switcher.sh codellama
bash scripts/chat-switcher.sh phi2
bash scripts/chat-switcher.sh mythomax
🧩 Switching Models
Drop additional .gguf models into the models/ folder — for example:

Model	Size	Ideal For	Example Filename
TinyLlama 1.1B	~0.6 GB	Fast & lightweight	tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf
Mistral 7B	~4 GB	Reasoning / writing	mistral-7b-instruct.Q4_K_M.gguf
CodeLlama 7B	~4 GB	Coding assistant	codellama-7b-instruct.Q4_K_M.gguf
Phi-2	~2 GB	Balanced general use	phi-2.Q4_K_M.gguf
Mythomax	~13 GB	Creative reasoning	mythomax-l2-13b.Q4_K_M.gguf

Switch easily with:

bash
Copy code
bash scripts/chat-switcher.sh mistral
⚙️ Customizing Parameters
Inside scripts/chat-switcher.sh, you can tweak your session behavior:

bash
Copy code
PARAMS="--n 200 -c 2048 -t $(nproc) --temp 0.7 --top-p 0.9 --no-warmup --simple-io --no-cnv"
Parameter	Description
--temp	Creativity (0.3 = focused, 1.0 = creative)
-n	Tokens to generate (response length)
--top-p, --top-k	Randomness balance
--simple-io	Basic text output (ideal for CLI or piping)

🧠 Advanced Usage
Mode	Command	Description
Basic chat	bash scripts/chat-switcher.sh tinyllama	Default conversational mode
Coding mode	bash scripts/chat-switcher.sh codellama	Developer assistant
Offline inference	./llama.cpp/build/bin/llama-cli -m models/model.gguf -p "prompt"	Run without wrapper
Pipe from CLI	echo "summarize this code" | bash scripts/chat-switcher.sh tinyllama	Inline Warp-style output

🗂 Folder Overview
bash
Copy code
ai-terminal-agent/
│
├── scripts/             # Launchers, installers, and model fetchers
│   ├── chat-switcher.sh
│   ├── setup-vip.sh
│   ├── fetch-models.sh
│   ├── install.sh
│   ├── tinyllama.sh
│   ├── mistral.sh
│   ├── codellama.sh
│   ├── phi2.sh
│   └── mythomax.sh
│
├── models/              # Drop your .gguf models here (ignored by Git)
├── llama.cpp/           # Submodule for inference engine
├── .gitignore
├── .gitmodules
└── README.md
💙 Credits
Project Owner: Jesse Boudreau
LLM Runtime: llama.cpp
Special Thanks: The PAWSitiveOps team & early testers 🐕

“Run it local. Run it fast. Run it private.” — 🧠 AI Terminal Agent

yaml
Copy code

---

Would you like me to make one more variant — a **“minimal README-lite.md”** (for Codespaces quick-deploy version, stripped down to 1-minute instructions)?




