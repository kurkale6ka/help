my $prime;
my $i = 1;

for (3, 5 ... Inf) -> $p
{
   $i++ if $p.is-prime;
   if $i == 10_001
   {
      $prime = $p;
      last;
   }
}

say $prime;
