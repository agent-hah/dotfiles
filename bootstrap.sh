#!/bin/bash

echo "🚀 Bootstrapping DevContainer setup..."

# Define paths
DEVCONTAINER_DIR="$HOME/workspace/.devcontainer"
DOTFILES_REPO="https://github.com/agent-hah/dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"

# Clone dotfiles repo if not already present
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "📂 Cloning dotfiles repository..."
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
  echo "✅ Dotfiles repository already exists."
fi

# Ensure .devcontainer directory exists
mkdir -p "$DEVCONTAINER_DIR"

# Create a default devcontainer.json if not present
if [ ! -f "$DEVCONTAINER_DIR/devcontainer.jsonc" ]; then
  echo "🛠 Creating default devcontainer.jsonc..."
  cat <<EOF > "$DEVCONTAINER_DIR/devcontainer.jsonc"
{
  "name": "Basic template",
  "image": "mcr.microsoft.com/vscode/devcontainers/universal:latest",

  "remoteUser": "codespace",
  "overrideCommand": false ,
  "customizations": {
     "vscode": {
         "extensions": [
            "ms-python.debugpy",
            "ms-dottnettools.vscode-dotnet-runtime",
            "ms-vscode.cpptools-extension-pack",
            "ms-dotnettools.csharp",
            "ms-dotnettools.csdevkit",
            "ms-vscode.cmake-tools",
            "ms-azuretools.vscode-docker",
            "github.vscode-github-actions",
            "visualstudioexptteam.vscodeintellicode",
            "visualstudioexptteam.intellicode-api-usage-examples",
            "visualstudioexptteam.vscodeintellicode-completions",
            "ms-dotnettools.vscodeintellicode-csharp",
            "ms-python.vscode-pylance",
            "ms-vscode.azure-repos",
            "github.copilot.chat",
            "GitHub.copilot",
            "ms-vscode.cpptools-themes",
            "github.remotehub",
            "ms-vscode.remote-repositories",
            "esbenp.prettier-vscode",
            "dbaeumer.vscode-eslint",
            "oderwat.indent-rainbow"
         ]
     },
     "codespaces": {
            "extensions": [
                "ms-python.debugpy",
                "ms-dottnettools.vscode-dotnet-runtime",
                "ms-vscode.cpptools-extension-pack",
                "ms-dotnettools.csharp",
                "ms-dotnettools.csdevkit",
                "ms-vscode.cmake-tools",
                "ms-azuretools.vscode-docker",
                "github.vscode-github-actions",
                "visualstudioexptteam.vscodeintellicode",
                "visualstudioexptteam.intellicode-api-usage-examples",
                "visualstudioexptteam.vscodeintellicode-completions",
                "ms-dotnettools.vscodeintellicode-csharp",
                "ms-python.vscode-pylance",
                "ms-vscode.azure-repos",
                "github.copilot.chat",
                "GitHub.copilot",
                "ms-vscode.cpptools-themes",
                "github.remotehub",
                "ms-vscode.remote-repositories",
                "esbenp.prettier-vscode",
                "dbaeumer.vscode-eslint",
                "oderwat.indent-rainbow"
            ]
     }
 }
}

EOF
  echo "✅ devcontainer.json created!"
fi


RUN apt-get update && apt-get install -y \
  curl git zsh \
  && rm -rf /var/lib/apt/lists/*
EOF
  echo "✅ Dockerfile created!"
fi

echo "🎉 DevContainer setup complete!"