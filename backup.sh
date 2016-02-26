#!/bin/bash
clear;

echo -e "\e[1m

      #----------------------------------------------#
      |    Welcome to the Back Up Automation Tool    |
      |	    	                                     |
      |        Author: Hadi hadi@impixle.com         |
      #----------------------------------------------#

\e[0m";


limit=2;
echo "Type folder name for backups to be stored:";
read main_backup_folder;

folder_selection=false;
if [ "$folder_selection" = false ] ; then
	if ! [ -d "/$main_backup_folder" ] ; then
			mkdir /$main_backup_folder;
			echo -e "\e[36mBackup Server folder '$main_backup_folder' is successfully created now \e[0m";
			folder_selection=true;
			sleep 2;
		else
			echo -e "\e[91mFolder $main_backup_folder already exist, please revise the folder and run the app again.\e[0m";
	fi
fi


if [ "$folder_selection" == true ]; then
	i=0
	for d in var/www/vhosts/* ; do
	    if [ "$i" -lt "3" ] ; then
		    IFS='/'
		    ary=($d)
		    once=false;
		    for v in "${ary[@]}"; do
		    	if [ "$once" = false ] ; then
			    	echo "$d";
					echo "${ary[3]}.tar.gz";
					tar -zcvf "${ary[3]}.tar.gz" "/$d";
					mv "${ary[3]}.tar.gz" "/$main_backup_folder";
					echo "Back up for '${ary[3]}' is successfully created."
					sleep 2;
					once=true;
				fi
		    done
		fi
	    ((i++))
	done
fi