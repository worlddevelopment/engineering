#/bin/bash

FILE='./engineering.ods'
BACKUP_EXT='.bak'
if [ -f $FILE ]; then
    echo 'Unpacking ...'
    unzip $FILE
	echo '*done*'
    echo 'Moving (backing up) to '$FILE''$BACKUP_EXT'...'
    mv -i $FILE $FILE''$BACKUP_EXT
	echo '*done*'
elif [ ! -f $FILE ]; then
    echo $FILE' not found. => Manual changes or already backed up. => No unpacking required.'
fi

