#!/bin/bash
alias k=kubectl
source <(kubectl completion bash)
complete -F __start_kubectl k
echo "alias k='kubectl'" >> ~/.bashrc
echo "alias ke='kubectl exec -it'" >> ~/.bashrc
echo "alias kg='kubectl get'" >> ~/.bashrc
echo "alias kga='kubectl get all'" >> ~/.bashrc
echo "alias kaf='kubectl apply -f'" >> ~/.bashrc
echo "alias kdf='kubectl delete -f'" >> ~/.bashrc
echo "alias kd='kubectl delete'" >> ~/.bashrc
echo "alias kdc='kubectl describe'" >> ~/.bashrc
echo "export do='--dry-run=client -oyaml'" >> ~/.bashrc
echo "export now='--grace-period=0 --force'" >> ~/.bashrc
source ~/.bashrc
echo 'set nu ts=2 sw=2 expandtab ruler' > ~/.vimrc
echo 'set backspace=indent,eol,start' >> ~/.vimrc
source ~/.vimrc

