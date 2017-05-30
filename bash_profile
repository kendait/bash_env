#~/.bash_profile

##SET ENV VARS:
	#PS1="\w:\$ "
	PS1="\033[31;40m \!-[mf]$ \033[0m-+"
	EDITOR="/usr/bin/vim"
	MAINFRAME_PATH="/Users/${USER}/Developer/mainframe"
	DEV="/Users/${USER}/Developer"
	MF="${DEV}/mainframe"
	MF_COMMANDS=$MF"/mf_commands"
	PATH="/Users/${USER}/Developer/mainframe/bin:/usr/local/mysql/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
	LESSANSIMIDCHARS="0123456789\[\;"
	LESSANSIENDCHARS="m"
	PROMPT_COMMAND='history -a'
	BROWSER="Safari"

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

	export PS1 HISTIGNORE EDITOR PATH MAINFRAME_PATH COLUMNS LESSANSIMIDCHARS LESSANSIENDCHARS
	export PROMPT_COMMAND HISTFILESIZE HISTSIZE HISTCONTROL HISTTIMEFORMAT BROWSER

	DESK=~/Desktop
	DL=~/Downloads
	DOCS=~/Documents
	MUSIC=~/Music
	PICS=~/Pictures
	SITES=~/Sites
	export DESK DL DOCS MUSIC PICS SITES

#load user customizations
	if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

#initializes shims for Ruby package manager rbenv (homebrew)
	eval "$(rbenv init -)"


##END

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
