#!/bin/sh

if [ -d ~/.rbenv/bin ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
elif [ -d ~/.rbenv/shims ]; then
  export PATH="$HOME/.rbenv/shims:$PATH"
fi
