#!/bin/bash

sudo -E apt install  -y \
  ccache                \
  cmake                 \
  gdb                   \
  git                   \
  gzip                  \
  npm                   \
  ripgrep               \
  python3               \
  python3-pip           \
  stow                  \
  tree                  \
  thefuck               \
  tree                  \
  wget                  \
  tmux                  \
  fzf                   \
  fd-find               \
  autojump              \
  lolcat                \
  netcat                \
  tmux                  \
  ninja-build           \
  pkg-config libcurl4-openssl-dev libssl-dev \
  build-essential


# clang & libc++ & clangd
if ! command -v clang; then
  bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
  sudo -E apt install -y clangd libc++-14-dev libc++abi-14-dev
fi

if ! command -v deno; then
  curl -fsSL https://deno.land/install.sh | sh
fi

if ! command -v lazygit; then
  wget -qO- https://github.com/jesseduffield/lazygit/releases/download/v0.34/lazygit_0.34_Linux_x86_64.tar.gz | sudo -E tar -xvz -C /usr/local/bin/
fi

if ! command -v lazydocker; then
  wget -qO- https://github.com/jesseduffield/lazydocker/releases/download/v0.18.1/lazydocker_0.18.1_Linux_x86_64.tar.gz | sudo -E tar -xvz -C /usr/local/bin/
fi
