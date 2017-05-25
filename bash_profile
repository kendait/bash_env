#~/.bash_profile

##SET ENV VARS:
PS1="\w:\$ "
EDITOR="/usr/bin/vim"
MAINFRAME_PATH="/Users/${USER}/Developer/mainframe"
PATH="/Users/${USER}/Developer/mainframe/bin:/usr/local/mysql/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
LESSANSIMIDCHARS="0123456789\[\;"
LESSANSIENDCHARS="m"
PROMPT_COMMAND='history -a'

# HISTORY CUSTOMIZATIONS
# Source article: https://sanctum.geek.nz/arabesque/better-bash-history/
shopt -s histappend
shopt -s cmdhist		#force multi-line commands to fit only 1 line 
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTCONTROL=ignorespace
	#HISTCONTROL=ignoreboth	#this specifies "ignorespace" and "ignoredups"
HISTIGNORE="ll:ls:lla:la:lm:c:h:x:clear:exit:history:jobs"
HISTTIMEFORMAT=' %F %T   '

export PS1 HISTIGNORE EDITOR PATH MAINFRAME_PATH COLUMNS LESSANSIMIDCHARS LESSANSIENDCHARS PROMPT_COMMAND HISTFILESIZE HISTSIZE HISTCONTROL HISTTIMEFORMAT

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

eval "$(rbenv init -)"
