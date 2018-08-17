#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sudo apt-get update
  sudo apt-get install exuberant-ctags
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew reinstall ctags
  brew reinstall vim
fi
