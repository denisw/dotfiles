#!/bin/sh

if [ -d ~/.jenv/shims ]; then
  export PATH="$HOME/.jenv/shims:$PATH"
fi
