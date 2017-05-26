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

#GENERAL BASH SHORTCUTS
	alias c='clear'
	alias h='history'
	alias x='exit'
	alias sbash='source ~/.bash_profile'
	alias vbash='vim ~/.bash_profile ~/.bashrc ~/.bashrc.d/aliases.bash ~/.bashrc.d/functions.bash'
	alias vbash_a='vim ~/.bashrc.d/aliases.bash'
	alias vbash_f='vim ~/.bashrc.d/functions.bash'
	alias vbash_d='vim ~/.bashrc.d/aliases.bash ~/.bashrc.d/functions.bash'
	alias grep='grep --color=auto'
	alias lines='wc -l'
	alias words='wc -w'
	alias bfunc='parseBashRCFunctions'
	alias lal='parseBashRCAliases'
	alias k='clearTermScrollback'
	alias abash='atom ~/Developer/bash_env'
	alias geek='accessGeeklets'

#FILESYSTEM NAVIGATION
	#alias ll='ls -lFT'
	#alias ll='longFileListing'
	#alias lla='longFileListing -A'
	alias ll='ls -oGFL'
	alias ls='ls -G'
	alias lla='ls -lAFG'
	alias la='ls -AF'
	alias lm='ls -m'
	alias l.='listHomeDotFolders'
	alias dot='listHomeDotFolders'
	alias t1='tree -L 1'
	alias t2='tree -L 2'

#SERVERS
	alias mysql.stop='sudo /usr/local/mysql/support-files/mysql.server stop'
	alias mysql.start='sudo /usr/local/mysql/support-files/mysql.server start'
	#alias servers='~/Developer/shell_scripts/servers.sh'
	alias old_servers='~/Developer/shell_scripts/servers.sh'
	alias localhost='~/Developer/shell_scripts/localhost.sh'
	alias lh='~/Developer/shell_scripts/localhost.sh'
	alias kenanigans='ssh kenanigans'

#GENERAL ALIASES

#TESTING
	alias fcpx='open -a "Final Cut Pro"'
	alias safari='open -a "Safari"'
	alias getimg='open https://images.google.com'
	alias google='open https://google.com'
	alias free='diskCapacity'
	alias beep='printf "\7"'
	#alias mainframe='cd $MAINFRAME_PATH && clear && git status && ll -R'
	alias osa_eof='osascript <<-eof'


	
#END
