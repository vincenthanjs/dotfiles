#!/bin/bash
alias k=kubectl
source <(kubectl completion bash)
complete -F __start_kubectl k
echo alias k='kubectl' >> ~/.bashrc
echo alias kga='kubectl get all' >> ~/.bashrc
echo alias kaf='kubectl apply -f' >> ~/.bashrc
echo alias kd='kubectl describe' >> ~/.bashrc
source ~/.bashrc
echo 'set nu ts=2 sw=2 expandtab ruler' > ~/.vimrc
echo 'set backspace=indent,eol,start' >> ~/.vimrc
source ~/.vimrc
export do="--dry-run=client -oyaml"
export now="--grace-period=0 --force"
