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

export WORKON_HOME=$HOME/.envs
export PROJECT_HOME=$HOME/dev
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh

source ~/.git-completion.bash
source ~/.git-prompt.sh

export PYTHONSTARTUP=$HOME/.pythonstartup 

export GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)") \[\033[01;32m\]➥\[\033[00m\] '

# pip bash completion
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip

# don't create ._* files in OS X
export COPYFILE_DISABLE=true

export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"

alias egrep="egrep --colour"
alias grep="grep --colour"
alias tree="tree -C -I '*.pyc'"
alias ll="ls -l"
alias la="ls -la"
alias ls="ls -G"
alias emacs="emacs --no-splash"

ssh-add ~/.ssh/id_rsa

[ -f ~/.profile.local ] && . ~/.profile.local
