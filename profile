
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# virtualenv wrapper configuration
#export WORKON_HOME=$HOME/projects/envs
#if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
#    . /usr/local/bin/virtualenvwrapper.sh
#fi

alias ll="ls -l"
alias la="ls -la"
alias ls="ls -G"

export EDITOR=emacs

alias egrep="egrep --colour"
alias grep="egrep --colour"
export CLICOLOR="auto"
export GREP_COLOR="4;33"
export GREP_OPTIONS="--color=auto"

export PATH=~/Scripts:/usr/local/sbin/:/usr/local/bin:$PATH

# ruby stuff
export PATH=/usr/local/Cellar/ruby/1.9.1-p378/bin:$PATH
export PATH=/Users/igor.sobreira/.gem/ruby/1.9.1/bin:$PATH

# pypy
export PATH=~/Packages/pypy-c-jit-79541-osx/bin:$PATH

# go
export PATH=~/projects/go/bin:$PATH

# use GNU tools (bash, time, tar, gzip)
export PATH=/opt/bash/bin:/opt/time/bin:/opt/tar/bin:/opt/gzip/bin:$PATH

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"

PS1="\$LIGHT_GRAY[$GREEN\u@\h:\W$LIGHT_GRAY]$RED\$(parse_git_branch)$WHITE\$ "
PS2='> '
PS4='+ '
}
proml
#export PS1='\w$(__git_ps1 "(%s)")'
#export GIT_PS1_SHOWDIRSTATE=true

source ~/.git-completion.bash

export PYTHONSTARTUP=$HOME/.pythonstartup 
export VERSIONER_PYTHON_PREFER_32_BIT=yes

# shortcuts to most used commands at work
#alias selenium_start="java -jar $WORKON_HOME/novelas/publicacao-core/external/selenium-server.jar"
#alias activemq_start="$WORKON_HOME/novelas/novelas/infra/apache-activemq-5.2.0/bin/activemq"
#alias solr_start="cd $WORKON_HOME/novelas/novelas/infra/apache-solr-1.3.0/example; java -jar start.jar"
#alias analytics_start="ruby $WORKON_HOME/novelas/novelas/infra/google-analytics-fake/google_analytics.rb"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.rvm/scripts/completion" ]] && . "$HOME/.rvm/scripts/completion"
#PS1="$LIGHT_GRAY(\$(~/.rvm/bin/rvm-prompt v g))$PS1"

# pip bash completion start
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

# ImageMagic
#if [ -d $HOME/Packages/ImageMagick-6.6.5 ]; then
#    export MAGIC_HOME=$HOME/Packages/ImageMagick-6.6.5
#    export PATH=$MAGIC_HOME/bin:$PATH
#    export DYLD_LIBRARY_PATH=$MAGIC_HOME/lib
#fi

# Setting PATH for Python 2.7
# The orginal version is saved in .profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

# SpiderMonkey
export PATH="/usr/local/js/bin:${PATH}"

alias tree="tree -C"
alias vim="mvim -v"
alias emacs="emacs --quick"
