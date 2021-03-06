#/bin/bash

if [ -z $1 ]; then
	echo 'No command given. Exiting.'
	exit 1

fi

FILE='engineering.ods'

# git add didn't like the paths of ls:
#all_but_file=$(ls | grep '[^.]*' | awk -F'engineering.ods' '{print $1 $2}')

# nor those of find without -print0:
#all_but_file=$(find . | sed 's/[.][/][.].*//' | awk -F'engineering.ods' '{print $1 $2}')
#all_but_file=eval "find . -not -path '*/\.*' -not -path '..' -not -path '.'"

##
# WORKING ALTERNATIVE -print0
#CMD_git_add_all_but_hidden_and_file="find . -not -path '*engineering.ods' -not -path '*/.*' -not -path '*.~*' -print0 | xargs -0 git add " # <-- -print0 to handle spaces, e.g. Object xY.
#grep --null '[^.]*'
#-exec git add "{}" \;

##
# WORKING ALTERNATIVE without -print0 (the one that currently is used, credit oyouareatubeo from stackoverflow)
#http://stackoverflow.com/questions/143171/how-can-i-use-xargs-to-copy-files-that-have-spaces-and-quotes-in-their-names
#find . -not -path '*engineering.ods' -not -path '*/.*' -not -path '*.~*' -not -path '..' -not -path '.' | sed 's/.*/"&"/' | xargs git add

# NOTE:
# => Now still not using subdirectories because even if a custom OpenFOAM or other engineering tools shall be integrated, the integration will rather be the other way, i.e. this engineeringtoolkit repository will be loaded as submodule or subtree in OpenFOAM.

if [ $1 == 'add' ]; then
    ./.unpack.sh
	echo 'Adding all the unpacked files ...'
	if [ -z $2 ]; then
	    echo 'Adding all non-hidden files ...'
		#git add $all_but_file
		#$CMD_git_add_all_but_hidden_and_file
		$(find . -not -path '*engineering.ods' -not -path '*/.*' -not -path '*.~*' -not -path '..' -not -path '.' | sed 's/.*/"&"/' | xargs git add)
	else
        git add $2
    fi
elif [ $1 == 'commit' ]; then
	echo 'Committing ...'
    CMD='git commit '
	#if [[ ${2#*-}=='a' ]]; then
	if [ ${2} == "-a" ]; then
	    CMD=$CMD' '$2' '$3' "'$4'"'
	elif [ ${2} == "-m" ]; then
	    CMD=$CMD' '$2' "'$3'"'
	fi
	echo $CMD
	eval $CMD
#elif [ $1 == 'push' ]; then <-- superfluous, use git push directly instead.
#	echo 'Pushing ... (If it fails check that you added and committed something.)'
#    #BACKUP_EXT='.push.bak' ./.backup.sh
#    git push $2 $3
elif [ $1 == 'pull' ]; then
	echo 'Pulling ...'
    git pull $2 $3
    BACKUP_EXT='.pull.bak' ./.backup.sh
    echo 'Assembling '$FILE' ...'
    7z a -r $FILE mimetype $(ls . | grep '[^.]*')
	#mv $FILE'.zip' $FILE
else
	echo 'Command not known.'
fi




