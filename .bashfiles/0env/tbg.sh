export TBG_GEMS_HOST=https://gem.thebeansgroup.com
export TBG_GEMS_USER=vincent
export SB_GIT_REMOTE_ROOT=git@git.thebeansgroup.com
export DB_PASSWORD=password
export SB_SRC_ROOT=$HOME/src/

if ! echo $PATH | grep '\.sb' > /dev/null ; then
  export PATH=$PATH:$HOME/.sb/dev-cli/bin
fi
