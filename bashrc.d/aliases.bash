#!/usr/local/bin/bash
#
#	[bash_env]: aliases.bash (to supplement bashrc)
#	  
#	[bash_env] are my user customizations to the bash shell
#		
#		AUTHOR: Kenneth Dait
#		WEBSITE: http://kenanigans.com
#		GIT REPO: https://github.com/kendait/bash_env
#
#


#FILESYSTEM NAVIGATION
	#alias ll='ls -lFT'
	alias ll='longFileListing'
	alias lla='longFileListing -A'
	alias ls='ls -G'
	alias lla='ls -lAFG'
	alias la='ls -AF'
	alias lm='ls -m'
	alias l.='listHomeDotFolders'
	alias dot='listHomeDotFolders'

#SERVERS
	alias mysql.stop='sudo /usr/local/mysql/support-files/mysql.server stop'
	alias mysql.start='sudo /usr/local/mysql/support-files/mysql.server start'
	alias servers='~/Developer/shell_scripts/servers.sh'
	alias localhost='~/Developer/shell_scripts/localhost.sh'
	alias lh='~/Developer/shell_scripts/localhost.sh'
	alias kenanigans='ssh kenanigans'

#GENERAL ALIASES
	alias c='clear'
	alias h='history'
	alias x='exit'
	alias sbash='source ~/.bash_profile'
	alias vbash='vim ~/.bash_profile ~/.bashrc ~/.bashrc.d/*'
	alias grep='grep --color=auto'
	alias lines='wc -l'
	alias words='wc -w'
	#alias mainframe='cd $MAINFRAME_PATH && clear && git status && ll -R'
	alias beep='printf "\7"'

#TESTING
	alias fcpx='open -a "Final Cut Pro"'
	alias safari='open -a "Safari"'
	alias getimg='open https://images.google.com'
	alias google='open https://google.com'


