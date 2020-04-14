alias d='docker'
alias dc='docker-compose'
alias dclean='docker rmi $(docker images -a --filter=dangling=true -q) && docker rm $(docker ps -- filter=status=exited --filter=status=created -q)'

# Reset any container matching the term
dreset () {
  docker restart $(docker ps | grep "$1" -m   1 | awk '{print $1}')
}

# Exec into the first container matching the pattern provided in any
# docker-compose file in ~/src.
# e.g. dcexec accounts.student
# Or supply no argument and bash into the first container matched in .
dcexec() {
  if [ $# -eq 0 ]; then
    # Find first line idented by 2 spaces, assign as variable.
    container_name=$(grep -m 1 "  " docker-compose.yml | head -1)
    # Strip out the colon (it's YAML!)
    container_name=$(echo "${container_name//:}")
    echo -e ${GREEN}"Starting container: $container_name in ."${NOCOLOR}
    docker-compose exec $container_name bash        
  else 
    # Find all path/to/docker-compose.yaml within $HOME/src excluding
    # node_modules folders.
    for FILE in `find $HOME/src/ -name docker-compose.yml ! -path "*/node_modules/*" 2>/dev/null`; do
      # Find first line idented by only 2 spaces, that contains anything
      # then the arg, then assign as variable. 
      container_name=$(grep -m 1 "^  [^ ]*$1" $FILE | head -1)
      # Next file if no container found.
      if ! [ -z "$container_name" ]; then
        # Strip out the colon (it's YAML!)
        container_name=$(echo "${container_name//:}")
        dir=$(dirname "${FILE}")
        echo -e ${GREEN}"Starting container: $container_name in $dir"${NOCOLOR}
        # navigate to the dir containing the docker-compose.yaml
        cd $dir
        sb start .
        docker-compose exec $container_name bash
        break
      fi
    done
    # Tell user if not found.
    if [ -z "$container_name" ]; then
      echo -e ${RED}"No container defined in a docker-compose.yml found matching $1"${NOCOLOR}
    fi
  fi 
}

