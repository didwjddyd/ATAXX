#!/bin/bash

print_main_title()
{
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
}

#  print menu button with blue or red background
blue_background()  #  red code = 41
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
menu_line()
{
	text1="$1"
	text2="$2"
	
	blue_background "$text1" 10
	echo -e "		\c"
	blue_background "$text2" 10
	echo
}

direction="A"  #  to return arrow direction from input_arrow()

input_arrow()
{
	read -s -n 1 input
	if [ $input = "" ]
	then
		read -s -n 1 input

		if [ $input = "[" ]
		then
			read -s -n 1 input

			if [ $input = "A" ]  #  UP
			then
				direction="A"
			elif [ $input = "B" ]  #  DOWN
			then
				direction="B"
			elif [ $input = "C" ]  #  RIGHT
			then
				direction="C"
			elif [ $input = "D" ]  #  LEFT
			then
				direction="D"
			fi
		fi
	fi
}

highlight=0  #  number of button which is highlighted

clear
print_main_title
menu_line JOIN "SIGN IN"
echo -e "\n"
menu_line EXIT "SIGN OUT"
echo -e "\n"

while true
do
	input_arrow
	clear
	print_main_title
	case highlight in
		0)
			if [ $direction = "B" ]
			then
			elif [ $direction = "C" ]
			then
			fi;;
		1)
			if [ $direction = "B" ]
			then
			elif [ $direction = "D" ]
			then
			fi;;
		2)
			if [ $direction = "A" ]
			then
			elif [$direction = "C" ]
			then
			fi;;
		3)
			if [ $direction = "A" ]
			then
			elif [ $direction = "D" ]
			then
			fi;;
	esac
done
