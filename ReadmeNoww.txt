🌊 BlueSea OS

A Custom Terminal Environment Powered by Alpine Linux

BlueSea OS is an experimental, Termux-based terminal environment designed to bring a personalized Linux experience to Android devices using Alpine Linux and PRoot.

Featuring a custom terminal prompt, password-protected startup, and convenient commands, BlueSea aims to provide a simple and customizable command-line experience.

#==Hi User!==#
BlueSea OS | Alpine Linux
Komutları görmek için: help

~Root@BlueSea#

✨ Features

- 🔐 Password-protected startup — Set a password on first launch and enter it on subsequent launches.
- 🐧 Alpine Linux root filesystem — Runs an Alpine Linux environment through PRoot-Distro.
- 🐍 Python installer command — Install Python 3 and pip from Alpine repositories.
- ⚙️ C++ compiler command — Install Clang for C and C++ development.
- 🕒 Clock command — Display the current time.
- 💻 Custom terminal prompt — A personalized "~Root@BlueSea#" interface.
- 🧰 Built-in help menu — View available commands.

📱 Requirements

- Android device
- Termux
- Internet connection for installation and package downloads
- Sufficient storage for the Alpine Linux root filesystem

🚀 Installation

1. Install the required packages

Open Termux and run:

pkg update && pkg upgrade -y
pkg install proot-distro coreutils -y

2. Install Alpine Linux

proot-distro install alpine

If Alpine is already installed, you can skip this step.

3. Launch BlueSea OS

After setting up the BlueSea launcher, run:

~/bluesea

On the first launch, create a password and confirm it. On subsequent launches, enter your password to access the environment.

«Note: Follow the installation instructions in this repository. The launcher script must be installed before the command above will work.»

⌨️ Commands

Command| Description
"help"| Display available commands
"python"| Install Python 3 and pip
"c++"| Install Clang
"saat"| Display the current time
"clear"| Clear the terminal screen
"exit"| Exit the current shell

🏗️ Technology Stack

- Termux — Android terminal environment
- Alpine Linux — Lightweight Linux distribution
- PRoot-Distro — Linux distribution management
- Shell scripting — Launcher and custom commands

🔒 Security Notice

BlueSea OS is an experimental project, not a security-hardened operating system.

- The PRoot environment does not provide real Android root privileges.
- The password mechanism is a basic access gate, not a replacement for Android security.
- Do not use this project to store sensitive information.
- Review scripts before executing them.

🛠️ Project Status

Version: v0.1.0
Status: Experimental / Early Development

Features and commands may change as development continues.

🗺️ Roadmap

- [ ] Improve password storage and authentication
- [ ] Create a cleaner installation script
- [ ] Add a BlueSea startup banner
- [ ] Improve command handling and error messages
- [ ] Add configuration options
- [ ] Document troubleshooting steps

🤝 Contributing

Contributions, bug reports, and suggestions are welcome.

If you find a problem, open a GitHub issue with the command you ran and the error message you received.

📄 License

Choose an open-source license before distributing this project. Add the corresponding "LICENSE" file to the repository.

---

BlueSea OS — Your terminal, your environment. 🌊

Created as an experimental project for Termux and Alpine Linux.
