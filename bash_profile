#
#
#	bash_profile

currentSystem=$(echo "$(uname -s)/$(uname -p)")

if [[ $currentSystem == "Darwin/i386" ]]; then
	if [ -f ~/.bash_darwin_i386/bash_profile ]; then
		source ~/.bash_darwin_i386/bash_profile
		echo ">> bash_profile loaded (darwin_i386)..."
	fi
elif [[ 3 -eq 0 ]]; then
	echo "huh?"
	# other system configs go here
fi

if [ -f ~/.bashrc ]; then source ~/.bashrc; fi
