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
print_button()  #  red code = 41
{
	text="$1"
	maxlen=$2
	color="$3"

	case $color in
		red) echo -e [41m"\c";;
		blue | *) echo -e [44m"\c";;
	esac
	
	blank=`expr $maxlen - ${#text}`

	for ((i=0; i!=`expr $blank / 2`; ++i))
	do
		echo -e " \c"
	done
	echo -e "$text\c"
	for ((i=0; i!=`expr $blank - $blank / 2`; ++i))
	do
		echo -e " \c"
	done
	echo -e [0m"\c"
}

two_buttons()
{
	text1="$1"
	text2="$2"
	length=$3
	color1="$4"
	color2="$5"

	print_button "$text1" $length $color1
	echo -e "		\c"
	print_button "$text2" $length $color2
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
	elif [ "$input" = "" ]
	then
		direction="ENTER"
	fi
}

highlight=0  #  number of button which is highlighted

main_menu_case()
{
	number=$1

	case $number in
		0)
			two_buttons JOIN "SIGN IN" 10 "red" "blue"
			echo -e "\n"
			two_buttons EXIT "SIGN OUT" 10 "blue" "blue"
			echo -e "\n";;
		1)
			two_buttons JOIN "SIGN IN" 10 "blue" "red"
			echo -e "\n"
			two_buttons EXIT "SIGN OUT" 10 "blue" "blue"
			echo -e "\n";;
		2)
			two_buttons JOIN "SIGN IN" 10 "blue" "blue"
			echo -e "\n"
			two_buttons EXIT "SIGN OUT" 10 "red" "blue"
			echo -e "\n";;
		3)
			two_buttons JOIN "SIGN IN" 10 "blue" "blue"
			echo -e "\n"
			two_buttons EXIT "SIGN OUT" 10 "blue" "red"
			echo -e "\n";;
		*)
			two_buttons JOIN "SIGN IN" 10 "blue" "blue"
			echo -e "\n"
			two_buttons EXIT "SIGN OUT" 10 "blue" "blue"
			echo -e "\n";;
	esac
}

clear
print_main_title
main_menu_case

while true
do
	input_arrow
	clear
	print_main_title

	case $highlight in
		0)
			if [ $direction = "B" ]
			then
				highlight=2
				main_menu_case $highlight
			elif [ $direction = "C" ]
			then
				highlight=1
				main_menu_case $highlight
			else
				highlight=0
				main_menu_case $highlight
			fi;;
		1)
			if [ $direction = "B" ]
			then
				highlight=3
				main_menu_case $highlight
			elif [ $direction = "D" ]
			then
				highlight=0
				main_menu_case $highlight
			fi;;
		2)  #  EXIT
			if [ $direction = "ENTER" ]
			then
				clear
				exit 0
			elif [ $direction = "A" ]
			then
				highlight=0
				main_menu_case $highlight
			elif [ $direction = "C" ]
			then
				highlight=3
				main_menu_case $highlight
			fi;;
		3)
			if [ $direction = "A" ]
			then
				highlight=1
				main_menu_case $highlight
			elif [ $direction = "D" ]
			then
				highlight=2
				main_menu_case $highlight
			fi;;
	esac
done
