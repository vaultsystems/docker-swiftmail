#!/bin/bash
while true; do
	cd /var/mail
	ls Maildir/new/* &>/dev/null
	if [ $? -eq 0 ]; then
		cd Maildir/new
		files=`ls *`
		swift upload mail $files
		if [ $? -eq 0 ]; then
			rm $files
		fi
	fi
	sleep 10
done
