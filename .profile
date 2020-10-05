# Caps Lock becomes another ctrl
setxkbmap -option ctrl:nocaps

# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/brave

export EDITOR=vim
export MAIL=josaykos@student.42.fr

# Hidpi Fixes
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export LD_PRELOAD=/usr/lib/libwcwidth-icons.so

# General PATH
export PATH=$HOME/.local/share/bin:$HOME/Applications:$HOME/.config/coc/extensions/coc-clangd-data/install/10.0.0/clangd_10.0.0/bin:/usr/local/go/bin:$HOME/go/bin:/home/jonny/.gem/ruby/2.7.0/bin:$PATH

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Go
export GOBIN=~/go/bin/

# Kubectl config
export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config.minikube:$HOME/.kube/config

# Add colors to man
export LESS_TERMCAP_mb=$'\e[1;32m' export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m' export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m' export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# Japanese input
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx

# Norminette
alias norminette="~/.norminette/norminette.rb"

alias kg="kubectl get"

unsetopt AUTO_CD
ufetch-arco
