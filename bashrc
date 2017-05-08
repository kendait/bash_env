#~/.bashrc

##FUNCTIONS
dateString() { echo $(date +"%Y%m%s_%H%M%S"); }

##ALIASES
alias ll='ls -lFT'
alias ls='ls -G'
alias lla='ls -lAFG'
alias la='ls -AF'
alias lm='ls -m'
alias c='clear'
alias h='history'
alias x='exit'
alias mysql.stop='sudo /usr/local/mysql/support-files/mysql.server stop'
alias mysql.start='sudo /usr/local/mysql/support-files/mysql.server start'
