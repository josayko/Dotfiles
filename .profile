# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
# if [ -d "$HOME/.local/bin" ] ; then
#     PATH="$HOME/.local/bin:$PATH"
# fi

export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:/usr/local/go/bin:$HOME/go/bin:$HOME/.local/share/bin:$PATH"

export AUDIODRIVER=alsa
export GPG_TTY=$(tty)

# MAIL / USER
export MAIL=josaykos@student.42.fr
export GOBIN=$HOME/go/bin/

eval "$(rbenv init -)"
source "$HOME/.cargo/env"

#Aliases
alias norm2="~/.norminette/norminette.rb"
alias open=xdg-open

# Add colors to man
export LESS_TERMCAP_mb=$'\e[1;32m' export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m' export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m' export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
