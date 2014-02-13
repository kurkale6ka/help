#! /usr/bin/env bash

Green="$(tput setaf 2)"
 Blue="$(tput setaf 4)"
Reset="$(tput sgr0)"

# %q - print the associated argument shell-quoted, reusable as input
# %d - print the associated argument as signed decimal number
# %s - interprets the associated argument literally as string

arr=('In addition to the standard')
arr+=('format specifications')
arr+=('described in printf(1)')
arr+=('and printf(3)')

# note: no width results in left alignment
printf "$Green# Min width 35 right align, pad with spaces$Reset\n"
printf "${Blue}printf '%%35s\\\n' \"\${arr[@]}\"$Reset\n"
printf '%35s\n' "${arr[@]}"
echo

printf "$Green# Min width 35 left align, left align$Reset\n"
printf "${Blue}printf '%%-35s%%s\\\n' \"\${arr[@]}\"$Reset\n"
printf '%-35s%s\n' "${arr[@]}"
echo

printf "$Green# Pad a number with zeros$Reset\n"
printf "${Blue}printf '%%05d\\\n' 11$Reset\n"
printf '%05d\n' 11
echo

printf "$Green# \\\047 is the octal value of '\n"
printf "${Blue}printf '\\\047Quotes\\\047\\\n'$Reset\n"
printf '\047Quotes\047\n'
echo

printf "$Green# * refers to 31$Reset\n"
printf "${Blue}printf '%%*s\\\n' 31 'Asus z87-pro'$Reset\n"
printf '%*s\n' 31 'Asus z87-pro'
