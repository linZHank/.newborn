# install node version manager
curl -fsSL https://fnm.vercel.app/install | bash
export PATH=$HOME/.fnm:$PATH
eval "$(fnm env --use-on-cd)"
fnm install --lts

