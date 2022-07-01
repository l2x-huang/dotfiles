#!/bin/bash

set -e
cd "$(dirname "$0")/../.."
DOTFILES_ROOT=$(pwd -P)
source "$DOTFILES_ROOT/install/log.sh"

if [[ "$OSTYPE" =~ ^darwin ]]; then
  fail 'os is macosx'
fi

user 'install linux package...'
source /etc/os-release
case $ID in
debian|ubuntu|devuan)
  $DOTFILES_ROOT/install/linux/linux_debian.sh
  ;;
arch|manjaro)
  $DOTFILES_ROOT/install/linux/linux_arch.sh
  ;;
*)
  fail "$ID is not supported"
esac
