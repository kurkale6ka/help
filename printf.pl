#! /usr/bin/env perl

use v5.12;
use warnings;
use List::Util 'pairs';
use Term::ANSIColor qw/:constants color/;

my $BLUE = color 'ansi69';

# figlet -f smslant
say << '';
             _      __  ___
   ___  ____(_)__  / /_/ _/
  / _ \/ __/ / _ \/ __/ _/
 / .__/_/ /_/_//_/\__/_/
/_/

# text used in the examples
my @lorem = split /\n/, << '';
In addition to the standard
format specifications
described in printf(1)
and printf(3)

select STDOUT;

# Right align
say GREEN, '# Min width 35 right align, pad with spaces';
say $BLUE, q/printf '%35s\n' "${arr[@]}"/, RESET;

$~ = 'RIGHT';
format RIGHT =
@>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>...
$_
.

write foreach @lorem;
print "\n";

# Left align
say GREEN, '# Min width 35 left align, left align (no width means left aligned)';
say $BLUE, q/printf '%-35s%s\n' "${arr[@]}"/, RESET;

$~ = 'LEFT';
format LEFT =
@<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<...@<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<...
$$_[0],                            $$_[1]
.

write foreach pairs @lorem;
print "\n";

# Pad numbers with zeros
say GREEN, '# Pad numbers with zeros';
say $BLUE, q/printf '%03d\n' 1 22 333/, RESET;

printf "%03d\n", $_ foreach qw/1 22 333/;
print "\n";

# Write quotes in octal
say GREEN, q/# \047 is the octal value of '/;
say $BLUE, q/printf '\047Quotes\047\n'/, RESET;

say "\047Quotes\047\n";

# Use * as a placeholder for the length
say GREEN, '# * refers to 31';
say $BLUE, q/printf '%*s\n' 31 'Asus z87-pro'/, RESET;

printf "%31s\n\n", 'Asus z87-pro';

# Formats
print << '';
%q - print the associated argument shell-quoted, reusable as input
%d - print the associated argument as signed decimal number
%s - interprets the associated argument literally as string
