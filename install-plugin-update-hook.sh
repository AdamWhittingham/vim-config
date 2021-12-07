#!/bin/bash

pushd $(dirname $0)>/dev/null

cat > ~/.vim/.git/hooks/post-merge <<-EOF
  nvim +PlugClean +PlugUpdate
EOF

chmod u+x ~/.vim/.git/hooks/post-merge

popd > /dev/null
