#! /usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use List::Util 'max';

sub trial_division
{
   my $num = shift;
   my @factors;

   until ($num % 2)
   {
      push @factors, 2;
      $num /= 2;
   }

   my $factor = 3;

   while ($factor ** 2 <= $num)
   {
      unless ($num % $factor)
      {
         push @factors, $factor;
         $num /= $factor;
      } else {
         $factor += 2;
      }
   }

   push @factors, $num unless $num == 1;

   say max @factors;
}

trial_division shift;
