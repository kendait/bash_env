#!/usr/local/bin/bash
#
#	[bash_env]: functions.bash (to supplement bashrc)
#
#	[bash_env] are my user customizations to the bash shell
#
#		AUTHOR: Kenneth Dait
#		WEBSITE: http://kenanigans.com
#		GIT REPO: https://github.com/kendait/bash_env
#
#




#listRecentSpotlightShortcuts() {
	#cat "/Users/${USER}/Library/Application\ Scripts/com.apple.spotlight.Shortcuts" |\
	#grep '<key>'

#}

toggleMenubarAndDockHiding() {
	menubar &>/dev/null && dock
}


toggleDockHiding() {
	osascript <<eof
	tell application "System Events"
	    tell dock preferences to set autohide to not autohide
	end tell
eof
}

goBack() {
	if [ ! -z $OLDPWD ]; then
		cd $OLDPWD
		return
	else
		echo "\$OLDPWD isn't set."
	fi
}


longFileListing() {
	targetDir=""
	lsOpts="-oFGTh"

	if [[ $1 == "-a" || $1 == "-A" ]]; then
		lsOpts=$lsOpts"A"
		shift
	fi

	if [ -z $1 ]; then
		targetDir=$PWD
	elif [[ ${1:0:1} == '-' ]]; then
		#ls options passed
		parseArgArrForOpts
	elif [[ ${1:0:1} == '/' ]]; then
		#absolute path
		targetDir="$1"
	elif [[ ${1:0:1} != '/' ]]; then
		#presume relative path
		targetDir=$PWD"$1"
	fi
	ls $lsOpts $targetDir | \
		grep -v '~$' | \
		grep -v '\.DS_Store' | \
		grep -v '\.CFUserTextEncoding'

}


clearTermScrollback() {
	osascript <<-eof
	tell application "System Events"
	keystroke "k" using {command down}
	end tell
eof
}

##END
