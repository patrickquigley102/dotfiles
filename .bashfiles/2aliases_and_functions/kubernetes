alias k='kubectl'

alias ky='kubectl config use-context production-yellow && kubectl --namespace=production'
alias kp='kubectl config use-context production-pink && kubectl --namespace=production'
alias ks='kubectl config use-context staging.k8s.local && kubectl --namespace=staging'

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

