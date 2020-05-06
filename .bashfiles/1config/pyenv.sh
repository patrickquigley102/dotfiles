# Install pyenv if missing
if [ ! -d "$HOME/.pyenv" ]; then
  echo "pyenv missing, installing."
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  sudo apt-get update; sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
fi
eval "$(pyenv init -)"
