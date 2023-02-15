#!/bin/bash

sudo apt install  -y \
  ccache                \
  cmake                 \
  gdb                   \
  git                   \
  gzip                  \
  python3               \
  python3-pip           \
  stow                  \
  tree                  \
  thefuck               \
  tree                  \
  wget                  \
  tmux                  \
  autojump              \
  lolcat                \
  netcat                \
  tmux                  \
  ninja-build           \
  pkg-config libcurl4-openssl-dev libssl-dev \
  build-essential

set -x

ln_helper() {
  if [ ! -f $2 ]; then
    sudo ln -s $1 $2
  fi
}

# clang & libc++ & clangd
if ! command -v clang > /dev/null; then
  wget -c https://apt.llvm.org/llvm.sh
  LLVM_VERSION=$(sed -n '/^CURRENT_LLVM_STABLE/'p ${PWD}/llvm.sh  | awk -F= '{print $2}')
  chmod +x "${PWD}/llvm.sh"
  sudo -E "${PWD}/llvm.sh"
  rm -f "${PWD}/llvm.sh"
  sudo -E apt install -y clangd-${LLVM_VERSION} libc++-${LLVM_VERSION}-dev libc++abi-${LLVM_VERSION}-dev
  sudo -E apt install -y clang-tidy-${LLVM_VERSION} lldb-${LLVM_VERSION}
  sudo -E apt install -y clang-format-${LLVM_VERSION}
  ln_helper /usr/bin/clang-${LLVM_VERSION} /usr/bin/clang
  ln_helper /usr/bin/clangd-${LLVM_VERSION} /usr/bin/clangd
  ln_helper /usr/bin/clang++-${LLVM_VERSION} /usr/bin/clang++
  ln_helper /usr/bin/clang-tidy-${LLVM_VERSION} /usr/bin/clang-tidy
  ln_helper /usr/bin/clang-format-${LLVM_VERSION} /usr/bin/clang-format
  ln_helper /usr/bin/lldb-${LLVM_VERSION} /usr/bin/lldb
fi

if ! command -v lazygit > /dev/null; then
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  wget -qO- https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz | sudo -E tar -xvz -C /usr/local/bin/
fi
