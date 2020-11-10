alias ksilver='kubectl config use-context arn:aws:eks:eu-west-1:593357294110:cluster/production-silver && kubectl'
alias kgold='kubectl config use-context arn:aws:eks:eu-west-1:593357294110:cluster/production-gold && kubectl'

alias kstaging='kubectl config use-context arn:aws:eks:eu-west-1:593357294110:cluster/staging && kubectl'
alias kstagings='kubectl config use-context arn:aws:eks:eu-west-1:593357294110:cluster/staging && kubectl --namespace=staging'
alias kstaginga='kubectl config use-context arn:aws:eks:eu-west-1:593357294110:cluster/staging && kubectl --namespace=accounts'

# exec into first pod match $3 in the namespace $2 in the $1 cluster
kexec() {
  if [ "$1" == "staging" ]; then
    kstaging --namespace="$2" exec -it $(find_first_matching_kubectl_pod $2 $3) /bin/bash
  elif [ "$1" == "gold" ]; then
    kgold --namespace="$2" exec -it $(find_first_matching_kubectl_pod $2 $3) /bin/bash
  elif [ "$1" == "silver" ]; then
    ksilver --namespace="$2" exec -it $(find_first_matching_kubectl_pod $2 $3) /bin/bash
  fi
}

# show logs for first pod match $2 in the namespace $1 in the staging cluster
klogs() {
  ks --namespace="$1" logs $(find_first_matching_kubectl_pod $1 $2) -f 
}

# describe the first pod match $2 in the namespace $1 in the staging cluster
kdesc() {
  ks --namespace="$1" describe pod $(find_first_matching_kubectl_pod $1 $2)
}

find_first_matching_kubectl_pod() {
  kubectl --namespace="$1" get pods | grep "$2" -m 1 | awk '{print $1}'
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

