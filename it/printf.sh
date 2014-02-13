#! /usr/bin/env bash

Green="$(tput setaf 2)"
 Blue="$(tput setaf 4)"
Reset="$(tput sgr0)"

# %q - print the associated argument shell-quoted, reusable as input
# %d - print the associated argument as signed decimal number
# %s - interprets the associated argument literally as string

figlet -f smslant printf
echo

arr=('In addition to the standard')
arr+=('format specifications')
arr+=('described in printf(1)')
arr+=('and printf(3)')

printf "$Green# Min width 35 right align, pad with spaces$Reset\n"
printf "${Blue}printf '%%35s\\\n' \"\${arr[@]}\"$Reset\n"
printf '%35s\n' "${arr[@]}"
echo

# Note: no width (%s), results in left alignment
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
printf '%*s\n' 31 'Asus z87-pro'
