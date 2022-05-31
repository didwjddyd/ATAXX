#!/bin/bash

key="A"  #  to return arrow or enter key from user_input()
highlight=0  #  number of button which is highlighted
id="ID"  #  use for show user input id
pw="PW"  #  use for show user input pw
islogin1="true"  #  check player1 logs in successfully
islogin2="true"  #  check player2 logs in successfully
idp1="comso1"  #  use for show player1's id
idp2="comso2"  #  use for show player2's id
player=0
scorep1=0  #  score of player1
scorep2=0  #  score of player2

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

#  print menu button with blue or red background
print_button()
{
	text="$1"
	maxlen=$2
	color="$3"  #  red, blue, yellow, white

	case $color in
		yellow) echo -e [103m"\c";;
		white) echo -e [107m"\c";;
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

#  print main menu buttons
main_menu()
{
	number=$1

	case $number in
		0)
			print_button "$idp1" 10 "red"
			echo -e "			\c"
			print_button "SIGN IN" 10 "blue"
			echo -e "\n"
			print_button "$idp2" 10 "blue"
			echo -e "			\c"
			print_button "SIGN OUT" 10 "blue"
			echo -e "\n\n"
			echo -e "   \c"
			print_button JOIN 10 "blue"
			echo -e "		     \c"
			print_button EXIT 10 "blue"
			echo -e "\n";;
		1)
			print_button "$idp1" 10 "blue"
			echo -e "			\c"
			print_button "SIGN IN" 10 "red"
			echo -e "\n"
			print_button "$idp2" 10 "blue"
			echo -e "			\c"
			print_button "SIGN OUT" 10 "blue"
			echo -e "\n\n"
			echo -e "   \c"
			print_button JOIN 10 "blue"
			echo -e "		     \c"
			print_button EXIT 10 "blue"
			echo -e "\n";;
		2)
			print_button "$idp1" 10 "blue"
			echo -e "			\c"
			print_button "SIGN IN" 10 "blue"
			echo -e "\n"
			print_button "$idp2" 10 "red"
			echo -e "			\c"
			print_button "SIGN OUT" 10 "blue"
			echo -e "\n\n"
			echo -e "   \c"
			print_button JOIN 10 "blue"
			echo -e "		     \c"
			print_button EXIT 10 "blue"
			echo -e "\n";;
		3)
			print_button "$idp1" 10 "blue"
			echo -e "			\c"
			print_button "SIGN IN" 10 "blue"
			echo -e "\n"
			print_button "$idp2" 10 "blue"
			echo -e "			\c"
			print_button "SIGN OUT" 10 "red"
			echo -e "\n\n"
			echo -e "   \c"
			print_button JOIN 10 "blue"
			echo -e "		     \c"
			print_button EXIT 10 "blue"
			echo -e "\n";;
		4)
			print_button "$idp1" 10 "blue"
			echo -e "			\c"
			print_button "SIGN IN" 10 "blue"
			echo -e "\n"
			print_button "$idp2" 10 "blue"
			echo -e "			\c"
			print_button "SIGN OUT" 10 "blue"
			echo -e "\n\n"
			echo -e "   \c"
			print_button JOIN 10 "red"
			echo -e "		     \c"
			print_button EXIT 10 "blue"
			echo -e "\n";;
		5)
			print_button "$idp1" 10 "blue"
			echo -e "			\c"
			print_button "SIGN IN" 10 "blue"
			echo -e "\n"
			print_button "$idp2" 10 "blue"
			echo -e "			\c"
			print_button "SIGN OUT" 10 "blue"
			echo -e "\n\n"
			echo -e "   \c"
			print_button JOIN 10 "blue"
			echo -e "		     \c"
			print_button EXIT 10 "red"
			echo -e "\n";;
		*)
			print_button "$idp1" 10 "blue"
			echo -e "			\c"
			print_button "SIGN IN" 10 "blue"
			echo -e "\n"
			print_button "$idp2" 10 "blue"
			echo -e "			\c"
			print_button "SIGN OUT" 10 "blue"
			echo -e "\n\n"
			echo -e "   \c"
			print_button JOIN 10 "blue"
			echo -e "		     \c"
			print_button EXIT 10 "blue"
			echo -e "\n";;
	esac
}

sign_in_title()
{
	echo -e "\n"
	echo '   ____ ___ ____ _   _   ___ _   _ '
	echo '  / ___|_ _/ ___| \ | | |_ _| \ | |'
	echo '  \___ \| | |  _|  \| |  | ||  \| |'
	echo '   ___) | | |_| | |\  |  | || |\  |'
	echo '  |____/___\____|_| \_| |___|_| \_|'
	echo -e "\n\n"
}

sign_in_menu()
{
	number=$1

	case $number in
		0)
			print_button $id 20 "red"
			echo -e "  \c"
			print_button "Duplicate check" 17 "blue"
			echo -e "\n"
			print_button $pw 20 "blue"
			echo -e "\n\n"
			echo -e "	\c"
			print_button "SIGN IN" 9 "blue"
			echo -e "	\c"
			print_button EXIT 10 "blue"
			echo -e "\n";;
		1)
			print_button $id 20 "blue"
			echo -e "  \c"
			print_button "Duplicate check" 17 "red"
			echo -e "\n"
			print_button $pw 20 "blue"
			echo -e "\n\n"
			echo -e "	\c"
			print_button "SIGN IN" 9 "blue"
			echo -e "	\c"
			print_button EXIT 10 "blue"
			echo -e "\n";;
		2)
			print_button $id 20 "blue"
			echo -e "  \c"
			print_button "Duplicate check" 17 "blue"
			echo -e "\n"
			print_button $pw 20 "red"
			echo -e "\n\n"
			echo -e "	\c"
			print_button "SIGN IN" 9 "blue"
			echo -e "	\c"
			print_button EXIT 10 "blue"
			echo -e "\n";;
		3)
			print_button $id 20 "blue"
			echo -e "  \c"
			print_button "Duplicate check" 17 "blue"
			echo -e "\n"
			print_button $pw 20 "blue"
			echo -e "\n\n"
			echo -e "	\c"
			print_button "SIGN IN" 9 "red"
			echo -e "	\c"
			print_button EXIT 10 "blue"
			echo -e "\n";;
		4)
			print_button $id 20 "blue"
			echo -e "  \c"
			print_button "Duplicate check" 17 "blue"
			echo -e "\n"
			print_button $pw 20 "blue"
			echo -e "\n\n"
			echo -e "	\c"
			print_button "SIGN IN" 9 "blue"
			echo -e "	\c"
			print_button EXIT 10 "red"
			echo -e "\n";;
		*)
			print_button ID 20 "blue"
			echo -e "  \c"
			print_button "Duplicate check" 17 "blue"
			echo -e "\n"
			print_button PW 20 "blue"
			echo -e "\n\n"
			echo -e "	\c"
			print_button "SIGN IN" 9 "blue"
			echo -e "	\c"
			print_button EXIT 10 "blue"
			echo -e "\n";;

	esac
}

#  input id and pw and reprint menu buttons
info_input_mode()
{
	case $1 in
		ID)
			line=10;;
		PW)
			line=12;;
	esac

	#  move cursor to ID or PW button to input
	case $2 in
		IN)
			tput cup $line
			print_button "" 20 "red"
			tput cup $line 1;;
		OUT)
			tput cup $line 11
			print_button "" 20 "red"
			tput cup $line 12;;
	esac

	#  input id or pw
	echo -e [41m"\c"   
	case $1 in
		ID)
			read id;;
		PW)
			read pw;;
	esac
	echo -e [0m"\c"

	#  move cursor to start of menu to reprint
	tput cup 10
}

#  record id, pw, win, loss in file
record_info()
{

	if [ ! -s "$1" ]
	then
		echo "$1" > "$1"
		echo "$2" >> "$1"
		echo "0" >> "$1"
		echo "0" >> "$1"
	fi
}

check_duplicate()
{
	clear
	sign_in_title
	sign_in_menu 1 

	if [ -s "$1" ]
	then
		echo "Same ID is exist"
	else
		echo "Can sign in"
	fi
}

sign_in_page()
{
	highlight=0
	clear
	sign_in_title
	sign_in_menu

	while true
	do
		user_input
		clear
		sign_in_title

		case $highlight in
			0)  #  ID
				if [ $key = "ENTER" ]
				then
					clear
					sign_in_title
					sign_in_menu $highlight
					info_input_mode "ID" "IN"
					highlight=0
				elif [ $key = "B" ]
				then
					highlight=2
				elif [ $key = "C" ]
				then
					highlight=1
				else
					highlight=0
				fi;;
			1)  #  Duplicate check
				if [ $key = "ENTER" ]
				then
					clear
					sign_in_title
					sign_in_menu $highlight
					check_duplicate $id
					exit 0
				elif [ $key = "B" ]
				then
					highlight=2
				elif [ $key = "D" ]
				then
					highlight=0
				fi;;
			2)  #  PW
				if [ $key = "ENTER" ]
				then
					clear
					sign_in_title
					sign_in_menu $highlight
					info_input_mode "PW" "IN"
					highlight=2
				elif [ $key = "A" ]
				then
					highlight=0
				elif [ $key = "B" ]
				then
					highlight=3
				fi;;
			3)  #  SIGN IN
				if [ $key = "ENTER" ]
				then
					record_info $id $pw
					sign_in_menu $highlight
					exit 0
				elif [ $key = "A" ]
				then
					highlight=2
				elif [ $key = "C" ]
				then
					highlight=4
				fi;;
			4)  #  EXiT
				if [ $key = "ENTER" ]
				then
					sign_in_menu 4
					exit 0
				elif [ $key = "A" ]
				then
					highlight=2
				elif [ $key = "D" ]
				then
					highlight=3
				fi;;
		esac

		sign_in_menu $highlight
	done
}

sign_out_title()
{
	echo -e "\n"
	echo '   ____ ___ ____ _   _    ___  _   _ _____ '
	echo '  / ___|_ _/ ___| \ | |  / _ \| | | |_   _|'
	echo '  \___ \| | |  _|  \| | | | | | | | | | |  '
	echo '   ___) | | |_| | |\  | | |_| | |_| | | |  '
	echo '  |____/___\____|_| \_|  \___/ \___/  |_|  '
	echo -e "\n\n"
}

sign_out_menu()
{
	number=$1

	case $number in
		0)
			echo -e "	   \c"
			print_button $id 20 "red"
			echo -e "\n"
			echo -e "	   \c"
			print_button $pw 20 "blue"
			echo -e "\n\n\n"
			echo -e "	 \c"
			print_button "SIGN OUT" 10 "blue"
			echo -e "	\c"
			print_button "EXIT" 10 "blue"
			echo -e "\n";;
		1)
			echo -e "	   \c"
			print_button $id 20 "blue"
			echo -e "\n"
			echo -e "	   \c"
			print_button $pw 20 "red"
			echo -e "\n\n\n"
			echo -e "	 \c"
			print_button "SIGN OUT" 10 "blue"
			echo -e "	\c"
			print_button "EXIT" 10 "blue"
			echo -e "\n";;
		2)
			echo -e "	   \c"
			print_button $id 20 "blue"
			echo -e "\n"
			echo -e "	   \c"
			print_button $pw 20 "blue"
			echo -e "\n\n\n"
			echo -e "	 \c"
			print_button "SIGN OUT" 10 "red"
			echo -e "	\c"
			print_button "EXIT" 10 "blue"
			echo -e "\n";;
		3)
			echo -e "	   \c"
			print_button $id 20 "blue"
			echo -e "\n"
			echo -e "	   \c"
			print_button $pw 20 "blue"
			echo -e "\n\n\n"
			echo -e "	 \c"
			print_button "SIGN OUT" 10 "blue"
			echo -e "	\c"
			print_button "EXIT" 10 "red"
			echo -e "\n";;
		*)
			echo -e "	   \c"
			print_button $id 20 "blue"
			echo -e "\n"
			echo -e "	   \c"
			print_button $pw 20 "blue"
			echo -e "\n\n\n"
			echo -e "	 \c"
			print_button "SIGN OUT" 10 "blue"
			echo -e "	\c"
			print_button "EXIT" 10 "blue"
			echo -e "\n";;
	esac
}

delete_record()
{
	if [ -s "$id" ] && [ `head -2 $id|tail -1` = "$pw" ]
	then
		rm -rf "$id"
	fi
}

sign_out_page()
{
	highlight=0
	clear
	sign_out_title
	sign_out_menu

	while true
	do
		user_input
		clear
		sign_out_title

		case $highlight in
			0)  #  ID
				if [ $key = "ENTER" ]
				then
					clear
					sign_out_title
					sign_out_menu $highlight
					info_input_mode "ID" "OUT"
					highlight=0
				elif [ $key = "B" ]
				then
					highlight=1
				else
					highlight=0
				fi;;
			1)  #  PW 
				if [ $key = "ENTER" ]
				then
					clear
					sign_out_title
					sign_out_menu $highlight
					info_input_mode "PW" "OUT"
				elif [ $key = "A" ]
				then
					highlight=0
				elif [ $key = "B" ]
				then
					highlight=2
				fi;;
			2)  #  SIGN OUT 
				if [ $key = "ENTER" ]
				then
					delete_record $id $pw
					sign_out_menu $highlight
					exit 0
				elif [ $key = "A" ]
				then
					highlight=1
				elif [ $key = "C" ]
				then
					highlight=3
				fi;;
			3)  #  EXIT 
				if [ $key = "ENTER" ]
				then
					sign_out_menu $highlight
					exit 0
				elif [ $key = "A" ]
				then
					highlight=1
				elif [ $key = "D" ]
				then
					highlight=2
				fi;;
		esac

		sign_out_menu $highlight
	done	
}

login_title_1p()
{
	echo -e "\n"
	echo '    _ ____    _     ___   ____ ___ _   _ '
	echo '   / |  _ \  | |   / _ \ / ___|_ _| \ | |'
	echo '   | | |_) | | |  | | | | |  _ | ||  \| |'
	echo '   | |  __/  | |__| |_| | |_| || || |\  |'
	echo '   |_|_|     |_____\___/ \____|___|_| \_|'
	echo -e "\n\n"
}

login_title_2p()
{
	echo -e "\n"
	echo ' ____  ____    _     ___   ____ ___ _   _ '
	echo '|___ \|  _ \  | |   / _ \ / ___|_ _| \ | |'
	echo '  __) | |_) | | |  | | | | |  _ | ||  \| |'
	echo ' / __/|  __/  | |__| |_| | |_| || || |\  |'
	echo '|_____|_|     |_____\___/ \____|___|_| \_|'
	echo -e "\n\n"
}

login_title()
{
	case $1 in
		1)
			login_title_1p;;
		2)
			login_title_2p;;
	esac
}

login_menu()
{
	number=$1

	case $number in
		0)
			echo -e "	   \c"
			print_button $id 20 "red"
			echo -e "\n"
			echo -e "	   \c"
			print_button $pw 20 "blue"
			echo -e "\n\n\n"
			echo -e "	 \c"
			print_button "LOGIN" 10 "blue"
			echo -e "	\c"
			print_button "EXIT" 10 "blue"
			echo -e "\n";;
		1)
			echo -e "	   \c"
			print_button $id 20 "blue"
			echo -e "\n"
			echo -e "	   \c"
			print_button $pw 20 "red"
			echo -e "\n\n\n"
			echo -e "	 \c"
			print_button "LOGIN" 10 "blue"
			echo -e "	\c"
			print_button "EXIT" 10 "blue"
			echo -e "\n";;
		2)
			echo -e "	   \c"
			print_button $id 20 "blue"
			echo -e "\n"
			echo -e "	   \c"
			print_button $pw 20 "blue"
			echo -e "\n\n\n"
			echo -e "	 \c"
			print_button "LOGIN" 10 "red"
			echo -e "	\c"
			print_button "EXIT" 10 "blue"
			echo -e "\n";;
		3)
			echo -e "	   \c"
			print_button $id 20 "blue"
			echo -e "\n"
			echo -e "	   \c"
			print_button $pw 20 "blue"
			echo -e "\n\n\n"
			echo -e "	 \c"
			print_button "LOGIN" 10 "blue"
			echo -e "	\c"
			print_button "EXIT" 10 "red"
			echo -e "\n";;
		*)
			echo -e "	   \c"
			print_button $id 20 "blue"
			echo -e "\n"
			echo -e "	   \c"
			print_button $pw 20 "blue"
			echo -e "\n\n\n"
			echo -e "	 \c"
			print_button "LOGIN" 10 "blue"
			echo -e "	\c"
			print_button "EXIT" 10 "blue"
			echo -e "\n";;
	esac
}

log_in()
{
	case $player in
		1)
			if [ -s "$1" ] && [ `head -1 "$1"` = "$1" ] && [ `head -2 "$1"|tail -1` = "$2" ]
			then
				idp1="$1"
				id="ID"
				pw="PW"
				islogin1="true"
				main
			else
				login_menu 2
				exit 0
			fi;;
		2)
			if [ "$1" != "$idp1" ]
			then
				if [ -s "$1" ] && [ `head -1 "$1"` = "$1" ] && [ `head -2 "$1"|tail -1` = "$2" ]
				then
					idp2="$1"
					id="ID"
					pw="PW"
					islogin="true"
					main
				fi
			fi
			join_menu 2
			exit 0;;
	esac
}

login_page()
{
	player=$1
	highlight=0
	clear
	login_title $player
	login_menu
	
	while true
	do
		user_input
		clear		
		login_title $player

		case $highlight in
			0)  #  ID
				if [ $key = "ENTER" ]
				then
					clear
					login_title $player
					login_menu $highlight
					info_input_mode "ID" "OUT"
					highlight=0
				elif [ $key = "B" ]
				then
					highlight=1
				else
					highlight=0
				fi;;
			1)  #  PW
				if [ $key = "ENTER" ]
				then
					clear
					login_title $player
					login_menu $highlight
					info_input_mode "PW" "OUT"
					highlight=1
				elif [ $key = "A" ]
				then
					highlight=0
				elif [ $key = "B" ]
				then
					highlight=2
				fi;;
			2)  #  LOGIN
				if [ $key = "ENTER" ] 
				then
					log_in $id $pw
				elif [ $key = "A" ]
				then
					highlight=1
				elif [ $key = "C" ]
				then
					highlight=3
				fi;;
			3)  #  EXIT
				if [ $key = "ENTER" ]
				then
					login_menu $highlight
					exit 0
				elif [ $key = "A" ]
				then
					highlight=1
				elif [ $key = "D" ]
				then
					highlight=2
				fi;;
		esac

		login_menu $highlight
	done
}

lobby_title()
{
	echo '	       _  _____  _    __  ____  __'
	echo '	      / \|_   _|/ \   \ \/ /\ \/ /'
	echo '	     / _ \ | | / _ \   \  /  \  / '
	echo '            / ___ \| |/ ___ \  /  \  /  \ '
	echo '           /_/   \_\_/_/   \_\/_/\_\/_/\_\'
	
	echo -e "\n"

	echo '             _     ___  ____  ______   __'
	echo '            | |   / _ \| __ )| __ ) \ / /'
	echo '            | |  | | | |  _ \|  _ \\ v / '
	echo '            | |__| |_| | |_) | |_) || |  '
	echo '            |_____\___/|____/|____/ |_|  '

	echo -e "\n"

	echo '     _ ____				 ____  ____  '
	echo '    / |  _ \				|___ \|  _ \ '
	echo '    | | |_) |				  __) | |_) |'
	echo '    | |  __/				 / __/|  __/ '
	echo '    |_|_|				|_____|_|    '

	echo -e "\n"
}

make_blank()
{
	text="$1"
	blank=`expr $2 - ${#text}`

	for ((i=0; i!=$blank; ++i))
	do
		echo -e " \c"
	done
}

lobby_menu()
{
	case $1 in
		0)
			echo -e "ID : $idp1\c"
			make_blank "$idp1" 31
			echo "ID : $idp2"

			echo -e "WIN : `head -3 $idp1|tail -1`\c"
			make_blank `head -3 $idp1|tail -1` 30
			echo "WIN : `head -3 $idp2|tail -1`"
			
			echo -e "LOSE : `tail -1 $idp1`\c"
			make_blank `tail -1 $idp1` 29
			echo "LOSE : `tail -1 $idp2`"
			echo -e "\n\n"

			echo -e "          \c"
			print_button "START" 9 "red"
			echo -e "          \c"
			print_button "EXIT" 10 "blue"
			echo -e "\n";;
		1)
			echo -e "ID : $idp1\c"
			make_blank "$idp1" 31
			echo "ID : $idp2"

			echo -e "WIN : `head -3 $idp1|tail -1`\c"
			make_blank `head -3 $idp1|tail -1` 30
			echo "WIN : `head -3 $idp2|tail -1`"
			
			echo -e "LOSE : `tail -1 $idp1`\c"
			make_blank `tail -1 $idp1` 29
			echo "LOSE : `tail -1 $idp2`"
			echo -e "\n\n"

			echo -e "          \c"
			print_button "START" 9 "blue"
			echo -e "          \c"
			print_button "EXIT" 10 "red"
			echo -e "\n";;
		*)
			echo -e "ID : $idp1\c"
			make_blank "$idp1" 31
			echo "ID : $idp2"

			echo -e "WIN : `head -3 $idp1|tail -1`\c"
			make_blank `head -3 $idp1|tail -1` 30
			echo "WIN : `head -3 $idp2|tail -1`"
			
			echo -e "LOSE : `tail -1 $idp1`\c"
			make_blank `tail -1 $idp1` 29
			echo "LOSE : `tail -1 $idp2`"
			echo -e "\n\n"

			echo -e "          \c"
			print_button "START" 9 "blue"
			echo -e "          \c"
			print_button "EXIT" 10 "blue"
			echo -e "\n";;
	esac
}

lobby_page()
{
	clear
	highlight=0
	lobby_title
	lobby_menu
	
	if [ $islogin1 = "false" ] || [ $islogin2 = "false" ]
	then
		exit 0
	fi

	while true
	do
		user_input
		clear
		lobby_title

		case $highlight in
			0)  #  START
				if [ $key = "ENTER" ]
				then
					map_select_page
				elif [ $key = "C" ]
				then
					highlight=1
				fi;;
			1)
				if [ $key = "ENTER" ]
				then
					lobby_menu 1
					exit 0
				elif [ $key = "D" ]
				then
					highlight=0
				fi;;
		esac

		lobby_menu $highlight
	done
}

map_select_title()
{
	echo '               _  _____  _     __  ____  __'
	echo '              / \|_   _|/ \    \ \/ /\ \/ /'
	echo '             / _ \ | | / _ \    \  /  \  / '
	echo '            / ___ \| |/ ___ \   /  \  /  \ '
	echo '           /_/   \_\_/_/   \_\ /_/\_\/_/\_\'
	
	echo ' __  __    _    ____    ____  _____ _     _____ ____ _____ '
	echo '|  \/  |  / \  |  _ \  / ___|| ____| |   | ____/ ___|_   _|'
	echo '| |\/| | / _ \ | |_) | \___ \|  _| | |   |  _|| |     | |  '
	echo '| |  | |/ ___ \|  __/   ___) | |___| |___| |__| |___  | |  '
	echo '|_|  |_/_/   \_\_|     |____/|_____|_____|_____\____| |_|  '

	echo -e "\n\n"
}

map_template_1()
{
	echo ' _______________ '
	echo '|_|_|_|_|_|_|_|_|'
	echo '|_|_|_|_|_|_|_|_|'
	echo '|_|_|_|_|_|_|_|_|'
	echo '|_|_|_|_|_|_|_|_|'
	echo '|_|_|_|_|_|_|_|_|'
	echo '|_|_|_|_|_|_|_|_|'
	echo '|_|_|_|_|_|_|_|_|'
	echo '|_|_|_|_|_|_|_|_|'
}

map_template_2()
{
	tput cup 13 36
	echo ' _______________ '
	tput cup 14 36
	echo '|_|_|_|_|_|_|_|_|'
	
	tput cup 15 36
	echo -e "|_|\c"
	print_button "_" 1 "yellow"
	echo -e "|_|_|_|_|\c"
	print_button "_" 1 "yellow"
	echo "|_|"

	tput cup 16 36
	echo -e "|_|_|\c"
	print_button "_" 1 "yellow"
	echo -e "|_|_|\c"
	print_button "_" 1 "yellow"
	echo "|_|_|"

	tput cup 17 36
	echo -e "|_|_|_|\c"
	print_button "_|_" 3 "yellow"
	echo "|_|_|_|"
	
	tput cup 18 36
	echo -e "|_|_|_|\c"
	print_button "_|_" 3 "yellow"
	echo "|_|_|_|"
	
	tput cup 19 36
	echo -e "|_|_|\c"
	print_button "_" 1 "yellow"
	echo -e "|_|_|\c"
	print_button "_" 1 "yellow"
	echo "|_|_|"
	
	tput cup 20 36
	echo -e "|_|\c"
	print_button "_" 1 "yellow"
	echo -e "|_|_|_|_|\c"
	print_button "_" 1 "yellow"
	echo "|_|"

	tput cup 21 36
	echo '|_|_|_|_|_|_|_|_|'
}

map_select_menu()
{
	map_template_1
	map_template_2

	case $1 in
	0)
		echo -e "\n  \c"
		print_button "MAP1" 12 "red"
		echo -e "                        \c"
		print_button "MAP2" 12 "blue"
		echo -e "\n";;
	1)
		echo -e "\n  \c"
		print_button "MAP1" 12 "blue"
		echo -e "                        \c"
		print_button "MAP2" 12 "red"
		echo -e "\n";;
	*)
		echo -e "\n  \c"
		print_button "MAP1" 12 "blue"
		echo -e "                        \c"
		print_button "MAP2" 12 "blue"
		echo -e "\n";;
	esac
}
map_select_page()
{
	clear
	highlight=0
	map_select_title
	map_select_menu

	while true
	do
		user_input
		clear
		map_select_title

		case $highlight in
			0)  #  MAP1
				if [ $key = "ENTER" ]
				then
					echo "map1 selected"
				elif [ $key = "C" ]
				then
					highlight=1
				else
					highlight=0
				fi;;
			1)  #  MAP2
				if [ $key = "ENTER" ]
				then
					echo "map2 selected"
				elif [ $key = "D" ]
				then
					highlight=0
				fi;;
		esac

		map_select_menu $highlight
	done
}

ingame_title()
{
	echo '           _  _____  _    __  ____  __'
	echo '          / \|_   _|/ \   \ \/ /\ \/ /'
	echo '         / _ \ | | / _ \   \  /  \  / '
	echo '        / ___ \| |/ ___ \  /  \  /  \ '
	echo '       /_/   \_\_/_/   \_\/_/\_\/_/\_\'
}

ingame_template_1()
{
	echo '       _______________________________ '
	echo '      |   |   |   |   |   |   |   |   |'
	echo '      |___|___|___|___|___|___|___|___|'
	echo '      |   |   |   |   |   |   |   |   |'
	echo '      |___|___|___|___|___|___|___|___|'
	echo '      |   |   |   |   |   |   |   |   |'
	echo '      |___|___|___|___|___|___|___|___|'
	echo '      |   |   |   |   |   |   |   |   |'
	echo '      |___|___|___|___|___|___|___|___|'
	echo '      |   |   |   |   |   |   |   |   |'
	echo '      |___|___|___|___|___|___|___|___|'
	echo '      |   |   |   |   |   |   |   |   |'
	echo '      |___|___|___|___|___|___|___|___|'
	echo '      |   |   |   |   |   |   |   |   |'
	echo '      |___|___|___|___|___|___|___|___|'
	echo '      |   |   |   |   |   |   |   |   |'
	echo '      |___|___|___|___|___|___|___|___|'
}

ingame_page_1()
{
	ingame_title
	echo -e "\n"
	ingame_template_1
	echo -e "\n"
	echo "1P : $scorep1                                 2P : $scorep2"
}

main()
{
	clear
	main_title
	main_menu

	while true
	do
		user_input
		clear
		main_title
	
		case $highlight in
			0)  #  1P LOGIN
				if [ $key = "ENTER" ]
				then
					login_page 1
				elif [ $key = "B" ]
				then
					highlight=2
				elif [ $key = "C" ]
				then
					highlight=1
				else
					highlight=0
				fi;;
			1)  #  SIGN IN
				if [ $key = "ENTER" ]
				then
					sign_in_page
				elif [ $key = "B" ]
				then
					highlight=3
				elif [ $key = "D" ]
				then
					highlight=0
				fi;;
			2)  #  2P LOGIN
				if [ $key = "ENTER" ]
				then
					login_page 2
				elif [ $key = "A" ]
				then
					highlight=0
				elif [ $key = "B" ]
				then
					highlight=4
				elif [ $key = "C" ]
				then
					highlight=3
				fi;;
			3)  #  SIGN OUT
				if [ $key = "ENTER" ]
				then
					sign_out_page
				elif [ $key = "A" ]
				then
					highlight=1
				elif [ $key = "B" ]
				then
					highlight=5
				elif [ $key = "D" ]
				then
					highlight=2
				fi;;
			4)  #  JOIN
				if [ $key = "ENTER" ]
				then
					if [ $islogin1 = "true" ] && [ $islogin2 = "true" ]
					then
						lobby_page
					else
						main_menu 4
						exit 0
					fi
				elif [ $key = "A" ]
				then
					highlight=2
				elif [ $key = "C" ]
				then
					highlight=5
				fi;;
			5)  #  EXIT
				if [ $key = "ENTER" ]
				then
					main_menu 5
					exit 0
				elif [ $key = "A" ]
				then
					highlight=3
				elif [ $key = "D" ]
				then
					highlight=4
				fi;;
		esac
	
		main_menu $highlight
	done
}

#lobby_page
#map_select_page
ingame_page_1

#  start main function
#main
