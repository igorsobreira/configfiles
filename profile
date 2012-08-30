# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

export EDITOR=vim
export CLICOLOR="auto"

export PATH=$HOME/bin:/usr/local/sbin/:/usr/local/bin:$PATH

source ~/.git-completion.bash
export GIT_PS1_SHOWDIRSTATE=true

#
# PS1 fun
#

export VIRTUAL_ENV_DISABLE_PROMPT=true

function add_virtualenv_to_ps1 {
    if [ -n "$VIRTUAL_ENV" ]
    then
        local env="`basename $VIRTUAL_ENV`"
        export PS1="[py-`virtualenvwrapper_get_python_version`@$env] $PS1"
    fi
}
function remove_virtualenv_from_ps1 {
    pd
}

# call 'p' do display beautiful prompt, and 'pd' do delete it
function p {
    local        BLUE="\[\033[0;34m\]"
    local         RED="\[\033[0;31m\]"
    local   LIGHT_RED="\[\033[1;31m\]"
    local       GREEN="\[\033[0;32m\]"
    local LIGHT_GREEN="\[\033[1;32m\]"
    local       WHITE="\[\033[1;37m\]"
    local  LIGHT_GRAY="\[\033[0;37m\]"
    
    export PS1="[\$(~/bin/rvm-prompt i v g)] ${GREEN}\H ${WHITE}@ ${BLUE}\w${WHITE}${WHITE} ${RED}$(__git_ps1 "(%s)") ${WHITE}\$ "
    add_virtualenv_to_ps1
}
function pd {
    local       GREEN="\[\033[0;32m\]"

    export PS1="${WHITE}\$ "
}
pd

export PYTHONSTARTUP=$HOME/.pythonstartup 
#export VERSIONER_PYTHON_PREFER_32_BIT=yes

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.rvm/scripts/completion" ]] && . "$HOME/.rvm/scripts/completion"

# pip bash completion
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip

# memcached
EVENT_NOKQUEUE=1

export ZZCOR=1

# don't create ._* files in OS X
export COPYFILE_DISABLE=true

export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"

alias egrep="egrep --colour"
alias grep="grep --colour"
alias tree="tree -C"
alias vim="mvim -v"
alias ll="ls -l"
alias la="ls -la"
alias ls="ls -G"

source $HOME/.profile.local