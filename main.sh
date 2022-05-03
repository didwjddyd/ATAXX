#!/bin/bash

BlueBackground()
{
	echo -e [44m"   $1   "[0m"\c"
}

MenuLine()
{
	BlueBackground "$1"
	echo -e "                \c"
	BlueBackground "$2"
	echo
}

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
MenuLine JOIN "SIGN IN"
echo -e "\n"
MenuLine EXIT "SIGN OUT"
echo -e "\n"
