## aliases.bash

#FILESYSTEM NAVIGATION
	#alias ll='ls -lFT'
	alias ll='longFileListing'
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
	alias vbash='vim ~/.bash_profile ~/.bashrc'
	alias grep='grep --color=auto'
	alias lines='wc -l'
	alias words='wc -w'
