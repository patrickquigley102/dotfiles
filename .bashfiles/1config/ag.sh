# Install silversearcher-ag if missing
if ! dpkg -l | grep 'silversearcher-ag' > /dev/null ; then
  echo "Silver Searcher AG missing, installing"
  sudo apt-get install silversearcher-ag
fi
