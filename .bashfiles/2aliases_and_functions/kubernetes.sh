alias ksp='kubectl config use-context arn:aws:eks:eu-west-1:593357294110:cluster/production-silver && kubectl --namespace=production'
alias kgp='kubectl config use-context arn:aws:eks:eu-west-1:593357294110:cluster/production-gold && kubectl --namespace=production'
alias kss='kubectl config use-context arn:aws:eks:eu-west-1:593357294110:cluster/staging && kubectl --namespace=staging'
alias ksa='kubectl config use-context arn:aws:eks:eu-west-1:593357294110:cluster/staging && kubectl --namespace=accounts'

# exec into first pod matching $3 in context $1 and namespace $2
kexec() {
  if [ "$1" == "gold" ]
  then
    kgp exec -it $(kubectl --namespace="$2" get pods | grep "$3" -m 1 | awk '{print $1}') /bin/bash
    return
  fi
  if [ "$1" == "silver" ]
  then
    ksp exec -it $(kubectl --namespace="$2" get pods | grep "$3" -m 1 | awk '{print $1}') /bin/bash
    return
  fi
  if [ "$1" == "staging" ]
  then
    if [ "$2" == "staging" ]
    then
      kss exec -it $(kubectl --namespace="$2" get pods | grep "$3" -m 1 | awk '{print $1}') /bin/bash
      return
    else
      echo "$2 not a supported namespace yet"
    fi
  fi
  echo -e ${RED}"No context alias found for $1"${NOCOLOR}
}

# Clear TBG production memcached
# Taken from: https://studentbeans.slab.com/posts/flushing-memcached-to-clear-cache-0mvb3omm
# Assumes 3 pods named memcached-0 - memcached-2
clear_memcached() {
  for i in {0..2}; do 
    kubectl -nmemcached port-forward memcached-$i "1121$i:11211" &
  done
  sleep 10 # to let it set up connections
  for i in {0..2}; do 
    echo 'flush_all' | nc localhost 1121$i -N
  done
  kill $(jobs -p)
}

