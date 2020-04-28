#! /usr/bin/env perl

use strict;
use warnings;
use feature 'say';

my $digit = shift;

sub f
{
   my $digit = shift;
   my $res;

   while (length $digit)
   {
      my $dg = $digit;
      for (1..length $digit)
      {
         $res++ unless $dg % 3;
         chop $dg;
      }
      $digit =~ s/^\d//;
   }

   return $res //= 0;
}

sub F
{
   my $res;
   for (10**($digit-1) .. 10**$digit-1)
   {
      $res++ unless f($_) % 3;
   }
   $res //= 0;

   return $res % 1_000_000_007;
}

say F;
