#! /usr/bin/env perl

# example from:
# https://perldoc.perl.org/perlpacktut.html

use v5.12;
use warnings;
use POSIX 'strftime';

my $tot_income;
my $tot_expend;

while (<DATA>)
{
   next if /^$/ or /^Date/;
   print;

   my ($date, $desc, $income, $expend) = unpack('A10xA27xA7xA*', $_);

   $tot_income += $income ||= 0;
   $tot_expend += $expend ||= 0;
}

$tot_income = sprintf('%.2f',   $tot_income);
$tot_expend = sprintf('%11.2f', $tot_expend); # right-align expenditure

my $date = POSIX::strftime('%m/%d/%Y', localtime);

say '-' x 58;
say pack('A11 A28 A8 A*', $date, 'Totals', $tot_income, $tot_expend);

__DATA__

Date      |Description                |Income |Expenditure
01/24/2001 Zed's Camel Emporium                    1147.99
01/28/2001 Flea spray                                24.99
01/29/2001 Camel rides to tourists     1235.00
