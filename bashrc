#~/.bashrc

# Load bashrc component files 
if [[ ! -z $(ls ~/.bashrc.d) ]] 2>/dev/null; then
	for config in "$HOME"/.bashrc.d/*.bash; do
		[[ -r $config ]] && source "$config"
	done
	unset -v config
fi
