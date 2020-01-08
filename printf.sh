#! /usr/bin/env bash

Green="$(tput setaf 2 || tput AF 2)"
 Blue="$(tput setaf 69 || tput AF 69)"
Reset="$(tput sgr0 || tput me)"

figlet -f smslant printf
echo

# text used in the examples
arr=('In addition to the standard')
arr+=('format specifications')
arr+=('described in printf(1)')
arr+=('and printf(3)')

# examples
printf "$Green# Min width 35 right align, pad with spaces$Reset\n"
printf "${Blue}printf '%%35s\\\n' \"\${arr[@]}\"$Reset\n"
printf '%35s\n' "${arr[@]}"
echo

printf "$Green# Min width 35 left align, left align (no width means left aligned)$Reset\n"
printf "${Blue}printf '%%-35s%%s\\\n' \"\${arr[@]}\"$Reset\n"
printf '%-35s%s\n' "${arr[@]}"
echo

printf "$Green# Pad numbers with zeros$Reset\n"
printf "${Blue}printf '%%03d\\\n' 1 22 333$Reset\n"
printf '%03d\n' 1 22 333
echo

printf "$Green# \\\047 is the octal value of '\n"
printf "${Blue}printf '\\\047Quotes\\\047\\\n'$Reset\n"
printf '\047Quotes\047\n'
echo

printf "$Green# * refers to 31$Reset\n"
printf "${Blue}printf '%%*s\\\n' 31 'Asus z87-pro'$Reset\n"
printf '%*s\n\n' 31 'Asus z87-pro'

# formats
cat << 'FORMATS'
%q - print the associated argument shell-quoted, reusable as input
%d - print the associated argument as signed decimal number
%s - interprets the associated argument literally as string
FORMATS
