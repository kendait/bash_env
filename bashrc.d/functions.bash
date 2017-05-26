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

listHomeDotFolders() {

	listArrayItemsByLine() {
		unset arr
		arr=($(echo $@))
		#echo ${#arr[@]} && return
		dotIndex=0
		dotCounter=1
		for dot in "${arr[@]}";
		do
			#echoStr="${dotIndex}: ${dot}"	
			echoStr="${dot}"
			#echo $((dotCounter%3))
			if [[ $((dotCounter%3)) -ne 0 ]]; then
				#echo -ne "$echoStr\t"
				printf "%-20.15s\t" $echoStr
			elif [[ $((dotCounter%3)) -eq 0 ]]; then
				#echo -ne "$echoStr\n"
				printf "%-20.15s\n" $echoStr
			fi
			dotIndex=$((dotIndex+1))
			dotCounter=$((dotCounter+1))
		done
	}

	#gather non-directory dot files in array $dotFiles
	dotFiles=($(ls -FGd ~/.* | \
		grep -Ev '\/\.+\/$' | \
		grep -v '~$' | grep -v "\.DS_Store" | \
		grep -v "\.CFUserTextEncoding" | \
		grep -v "\.Trash\/$" | \
		sed 's|/Users/kenpd/||' | \
		grep -v '\/$'))

	#gather directory dot files in array $dotDirs
	dotDirs=($(ls -FGd ~/.* | \
		grep -Ev '\/\.+\/$' | \
		grep -v '~$' | \
		grep -v "\.DS_Store" | \
		grep -v "\.CFUserTextEncoding" | \
		grep -v "\.Trash\/$" | \
		sed 's|/Users/kenpd/||' | \
		grep '\/$' | \
		sed 's/^.*$/[&]/' | \
		sed 's/\/\]$/\]/'))

	echo -en "\nHOME DOT FILES:\n" && \
		listArrayItemsByLine ${dotFiles[@]}
	echo -en "\n\nHOME DOT FILE DIRECTORIES:\n" && \
		listArrayItemsByLine ${dotDirs[@]}
	echo -en "\n\n"

}

dait() {

	usage() {
		echo -e "usage: \t dait [-d --date | -dn --datenumbers | -ds --datesortable]"
		echo -e "	\t dait [-t --time | -ts --timestring | -dtstr|--datetimestring]"
		echo -e "	\t dait [-fs --fullstring | -u --usage | -h --help]"

	}
	
	if [[ $# -eq 0 ]];
	then
		echo $(date +"%Y%m%d_%H%M_%S")

	else
		for i in "$@"; do
			returnString=""
			case $i in
				-d|--date) 			returnString=$(date +"%h %d, %Y");;
				-dn|--datenumbers)		returnString=$(date +"%m-%d-%y");;
				-ds|--datesortable)		returnString=$(date +"%Y%m%d");;
				-t|--time) 			returnString=$(date +"%H:%M:%S");;
				-ts|--timestring) 		returnString=$(date +%H%M%S);;
				-dtstr|--datetimestring)	returnString=$(date +%Y%m%d%H%M%S);;
				-u|--usage)			usage;;
				-h|--help)			usage;;
				-fs|--fullstring)		returnString=$(date +$Y%m%d%H%M%S);;
				*)				echo "[dait]: "$1" is not a recognized argument." && return;;
			esac
		done
	fi

	if [ -z "$returnString" ]; then return; fi

	echo $returnString

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

diskCapacity() {
	usedPercentage=$(df -H | grep "/dev/disk1" | awk '{print $5}')
	echo "Mac HD: ${usedPercentage} full"
}

weather() {

	w1=$(curl -s https://www.wunderground.com/q/zmw:78641.1.99999 | \
		grep -n "fi-clock" | sed 's/^.*<span>//' | \
		sed 's/<\/span>[[:space:]]/ /g' | \
		sed 's/<.*$//')
	
	w2=$(curl -s https://www.wunderground.com/q/zmw:78641.1.99999 | \
		grep -n "Leander" | \
		grep "^22:" | \
		sed 's/^.*L/L/g' | \
		tr -d '&' | \
		tr -d ';' | \
		sed 's/\".*$//g')	

	echo $w1 && echo $w2
	echo "(source: wunderground.com)"

}

parseBashRCFunctions() {

	functionsWithLineNums() {
		echo "BASH FUNCTIONS (in ~/.bashrc.d/functions.bash" \
			&& cat ~/.bashrc.d/functions.bash \
			| nl | sed "s|()[[:space:]]*{|()|g" \
			| grep '^[[:space:]0-9]*[a-zA-Z][a-zA-Z0-9]*()' \
			| sed 's/^[[:space:]]*//' \
			| awk '{printf ("%-25s\t(line# %-4s)\n",$2,$1)}' \
			| sed 's/[[:space:]]*)$/)/' \
			| grep '^[A-z0-9]*()'
	}
	justGrabTheFunctions() {
		cat "/Users/kenpd/.bashrc.d/functions.bash" | \
			sed "s|()[[:space:]]*{|()|g"| \
			grep '^[a-zA-Z][a-zA-Z0-9]*\(\)'
	}
	#justGrabTheFunctions
	functionsWithLineNums
}

parseBashRCAliases() {

	grabOnlyAliasNames() {
		aliasArr=($(cat ~/.bashrc.d/aliases.bash \
			| grep '^[[:space:]]*alias.*$' \
			| sed 's/^[[:space:]]*alias[[:space:]]//g' \
			| sed 's/=.*$//' \
			| tr '\n' ' '))
		echo -en "\n"
		echo "ALIAS COUNT: ${#aliasArr[@]}"
		echo -en "\n"
		for i in ${aliasArr[@]}; do
			echo -en "$i\t"
		done
		echo -en "\n\n\n"
	}

	justGrabAliases() {
		cat ~/.bashrc.d/aliases.bash \
			| grep '^[[:space:]]*alias.*$'
	}
	grabOnlyAliasNames
	#justGrabAliases
}

clearTermScrollback() {
	osascript <<-eof
	tell application "System Events"
	keystroke "k" using {command down}
	end tell
eof
}

accessGeeklets() {
	osascriptHandler() {
		osascript <<eof
		tell application "Geektool Helper"
		geeklets
		end tell
eof
	}
	osascriptHandler | sed 's/,[[:space:]]/|/g' | tr '|' '\n'
}

##END
