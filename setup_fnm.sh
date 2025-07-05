#!/usr/bin/sh

echo "Start setting up Fast Node version manager."

curl -fsSL https://fnm.vercel.app/install | bash
export PATH=$HOME/.local/share/fnm:$PATH
echo 'eval "$(fnm env --use-on-cd --shell bash)"' >>$HOME/.bashrc
fnm install --lts

echo "FNM installed."
