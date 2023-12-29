#!/bin/bash

pushd $(dirname $0)>/dev/null

hook=.git/hooks/post-merge
cat > $hook <<EOF
nvim --headless "+Lazy! sync" +qa
EOF

chmod u+x $hook

popd > /dev/null
