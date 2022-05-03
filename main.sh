#!/bin/bash

#  print menu button with blue background
blue_background()
{
	text="$1"
	maxlen=$2
	blank=`expr $maxlen - ${#text}`

	if [ `expr ${#text} % 2` -eq 1 ]
	then
		for ((i=0; i!=`expr $blank / 2`; ++i))
		do
			echo -e [44m" \c"
		done
		echo -e "$text\c"
		for ((i=0; i!=`expr $blank - $blank / 2`; ++i))
		do
			echo -e " \c"
		done
		echo -e [0m"\c"
	else
		for ((i=0; i!=`expr $blank / 2`; ++i))
		do
			echo -e [44m" \c"
		done
		echo -e "$text\c"
		for ((i=0; i!=`expr $blank - $blank / 2`; ++i))
		do
			echo -e " \c"
		done
		echo -e [0m"\c" 
	fi
}

#  print menu button per line
main_menu_line()
{
	text1="$1"
	text2="$2"
	
	blue_background "$text1" 10
	echo -e "		\c"
	blue_background "$text2" 10
	echo
}

while true
do
	clear
	
	echo -e "\n"
	echo '   ____   ___  ____ ___ _       _ '
	echo '  / ___| / _ \/ ___|_ _| |     / |'
	echo '  \___ \| | | \___ \| || |     | |'
	echo '   ___) | | | |___) | || |___  | |'
	echo '  |____/ \___/|____/___|_____| |_|'
	echo '      _  _____  _    __  ____  __ '
	echo '     / \|_   _|/ \   \ \/ /\ \/ / '
	echo '    / _ \ | | / _ \   \  /  \  /  '
	echo '   / ___ \| |/ ___ \  /  \  /  \  '
	echo '  /_/   \_\_/_/   \_\/_/\_\/_/\_\ '
	echo -e "\n\c"
	echo '                           2019203027 양정용'
	echo -e "\n\c"
	main_menu_line JOIN "SIGN IN"
	echo -e "\n"
	main_menu_line EXIT "SIGN OUT"
	echo -e "\n"
done
