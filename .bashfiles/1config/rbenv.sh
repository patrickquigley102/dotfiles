# Install rbenv and ruby build if missing
if [ ! -d "$HOME/.rbenv" ]; then
  echo "rbenv missing, installing."
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  mkdir -p "$(rbenv root)"/plugins
  git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
  sudo apt install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev
fi

eval "$(rbenv init -)" > /dev/null

# Update the list of available Ruby versions
pushd ~/.rbenv/plugins/ruby-build > /dev/null
git pull > /dev/null
popd > /dev/null

