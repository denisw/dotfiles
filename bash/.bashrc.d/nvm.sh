#!/bin/sh

NVM_DIR="$HOME/.nvm"

if [ -s "$NVM_DIR/nvm.sh" ]; then
  export NVM_DIR
  source "$NVM_DIR/nvm.sh"
fi
