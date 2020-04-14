# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Bash history
HISTSIZE=10000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Colors in terminal
force_color_prompt=yes
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac

# Colored terminal
# This I copied, it enables colors in multiple envs.
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  color_prompt=yes
  else
  color_prompt=
  fi
fi
if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable programmable completion features 
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Load env vars, config, aliases and functions. In that order. 
# Loads all files in alphanumeric order
for BASHFILE in `find /home/pq/.bashfiles -type f | sort -n`
do
  source $BASHFILE
done

# Check for existance of secrets file.
# If missing add the file and notify
secrets=$HOME/.bashfiles/0env/secrets.sh
if test -f "$secrets"; then
  source $secrets
else
  echo -e ${RED}"Secrets file missing at $secrets."${NOCOLOR}
  echo -e ${RED}"Create it and store secret bash variables in it, if you like."${NOCOLOR}
  echo -e ${RED}"For your dark biddings."${NOCOLOR}
fi
  
