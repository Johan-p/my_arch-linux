#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias backup='/home/johan/Documents/my_arch-linux/post_install/dotfilebackup.sh'

# Launch Neofetch on terminal launch
neofetch
