#!/bin/bash

main_title()
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

sign_in()
{
	echo ' ____ ___ ____ _   _   ___ _   _ '
	echo '/ ___|_ _/ ___| \ | | |_ _| \ | |'
	echo '\___ \| | |  _|  \| |  | ||  \| |'
	echo ' ___) | | |_| | |\  |  | || |\  |'
	echo '|____/___\____|_| \_| |___|_| \_|'
}

#  print menu button with blue or red background
print_button()
{
	text="$1"
	maxlen=$2
	color="$3"  #  red or blue

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

key="A"  #  to return arrow or enter key from user_input()

user_input()
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
				key="A"
			elif [ $input = "B" ]  #  DOWN
			then
				key="B"
			elif [ $input = "C" ]  #  RIGHT
			then
				key="C"
			elif [ $input = "D" ]  #  LEFT
			then
				key="D"
			fi
		fi
	elif [ "$input" = "" ]
	then
		key="ENTER"
	fi
}

highlight=0  #  number of button which is highlighted

#  print main menu buttons
main_menu()
{
	number=$1

	case $number in
		0)
			print_button JOIN 10 "red"
			echo -e "			\c"
			print_button "SIGN IN" 10 "blue"
			echo -e "\n"
			print_button EXIT 10 "blue"
			echo -e "			\c"
			print_button "SIGN OUT" 10 "blue"
			echo -e "\n";;
		1)
			print_button JOIN 10 "blue"
			echo -e "			\c"
			print_button "SIGN IN" 10 "red"
			echo -e "\n"
			print_button EXIT 10 "blue"
			echo -e "			\c"
			print_button "SIGN OUT" 10 "blue"
			echo -e "\n";;
		2)
			print_button JOIN 10 "blue"
			echo -e "			\c"
			print_button "SIGN IN" 10 "blue"
			echo -e "\n"
			print_button EXIT 10 "red"
			echo -e "			\c"
			print_button "SIGN OUT" 10 "blue"
			echo -e "\n";;
		3)
			print_button JOIN 10 "blue"
			echo -e "			\c"
			print_button "SIGN IN" 10 "blue"
			echo -e "\n"
			print_button ExIT 10 "blue"
			echo -e "			\c"
			print_button "SIGN OUT" 10 "red"
			echo -e "\n";;
		*)
			print_button JOIN 10 "blue"
			echo -e "			\c"
			print_button "SIGN IN" 10 "blue"
			echo -e "\n"
			print_button EXIT 10 "blue"
			echo -e "			\c"
			print_button "SIGN OUT" 10 "blue"
			echo -e "\n";;
	esac
}

clear
main_title
main_menu

while true
do
	user_input
	clear
	main_title

	case $highlight in
		0)  #  JOIN
			if [ $key = "B" ]
			then
				highlight=2
			elif [ $key = "C" ]
			then
				highlight=1
			else
				highlight=0
			fi;;
		1)  #  SIGN IN
			if [ $key = "B" ]
			then
				highlight=3
			elif [ $key = "D" ]
			then
				highlight=0
			fi;;
		2)  #  EXIT
			if [ $key = "ENTER" ]
			then
				clear
				exit 0
			elif [ $key = "A" ]
			then
				highlight=0
			elif [ $key = "C" ]
			then
				highlight=3
			fi;;
		3)  #  SIGN OUT
			if [ $key = "A" ]
			then
				highlight=1
			elif [ $key = "D" ]
			then
				highlight=2
			fi;;
	esac

	main_menu $highlight
done
