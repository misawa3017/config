#!/bin/bash

if [ ! -f /etc/profile.d/kubectl.sh ] ; then
{
curl -k https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases

cat<<-EOF

alias a='alias'
alias k='kubectl '
alias ka='kubectl apply -f '
alias kg='kubectl get '
alias kgn='kubectl get nodes'
alias kgnw='kubectl get nodes -o wide'
alias kgnl='kubectl get nodes --show-labels'
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kgd='kubectl get deployments'
alias kcf='kubectl create -f '
alias kd='kubectl delete '
alias kdf='kubectl delete -f '
alias kaf='kubectl apply -f '
EOF

} > /etc/profile.d/kubectl.sh

fi

cd /usr/local/bin
for i in kubectx kubens utils.bash
do
        [ -f $i ] || ( curl -Ok  https://raw.githubusercontent.com/ahmetb/kubectx/master/$i && chmod +x $i )
done
