#!/bin/bash

pushd $(dirname $0)>/dev/null

cat > ~/.config/nvim/.git/hooks/post-merge <<-EOF
  nvim --headless "+Lazy! sync" +qa
EOF

chmod u+x ~/.vim/.git/hooks/post-merge

popd > /dev/null
