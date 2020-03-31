#! /usr/bin/env perl6

sub lcm
{
   my ($x, $y) = @_;
   return $x * $y / $x gcd $y;
}

[lcm](1..20).say;
