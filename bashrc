# .bashrc

# If running interactively, turn off XON/XOFF flow control
case $- in
    *i*) stty -ixon;;
esac

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# History options

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoreboth

# Allow history from multiple terminals
# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=100000
export HISTFILESIZE=200000

# include time of commands in history
export HISTTIMEFORMAT="%d/%m/%y %T "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# If this is an xterm set the title to user@host:dir
PS1=""
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# other ls related aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# Add color to the prompt
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
# We have color support; assume it's compliant with Ecma-48
# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
# a case would tend to support setf rather than setaf.)
    color_prompt=yes
else
    color_prompt=
fi

#  Color dependent on the success of the last command in some terminals
function exstat {
    EXSTAT="$?"
    RED="\[\033[1;31m\]"
    GREEN="\[\e[32;1m\]"
    CYAN="\[\e[36;1m\]"
    OFF="\[\033[m\]"
	PRMPT="${USER}@${HOSTNAME} ${PWD}"

    if [ "${EXSTAT}" -eq 0 ]
    then
         PS1="${GREEN}${PRMPT}>${OFF} "
    else
         PS1="${RED}${PRMPT}>${OFF} "
    fi
}
case "$TERM" in
    xterm-color) color_prompt=yes;;
    xterm-256color) color_prompt=yes;;
    xterm) color_prompt=no;
        export PROMPT_COMMAND=exstat;;
esac

if [ "$color_prompt" = yes ]; then
    PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$$PS1"
else
    PS1="\u@\h:\w\$$PS1"
fi

unset color_prompt


if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi
