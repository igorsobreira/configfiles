# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

export LC_ALL=en_US.UTF-8

export EDITOR=vim
export CLICOLOR="auto"

export PATH=$HOME/bin:/usr/local/sbin/:/usr/local/bin:$PATH

export WORKON_HOME=$HOME/.envs
export PROJECT_HOME=$HOME/dev
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
if [ -f /usr/local/bin/virtualenvwrapper_lazy.sh ]; then source /usr/local/bin/virtualenvwrapper_lazy.sh; fi

if [ -f ~/.git-completion.bash ]; then source ~/.git-completion.bash; fi
if [ -f ~/.git-prompt.sh ]; then source ~/.git-prompt.sh; fi

export PYTHONSTARTUP=$HOME/.pythonstartup 
export GIT_PS1_SHOWDIRTYSTATE=true
export PS1="\[\033[35m\]\t\[\033[m\] \[\033[33;1m\]\w\[\033[m\]\$(__git_ps1)\n$ "

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
alias tree="tree -C -I '*.pyc' -I '__pycache__'"
alias ll="ls -l"
alias la="ls -la"
alias ls="ls -G"
alias emacs="emacs --no-splash"
alias dc=docker-compose

# brew install gnu-sed
alias sed=gsed

ssh-add ~/Dropbox/dev/keys/id_rsa_github 2>/dev/null
ssh-add ~/Dropbox/dev/keys/id_rsa_realgeeks 2>/dev/null

[ -f ~/.profile.local ] && . ~/.profile.local

alias ssh="ssh -o ServerAliveInterval=60"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

set -o emacs

export NVM_DIR="/Users/igor/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export AWS_DEFAULT_REGION="us-east-1"

export PATH="~/bin:${PATH}"

# Go from Homebrew
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$HOME/go/bin
export GOPATH=$HOME/go

export PATH="/usr/local/opt/mongodb@3.2/bin:$PATH"

export PATH="$HOME/.poetry/bin:$PATH"
