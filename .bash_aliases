# .bash_aliases
LANG=C
LC_ALL=C
# Lang
if locale -a | grep -qE "^C.UTF-8$" ; then       #Debian
   LC_ALL="C.UTF-8"
elif locale -a | grep -qE "^en_US.utf8$" ; then  #RedHat
   LC_ALL="en_US.utf8"
fi
export LANG LC_ALL

## My shortcuts
# from AIX
alias r="fc -e -"
alias tn="telnet "  
export LS_OPTIONS="--classify --escape"
export LS_COLORS="rs=0:di=1"

alias l="ls"
alias lr="ls -lrt"
alias ll="ls -lF"
alias la="ls -laF"

alias colortable='tput sgr0; echo; for i in {0..255}; do printf "$(tput sgr0)\033[38;5;%im %4s \033[48;5;%im      " $i $i $i; [[ $i -eq 7 || $i -eq 15 || ($i -gt 16 && $(( (i-3) %6 )) -eq 0) ]] && printf "\033[0m\n" ; [[ $i -eq 15 ]] && printf "\n" ; done'

# for RCS
alias ci="ci -l"
alias co="co -l"

# as I use PuTTY if not on console :
#if [[ "$TERM" =~ "xterm" ]] ; then
#   TERM=putty-256color
#fi
#export TERM

# Go
export PATH=$PATH:/usr/lib/go-1.8/bin
export GOROOT=$HOME/go1.8

# PROMPT
function setPromptColor() {
   local color="${1:-blue}"
   TTY=$(basename `tty`)
   #local gu="│" gh=" " gd="╱" # Unicode Font (consolas)
   #local gu="" gh="" gd="" # PowerLine Compatible font needed :     
   local gu="|" gh=" " gd="\>" # ANSI Font
   local gu="@" gh=":" gd="/" # ANSI Font
   if [[ "$TERM" =~ "256color" ]] ; then
      local afu abu afh=7 abh=237 afp=7 abp=235
   else
      local afu abu afh=0 abh=237 afp=7 abp=235
   fi
   case $color in
         "red") [[ "$TERM" =~ "256color" ]] && abu=124 || abu=1 ; afu=7 ;;
       "green") [[ "$TERM" =~ "256color" ]] && abu=77  || abu=2 ; afu=0 ;;
      "yellow") [[ "$TERM" =~ "256color" ]] && abu=220 || abu=3 ; afu=0 ;;
        "blue") [[ "$TERM" =~ "256color" ]] && abu=26  || abu=4 ; afu=7 ;;
      "purple") [[ "$TERM" =~ "256color" ]] && abu=134 || abu=5 ; afu=7 ;;
 "teal"|"cyan") [[ "$TERM" =~ "256color" ]] && abu=116 || abu=6 ; afu=0 ;;
      "orange") [[ "$TERM" =~ "256color" ]] && abu=208 || abu=9 ; afu=0 ;;
      "debian") [[ "$TERM" =~ "256color" ]] && abu=197 || abu=1 ; afu=7 ;;
       "white") [[ "$TERM" =~ "256color" ]] && abu=250 || abu=7 ; afu=0 ;;
             *) [[ "$TERM" =~ "256color" ]] && abu=$color || abu=$color ; afu=0 ;;
   esac
   PS1="\[$(tput sgr0)\]\n"   # disable all attributes
   PS1+="\[$(tput setaf $afu ; tput setab $abu)\] \u$gu\[$(tput setaf $abu ; tput setab $abh)\]"
   PS1+="\[$(tput setaf $afh ; tput setab $abh)\]\h$gh\[$(tput setaf $abh ; tput setab $abp)\]"
   PS1+="\[$(tput setaf $afp ; tput setab $abp)\]\w \[$(tput setab 0 ; tput setaf $abp)\]"
   #PS1+="\[$(tput setaf $afp ; tput setab $abp)\]\$(pwd | sed -e 's#/# '"${gd}"' #g') \[$(tput setab 0 ; tput setaf $abp)\]$gh"
   PS1+="\[$(tput sgr0)\]\n\\$ \[$(tput bold)\]"
   trap 'tput sgr0' DEBUG  # reset terminal apres chaque commande
   export PS1
}
_setPromptColor () {
   local cur=${COMP_WORDS[COMP_CWORD]}
   COMPREPLY=( $( compgen -W "blue cyan debian green orange purple red teal white yellow " -- $cur ) )
   return 0
}
complete -F _setPromptColor setPromptColor

if [[ -n "$TERM" ]] ; then
   setPromptColor
fi

#JeromeDemeyer2017
