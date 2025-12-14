# Windows 11 Setup


# virtualization, wsl, docker and vscode
Student guide | Colégio Atlântico

This document explains, step by step, how to prepare a Windows 11 computer for the IB Diploma introduction to programming lessons, 
installing WSL2 (Debian), Docker and Visual Studio Code.


# Prerequisites
- Windows 11 up to date.
- An account with Administrator permissions (to enable features and install software).
- Internet connection.
- Virtualization (Intel VT-x/AMD-V) supported by the processor and enabled in firmware (UEFI/BIOS).
Important note: enabling virtualization in UEFI/BIOS cannot be done via PowerShell. 
PowerShell can only be used to check the status and enable Windows components (WSL, Virtual Machine Platform, etc.).


# 1) Enable virtualization and Windows 11 components (PowerShell)
Open PowerShell as Administrator: Start menu → type “PowerShell” → right-click → Run as administrator.


## 1.1 Check whether virtualization is enabled (firmware/UEFI)
Run:
```bash
Get-CimInstance -ClassName Win32_Processor |
Select-Object Name, Manufacturer, VirtualizationFirmwareEnabled, SecondLevelAddressTranslationExtensions
```

If the VirtualizationFirmwareEnabled field is False, restart and enable Intel VT-x / AMD-V in UEFI/BIOS.
Shortcut to enter UEFI/BIOS from Windows 11: Settings → System → Recovery → Advanced startup → Restart now → Troubleshoot → Advanced options → UEFI Firmware Settings.


## 1.2 Enable required features (WSL2 / Virtual Machine Platform)
Still in PowerShell (Administrator), run:
```bash
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

Restart the computer when finished (even if the system does not prompt you).


## 1.3 (Optional) Enable Hyper-V
Only for Windows 11 Pro/Enterprise/Education editions. In general, for WSL2 and Docker with the WSL2 backend, enabling Hyper-V is not mandatory, but it can be useful in some scenarios.
If required, run:
```bash
dism.exe /online /enable-feature /featurename:Microsoft-Hyper-V-All /all /norestart
```


# 2) Install and configure WSL2 + Debian


## 2.1 Install/update WSL and set WSL 2 as default
In PowerShell (Administrator), run:
```bash
wsl --status
wsl --update
wsl --set-default-version 2
```


## 2.2 Install the Debian distribution
Still in PowerShell (Administrator), run:
```bash
wsl --list --online
wsl --install -d Debian
```


When the installation finishes, open “Debian” from the Start menu (or run `wsl -d Debian`) and create the Linux user (username and password).


## 2.3 Recommended first-time setup in Debian
Run WSL, typing `wsl` and inside the Debian terminal, run:
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y git build-essential python3 python3-pip
```

Tip: store projects in a Linux path (for example, /home/<username>/projects/) for better performance with Docker and Linux tools.


# 3) Install Git for Windows
Git is essential for version control and is used throughout the course. While Git is installed in WSL/Debian (step 2.3), 
installing it on Windows provides better integration with Windows tools and VSCode.


## 3.1 Install Git for Windows (via WinGet)
In PowerShell (no admin needed), run:
```
winget install --id=Git.Git -e
```

Alternatively, download from the official site: https://git-scm.com/download/win


## 3.2 Configure Git (first-time setup)
After installation, configure your identity (required for commits). In PowerShell or Git Bash, run:
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

Optional but recommended settings:
```
git config --global init.defaultBranch main
git config --global core.autocrlf true
```

## 3.3 Verify Git installation
In PowerShell, run:
```
git --version
```

Note: Git is now available in both Windows (PowerShell/CMD) and WSL (Debian). When working in WSL, use the Linux Git; when working in Windows, use Git for Windows.


# 4) Install Docker (Docker Desktop) on Windows 11
Recommended for this course: Docker Desktop with the WSL 2 backend.

Download from the official site: [https://www.docker.com/](https://www.docker.com/products/docker-desktop/)

Follow the official guide "Install Docker Desktop on Windows" [(follow the requirements and the recommended installer)](https://docs.docker.com/desktop/install/windows-install/).

After installing, open Docker Desktop and confirm the following options:
- Settings → General → "Use the WSL 2 based engine" (enabled).
- Settings → Resources → WSL Integration → enable integration for "Debian" (or the distro you are using).

## 4.1 Quick Docker test
In PowerShell or in the Debian terminal, run:

```bash
docker --version
docker run --rm hello-world
```

Licensing: Docker Desktop is usually free for students and teachers in an educational context (Docker Personal), but terms may vary; check the official terms.
Security: keep Docker Desktop up to date (includes security fixes).


# 5) Install Visual Studio Code + extensions
## 5.1 Install Visual Studio Code (via WinGet)
In PowerShell (no admin needed if installing per user), run:
```
winget install --id=Microsoft.VisualStudioCode -e
```

Alternatively, download from the official site: [https://code.visualstudio.com/](https://code.visualstudio.com/Download)

If the winget command does not exist, update "App Installer" via the Microsoft Store/Windows Update.

## 5.2 Install essential extensions (command line)
After opening VS Code at least once, you can install extensions via the terminal (PowerShell):
```bash
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools
code --install-extension github.remotehub
```

Extensions included in this guide:
- Dev Containers (ms-vscode-remote.remote-containers)
- Python (ms-python.python)
- C/C++ (ms-vscode.cpptools)
- GitLens (eamodio.gitlens) — Git integration with advanced features like blame, history, and more
- GitHub Repositories (github.remotehub) — Work with GitHub repositories without cloning them to your local machine

## 5.3 (Optional) Additional recommended extensions
WSL extension to open Linux folders in VS Code:
If you will work directly in WSL (without containers), also install:

```bash
code --install-extension ms-vscode-remote.remote-wsl
```

# Final checks (checklist)
- PowerShell: wsl --status shows WSL installed and version 2 available.
- WSL: Debian opens and can run sudo apt update without errors.
- Git: git --version works in both PowerShell and WSL.
- Git config: git config --global user.name and git config --global user.email show your configured identity.
- Docker: docker run --rm hello-world works.
- VS Code: opens normally and the extensions appear installed.

# Common troubleshooting

## WSL fails due to missing virtualization
Symptoms: errors indicating that WSL 2 requires virtualization/hypervisor.
Solution: confirm in step 1.1 that VirtualizationFirmwareEnabled is True and enable VT-x/AMD-V in UEFI/BIOS.

## Docker cannot find WSL / integration disabled
Solution: in Docker Desktop, enable “Use the WSL 2 based engine” and, under “WSL Integration”, enable the Debian distro.

## "code" command is not recognized in PowerShell
Solution: in VS Code, open the Command Palette (Ctrl+Shift+P) and run "Shell Command: Install 'code' command in PATH" (may require restarting the terminal).

## Git is not found after installation
Solution: restart PowerShell or your terminal. Git for Windows adds itself to PATH, but existing terminal sessions need to be restarted to pick up the change.

# Sources (official documentation)

| Microsoft Learn — WSL (overview) | Microsoft Learn — Manual install / enabling features (WSL) |
| --- | --- |
| Git for Windows — Official download | Git Documentation — First-Time Git Setup |
| Microsoft Learn — Docker in WSL (tutorial) | Docker Docs — Install Docker Desktop on Windows |
| Docker Docs — Docker Desktop WSL 2 backend | Docker — Docker Personal (licensing) |
| Docker Docs — Desktop license | VS Marketplace — Dev Containers |
| VS Marketplace — Python | VS Marketplace — C/C++ |
| VS Marketplace — GitLens | VS Marketplace — GitHub Pull Requests |
| WinGet — Microsoft.VisualStudioCode |  |
