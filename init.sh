#!/usr/local/bin/bash

#	init bash_env

if [ ! -L ~/.bash_profile ] && [ -z $BASH_ENV ]; then 
	/Users/"${USER}"/Developer/bash_env/bin/bash_env_install
    echo script called
fi


	/Users/"${USER}"/Developer/bash_env/bin/bash_env_install
