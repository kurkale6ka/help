# Statement, expression

```
 statement -> code
expression -> code that returns a value
```

# Arrays

`,` creates lists. `()` is only necessary if precedence is ambiguous.

```
=> (fat coma) is the same as ,
      foreach is the same as for
```

```perl
@items = qw/one two three/; # quote words into a list ('', '', ...)

if (@items > ...) # number of elements

@items[1..$#items] # slice: all bar 1st

          my $a = @array; # last to $a in scalar context, see coma operator
        my ($a) = @array; #  1st to $a in list   context
my ($a, $b, $c) = @array; # multiple assignements

  shift, pop  # shorten by 1 element which is then returned
unshift, push # add elements and report how many

 map expr, @items; # modify - comprehension
grep expr, @items; # filter - like @list =~ /match/ but check ~~ for this

print @items   # $, - print's field separator; $\ is the record separator only printed after print's last argument
print "@items" # $" - list separator for interpolation
```

## merge two arrays and keep elements unique

```perl
my @unique = uniq(@array1, @array2);        # 1. use List::Util 'uniq'
my @merged{@array1, @array2} = ();          # 2.
my %merged = map { $_, 1 } @array1, @rray2; # 3. create (key:$_, val:1) list for each item
```

methods 2. and 3. need this:
```perl
my @unique = keys %merged;
```

# Hashes

```perl
%items = ('key1', 'val1', 'key2', 'val2');

%items = (
   key1 => 'val1', # keys auto quoted (same for $items{key1})
   key2 => 'val2'
);

... while my ($key, $val) = each %items;
```

# References

```perl
$ref = \$named_variable; # also \@, \%
$ref = [anonymous_array]; # same brackets as for accessing elements
$ref = {anonymous_hash};
```

```
                use {$ref} anywhere an array/hash would be used ({}s are optional)
               /
     %hash | %$ref      | $ref->%*
    @array | @$ref      | $ref->@*
$hash{key} | $$ref{key} | $ref->{key}
 $array[3] | $$ref[3]   | $ref->[3]
                              /
                 otional between 2 subscripts:

([...], [..x], [...]) - $$array[1][2]   <=>
                         $array[1]->[2] <=>
                         $array[1][2]       {}{} for hashes
```

# Scope

```
   my - lexical scope
  our - same but alias for package var so can be accessed from outside
local - local copy of a global variable
```

ex: input record separator aka IFS
```perl
local $/;      # slurp file mode, perl -0777
local $/ = ''; # paragraph mode,  perl -00
```

## environment
```
      private  public (parent environment inherited by children)
perl: my $var, $ENV{var}
bash:     var, export var - set: see all
                            env: see public only
```

# Regex

zero-width assertions don't consume chars => they are **AND**ed
```perl
hello(?=\d)(?!123) # followed by a number AND not followed by 123
```

## backreferences
```perl
s/(\d+).\1/...$1/; # \1 and $1 represent the actual match, not \d+
```

## match multilines and newlines in s///ms
```perl
$_ = qq/hello\nalien\nworld\n/;
s/^.+$/---/m;  # multilines: match ^ and $ many times
s/lo.+wo/@@/s; # pretend $msg is a single line => . matches anything, including \ns
```

`/o` - check `$var` in pattern only once since we know it's not going to change

```
  pre - $`
match - $&
 post - $'
```

## captures in list context
```perl
my ($ext) = $file =~ /\.(\w{3})/;
my @numbers = $version =~ /\d+/g; # progressive matching
```

## possessive quantifiers
no backtracking <=> don't give up characters

`A++` is syntactic sugar for atomic group notation: `(?>A+)`

_example_:

`"abcd =~ "[^"]+"`  
after matching `"abcd`, it's clear that no backtracking will change the fact that  
a final `"` cannot be matched. Thus, in order to speedup failure, the pattern is  
better rewritten as `"[^"]++"`  

_notes_:
* `"abcd" =~ "[^"]++"` still matches.
* the optimizer would've automatically turned the regex possessive in this simple case.

# Subroutines

```perl
sub get {
   my $var = shift;
   # or my ($var1, $var2) = @_;
   wantarray ? @res : $res;
}
```

## ternary operator
```perl
printf "I've got %d camel%s", $ARGV[0], $ARGV[0] == 1 ? '' : 's';
```

## printf is sometimes more readable than print
```perl
print 'Found a ', pos($i), "at\n";
printf "Found a %d at\n", pos($i);
```

## sprintf is like printf but a string is returned instead of printed
it can then be passed to functions such as '`say`' which lack formatting capabilities.

## date with format
```perl
strftime '%d-%b-%Y_%Hh%M:%S', localtime; # POSIX module
$now->strftime($format);                 # Time::Piece->new
```

## evaluation in s//$1/
```perl
$add = 4 + 3;
$_ = 'Sum: $add';
s/(\$\w+)/$1/ee;
```
```
without /e -> "" interpolation
   with /e -> normal code:
              $1 gets 'interpolated' by the first /e,
              it's value (4 + 3) gets evaluated by the second /e!
```

## return values

```perl
              s/// - number of substitutions
             chomp - number of chars
              grep - list
               map - list
if (my $var = ...) - lvalue, not boolean
   each %hash, //g - boolean
        shift, pop - element
     unshift, push - number of elements
```

# Command line

```
-a implies -n
-F implies -an

perl -p: read every line -- process -- print every line
perl -n: read every line -- process
                            & explicitly print when we need
```

## one liners

### search and replace
```perl
% perl -pi -e 's/#(max_locks_per_transaction) = \d+/$1 = 128/' postgresql.conf
```

### print from $3 to end
```perl
% perl -laE 'say "@F[2..$#F]"' file
```

### namei -l
```perl
% perl -e '$_=shift; push @paths, $`.$& while m{.*?/(?!$)}g; system qq/ls -ld "$_"/ for @paths, $_' /path/to/file
```

### disk usage pretty report
```perl
% du -ah0 -t100m -d1 | sort -hrz | perl -0lane 's:^\./:: for @F; print shift @F, " ", `ls -d --color "@F"`'
```

# Precedence

`or`, `and` are the same as  
`||`, `&&` but with lower precedence

# Errors

try, catch is:
```
eval BLOCK
if ($@) BLOCK
```

# Traps

always chomp with: ```backticks`, system, open, <STDIN>, perl -l[np]``

---

`glob`, `<*>` is safe for word splitting,  
it's arguments only split on whitespace, not the returned files!  
solutions: `<"">`, `glob '""'`

use `open`, `system`, ... with 3 args `'-|', ...` to:
- be protected against clobbering, code exe, ... (`>`, `|`, ... in `$filename`)
- avoid spawning a shell

```perl
die "exception"; # without a newline, the script line number is appended
```

``if (`lsof ...`)``  
vs  
`if (system('lsof', ...) == 0)`  
because `lsof +D folder` sets `$?` to 1 always

do not use `-X` file tests because of race conditions  
ex: just use `````cat $file````` vs ```cat $file` if -f $file;``

`each` and `//g` return boolean so use `while` vs `for`:  
```perl
while (each %hash)
while (//g)
```

use `@backups[0 .. $#backups - 3]` vs `@backups[0 .. -3]` because `..` counts up only

# Documentation

```perl
perldoc perl
perldoc perldoc
perldoc perlop
perldoc perlrun # command line options
perldoc File::Basename
perldoc -f split
perldoc -f -x # file test operators
```

[Perl Training Australia - Perl Tips](http://perltraining.com.au/tips)

# Modules

```perl
use strict;
use warnings;
use feature 'say';
use Getopt::Long 'GetOptions';
use File::Basename 'basename';
use File::Path 'make_path';
use Term::ANSIColor ':constants';
use List::Util 'any';
```

# End of the program

`__END__` or `__DATA__`

* POD
* comments
* data that we want to process with while (`<DATA>`)
