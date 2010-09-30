export WORKON_HOME=/Users/igor.sobreira/projects/envs
. /usr/local/bin/virtualenvwrapper.sh

alias ll="ls -l"
alias la="ls -la"
alias ls="ls -G"

export EDITOR=vim

alias egrep="egrep --colour"
alias grep="egrep --colour"
export CLICOLOR="auto"
export GREP_COLOR="4;33"
export GREP_OPTIONS="--color=auto"

export PATH=~/Scripts:/usr/local/sbin/:/usr/local/bin:$PATH

# ruby stuff
export PATH=/usr/local/Cellar/ruby/1.9.1-p378/bin:$PATH
export PATH=/Users/igor.sobreira/.gem/ruby/1.9.1/bin:$PATH

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

export PYTHONSTARTUP=$HOME/.pythonstartup 
export VERSIONER_PYTHON_PREFER_32_BIT=yes

# shortcuts to most used commands at work
alias selenium_start="java -jar $WORKON_HOME/novelas/publicacao-core/external/selenium-server.jar"
alias activemq_start="$WORKON_HOME/novelas/novelas/infra/apache-activemq-5.2.0/bin/activemq"
alias solr_start="cd $WORKON_HOME/novelas/novelas/infra/apache-solr-1.3.0/example; java -jar start.jar"
alias analytics_start="ruby $WORKON_HOME/novelas/novelas/infra/google-analytics-fake/google_analytics.rb"
