#/bin/bash

if [ -z $1 ]; then
	echo 'No command given. Exiting.'
	exit 1
	
fi

if [ $1 == 'add' ]; then
    ./.unpack.sh
	echo 'Adding ...'
	if [ -z $2 ]; then
	    echo 'Adding all non-hidden files ...'
	    git add [^.]*
	else:
        git add $2 
    fi
elif [ $1 == 'commit' ]; then
    ./.unpack.sh
	echo 'Adding all the unpacked files ...'
	git add [^.]*
	echo 'Committing ...'
    CMD='git commit '
	if [ -z $3 && $3 == '-m' ]; then
	    CMD=$CMD''$2' '$3' "'$4'"'
	else:
	    CMD=$CMD''$2' "'$3'"'
	fi
	echo $CMD
	eval $CMD
elif [ $1 == 'pull' ]; then
	echo 'Pushing ... (If it fails check that you added and committed something.)'
    #BACKUP_EXT='.push.bak' ./.backup.sh
    git push $2 $3
elif [ $1 == 'pull' ]; then
	echo 'Pulling ...'
    git pull $2 $3
    BACKUP_EXT='.pull.bak' ./.backup.sh
    echo 'Assembling '$FILE' ...'
    7z a $FILE $(find ./ -name '[^.]*')
else:
	echo 'Command not known.'
fi




