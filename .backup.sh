#/bin/bash

FILE='engineering.ods'
BACKUP_EXT='.bak'
if [ -f $FILE ]; then
    echo 'Backing up existing file to .'$FILE''$BACKUP_EXT' ...'
    mv -i $FILE '.'$FILE''$BACKUP_EXT
fi

if [ -f $FILE ]; then
	echo 'File still exists. Aborting. Backup the file or remove the file manually if it is outdated/no longer needed.'
	exit 1
fi

