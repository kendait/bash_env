#~/.bash_profile

PS1="\W \$ "
HISTIGNORE="ll:ls:lla:la:lm:c:h:x:clear:exit:history:jobs"
EDITOR="/usr/bin/vim"
MAINFRAME_PATH="/Users/${USER}/Developer/mainframe"
PATH="/Users/kenpd/Developer/mainframe/bin:/usr/local/mysql/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

export PS1 HISTIGNORE EDITOR PATH MAINFRAME_PATH

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

eval "$(rbenv init -)"
