#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

alias yay='paru'

alias xmage='java -jar /home/jade/Documents/xmage/XMageLauncher-0.3.8.jar'
alias tor-browser='gtk-launch /home/jade/Documents/tor-browser/start-tor-browser.desktop'
alias ls='lsd'
