# enable color support for ls and grep. 
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
fi
alias ll='ls -alF'
alias lr='ls -a -1 -R'

# Folding at home
alias foldstop='sudo /etc/init.d/FAHClient stop'
alias foldstart='sudo /etc/init.d/FAHClient start'

# List aliases and functions contained in matching files.
eh() {
  for FILE in `find $HOME/.bashfiles/2aliases_and_functions/eh -type f | sort -n`
  do
    if [[ "$FILE" == *"$1"* ]]; then 
      # Read the file processing ANSI colors, preserving whitspace with sed
      echo -ne $(cat $FILE | sed  's/$/\\n/' | sed 's/ /\\a /g') 
    fi
  done
}

# Reload bash config
alias refresh='source $HOME/.bashrc'
