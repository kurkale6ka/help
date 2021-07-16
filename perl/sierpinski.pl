#! /usr/bin/env perl

use v5.22;
use warnings;
use open qw/:std :encoding(UTF-8)/;
use Getopt::Long qw/GetOptions :config bundling/;
use File::Basename 'basename';
use utf8;

my $script = basename $0;
$script = -f $script ? "./$script" : $0 =~ s/$ENV{HOME}/~/r unless -l $0;

# Help
my $help = << "";
$script [options]
--char,  -c : default ▲
--order, -o : default 4

my $char = '▲';
my $order = 4;

# Options
GetOptions (
   'c|char=s'  => \$char,
   'o|order=i' => \$order,
   'h|help'    => sub { print $help; exit }
) or die "Error in command line arguments\n";

my @triangle = $char;

while ($order--)
{
   my $limit = $#triangle;
   for (0..$limit)
   {
      push @triangle, $triangle[$_] . ' ' x length ($triangle[$limit - $_]) . $triangle[$_]
   }
}

for (0..$#triangle)
{
   say ' ' x length($char) x ($#triangle - $_) . $triangle[$_]
}
