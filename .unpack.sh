#/bin/bash

FILE='./engineering.ods'
BACKUP_EXT='.bak'
if [ -f $FILE ]; then
    echo 'Unpacking ...'
    unzip $FILE
	echo '*done*'
	# If it just has been unpacked, then it's still up to date unless manual changes are applied, but then it's the responsibility of the developer to integrate these manual changes by terminating the program properly before editing and recreating the file using .git.sh pull or similar.
    #echo 'Moving (backing up) to .'$FILE''$BACKUP_EXT'...'
    #mv -i $FILE '.'$FILE''$BACKUP_EXT
	#echo '*done*'
elif [ ! -f $FILE ]; then
    echo $FILE' not found. => Manual changes or already backed up. => No unpacking required.'
fi

