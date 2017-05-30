#
#
#	bashrc

if [[ $(echo "$(uname -s)/$(uname -p)") == "Darwin/i386" ]]; then
	source ~/.bash_darwin_i386/bashrc
	echo ">> bashrc loaded (darwin_i386)..."
elif [[ 3 -eq 0 ]]; then
	echo "huh?"
	# other system configs go here
fi
