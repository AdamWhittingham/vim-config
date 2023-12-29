#!/bin/bash

pushd $(dirname $0) &>/dev/null

if type "brew"; then
  echo "Installing recommended tools"
  brew install ripgrep fd
fi

echo "Updating git hook"
./install-plugin-update-hook.sh

echo "Updating vim plugins"
nvim +"lua require('lazy').sync({wait=true})" +qa

echo "Updating language tools"
nvim --headless "+MasonUpdate" +qa

popd &>/dev/null
