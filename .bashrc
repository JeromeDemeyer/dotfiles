# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#du GROS historique !
HISTFILE=~/.bash_historique
HISTTIMEFORMAT=" %Y/%m/%d %H:%M:%S # "
HISTCONTROL=ignoreboth
HISTIGNORE=' *:&:?:??'
unset HISTFILESIZE
HISTSIZE=20000
shopt -s histappend
shopt -s cmdhist


# User specific aliases and functions
#JDEMEYER_BEGIN
export LANG=C
export LC_ALL=C
unset LS_COLORS
alias ls="/bin/ls --color"
alias ll="ls -laF"
alias lr="ls -lartF"
alias l="ls -AF"
alias r="fc -e -"
alias co="co -l"
alias ci="ci -l"
unalias vi 2>/dev/null
unalias rm 2>/dev/null
unalias mv 2>/dev/null
unalias cp 2>/dev/null
export PS1="[\u@\h] \w $ "
#JDEMEYER_END

#EOF
