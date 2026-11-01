#!/bin/bash

pushd $(dirname $0)>/dev/null

hook=.git/hooks/post-merge
cat > $hook <<'EOF'
#!/bin/bash
cd "$(git rev-parse --show-toplevel)"
if type brew &>/dev/null && ! brew bundle check --file=Brewfile &>/dev/null; then
  brew bundle install --file=Brewfile
fi
nvim --headless "+Lazy! sync" +qa
EOF

chmod u+x $hook

popd > /dev/null
