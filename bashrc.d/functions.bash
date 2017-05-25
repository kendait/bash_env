## functions.bash

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
	echo $(date +"%Y%m%d_%H%M_%S"); 
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
