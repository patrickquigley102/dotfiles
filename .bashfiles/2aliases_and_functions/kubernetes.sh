alias k='kubectl'

alias ky='kubectl config use-context arn:aws:eks:eu-west-1:593357294110:cluster/production-yellow && kubectl --namespace=production'
alias kp='kubectl config use-context
arn:aws:eks:eu-west-1:593357294110:cluster/production-pink && kubectl
--namespace=production'
alias ks='kubectl config use-context arn:aws:eks:eu-west-1:593357294110:cluster/staging && kubectl --namespace=staging'

# exec into first pod matching $2 in context/namespace $1
kexec() {
  if [ "$1" == "y" ]
  then
    ky exec -it $(kubectl --namespace=production get pods | grep "$2" -m 1 | awk '{print $1}') /bin/bash
    return
  fi
  if [ "$1" == "p" ]
  then
    kp exec -it $(kubectl --namespace=production get pods | grep "$2" -m 1 | awk '{print $1}') /bin/bash
    return
  fi
  if [ "$1" == "s" ]
  then
    ks exec -it $(kubectl --namespace=staging get pods | grep "$2" -m 1 | awk '{print $1}') /bin/bash
    return
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

