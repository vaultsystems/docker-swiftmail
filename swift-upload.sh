#!/bin/bash
while true; do
	cd /var/mail
	ls Maildir/cur/* &>/dev/null
	if [ $? -eq 0 ]; then
		cd Maildir/cur
		files=`ls *`
		swift upload mail $files
		if [ $? -eq 0 ]; then
			rm $files
		fi
	fi
	sleep 10
done