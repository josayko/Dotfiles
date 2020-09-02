export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/vim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/firefox

export PATH=$HOME/.scripts/:$HOME/Applications:/usr/local/go/bin:$HOME/go/bin:$PATH

# UI element scaling, icons
# export GDK_SCALE=2
# export QT_SCALE_FACTOR=2
export QT_AUTO_SCREEN_SCALE_FACTOR=1

export TERMINAL=alacritty

export GOBIN=~/go/bin/
export MAIL=josaykos@student.42.fr
export AUDIODRIVER=alsa

# aliases
alias vim=nvim
alias rm="rm -I"
alias v=vim
alias t=tmux
alias gcc=clang
alias newsboat="uxterm newsboat"
alias norminette="~/.norminette/norminette.rb"

#changing "ls" to "exa"
alias ls='exa -lg --color=always --group-directories-first'
alias ll='exa -alg --color=always --group-directories-first'
alias lt='tree'
alias lta='exa -aT --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'

# caps lock becomes another ctrl
setxkbmap -option ctrl:nocaps

# Japanese input
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
