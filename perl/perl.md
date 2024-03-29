* [use](#use)
* [Statement, expression](#statement)
* [Arrays and Lists](#arrays_lists)
    * [merge two arrays and keep elements unique](#arr_merge)
* [Hashes](#Hashes)
* [References](#References)
* [Scope](#Scope)
    * [environment variables](#scope_env)
* [Regex](#Regex)
    * [backreferences](#backreferences)
    * [captures in list context](#reg_captures)
    * [lookaround](#lookaround)
    * [match multilines and newlines in s///ms](#reg_newlines)
    * [possessive quantifiers](#reg_possessive)
* [Subroutines](#Subroutines)
    * [ternary operator - cond ? true : false](#sub_ternary)
    * [printf is sometimes more readable than print](#sub_printf)
    * [sprintf is like printf but a string is returned instead of printed](#sub_sprintf)
    * [date with format](#sub_date)
    * [pack](pack.pl)
    * [evaluation in s//$1/](#sub_s_eval)
    * [return values](#sub_return)
* [Command line](#cmd_line)
    * [sed](#sed)
    * [use a module](#use_module)
    * [one liners](#one_l)
        * [delete lines](#one_l_delete)
        * [search and replace in multiple files in parallel](#one_l_replace)
        * [print from field $3 to last](#one_l_fields)
        * [regex based sort](#one_l_sort)
        * [replace line(s) with contents of file](#authorized_keys)
        * [namei -l](#one_l_namei)
        * [disk usage pretty](#one_l_du)
        * [find files older than a day](#one_l_find)
        * [PerlIO: convert from dos/cyrillic to unix/utf8](#perlio)
* [Precedence](#Precedence)
* [Unicode](#Unicode)
* [Exceptions](#Exceptions)
* [Traps](#Traps)
* [Documentation](#Documentation)
* [Modules](#Modules)
* [End of the program](#end)

# use

```perl
use v5.10 # say, state, //, -r -w (-r $file && -w _)
use v5.12 # use strict, ...
use v5.14 # s///r
use v5.16 # fc
use v5.20 # postderef
use v5.22 # regex modifier /n
use v5.26 # <<~
use v5.32 # chained comparisons
```

# Statement, expression <a name="statement"></a>

```perl
 statement -> code
expression -> code that returns a value
```

# Arrays and Lists <a name="arrays_lists"></a>

`,` creates lists. `()` is only necessary if precedence is ambiguous.

```perl
=> (fat coma) is the same as ,
      foreach is the same as for
```

```perl
@items = qw/one two three four five/ # quote words into a list ('', '', ...)

if (@items) # number of elements

@items[1..$#items] # slice: all bar 1st

          my $a = @array # last to $a in scalar context, see coma operator
        my ($a) = @array #  1st to $a in list   context
my ($a, $b, $c) = @array # multiple assignments

splice @items,  0,  2            # remove beginning  :         three four five | ~shift
splice @items,  1, -1            # remove   middle   : one                five |
splice @items, -2                # remove       end  : one two three           | ~pop
splice @items,  1,  3, qw/2 3 4/ # remove & REPLACE  : one 2   3     4    five |
splice @items,  2,  0, qw/2 3/   # remove 0 (INSERT) : one two three four five |
#                                                             '- 2 3

shift, unshift, pop and push # special cases of splice

 map expr, @items # modify - comprehension
grep expr, @items # filter - like @list =~ /match/ but check ~~ for this

print @items   # $, - print's field separator; $\ is the record separator only printed after print's last argument
print "@items" # $" - list separator for interpolation
```

## merge two arrays and keep elements unique <a name="arr_merge"></a>

```perl
my @unique = uniq(@array1, @array2);        # 1. use List::Util 'uniq';
my @merged{@array1, @array2} = ();          # 2.
my %merged = map { $_, 1 } @array1, @rray2; # 3. create (key:$_, val:1) list for each item
```

methods 2. and 3. need this:
```perl
my @unique = keys %merged;
```

# Hashes

```perl
%items = @pairs;

%items = (
   key1 => 'val1', # keys auto quoted (same for $items{key1})
   key2 => 'val2'
);

while (my ($key, $val) = each %items)
```

# References

```perl
$ref = \$named_variable;      # \@, \%
$ref = [qw/anonymous array/]; # mnemo: []s access array elements
$ref = {anonymous => 'hash'}; #        {}s access hash elements
```

```perl
                use {$ref} anywhere an array/hash would be used ({}s are optional)
               /
     %hash | %$ref      | $ref->%*
    @array | @$ref      | $ref->@*
$hash{key} | $$ref{key} | $ref->{key}
 $array[3] | $$ref[3]   | $ref->[3]
                              /
                 optional between 2 subscripts:

([...], [..x], [...]) - $$array[1][2]   <=>
                         $array[1]->[2] <=>
                         $array[1][2]       {}{} for hashes
```

# Scope

```perl
   my - lexical scope
  our - same but alias for package var so can be accessed from outside
local - local copy of a global variable
```

_example_: input record separator aka IFS
```perl
local $/ = "\0"; # read null separated records
local $/;        # slurp file mode
local $/ = '';   # paragraph mode
```

## environment variables <a name="scope_env"></a>
```perl
         private | public (inherited by children)
      -----------+--------------
Perl: my $EDITOR | $ENV{EDITOR}
Bash:     EDITOR | export EDITOR -> $ env # see public
                                    $ set # see all
```

# Regex

[Perl regex REPL](https://github.com/kurkale6ka/scripts/blob/master/rrepl.pl)

zero-width assertions don't consume chars => they are **AND**ed
```perl
hello(?=\d)(?!123) # followed by a number AND not followed by 123
```

`/$var/o` - check `$var` only once since we know it's not going to change

```perl
  pre - $`
match - $&
 post - $'
```

## backreferences
```perl
s/(\d+).\1/...$1/; # \1 and $1 represent the actual match, not \d+
```

## captures in list context <a name="reg_captures"></a>
```perl
my ($ext) = $file =~ /\.(\w{3})/;
my @numbers = $version =~ /\d+/g; # progressive matching
```

## lookaround
```perl
        \K
(?<= ... ) --- (?= ... )
(?<! ... ) --- (?! ... )
```

:warning: `.+(?=bla)` (variable length pattern) is a bad idea as lookahead is of zero-width so `.+` consumes everything!

## multilines and newlines in s///ms <a name="reg_newlines"></a>
```perl
# ^ and $ positions: hello$\n^alien$\n^world, beware of $\ or $. which are special variables!
$_ = qq/hello\nalien\nworld\n/;
s/^.+$/---/m;  # multilines: match ^ and $ many times
s/lo.+wo/@@/s; # pretend $msg is a single line => . matches anything, including \ns
```

## possessive quantifiers <a name="reg_possessive"></a>
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

[FMTEYEWTK on Prototypes in Perl](https://groups.google.com/g/comp.lang.perl.modules/c/SVhwH2tRVaM/m/WwgB6-VNSIQJ)

```perl
# takes a scalar, and a 2nd optional one
sub get ($;$) {
   my $var = shift; # or my ($var1, $var2) = @_;
   wantarray ? @res : $res;
}
```

## ternary operator - cond ? true : false <a name="sub_ternary"></a>
```perl
printf "I've got %d camel%s", $ARGV[0], $ARGV[0] == 1 ? '' : 's';
```

## printf is sometimes more readable than print <a name="sub_printf"></a>
```perl
print 'Found a ', pos($i), "at\n";
printf "Found a %d at\n", pos($i);
```

## sprintf is like printf but a string is returned instead of printed <a name="sub_sprintf"></a>
it can then be passed to functions such as `say` which lack formatting capabilities.

## date with format <a name="sub_date"></a>
```perl
strftime '%d-%b-%Y_%Hh%M:%S', localtime; # POSIX module
$now->strftime($format);                 # Time::Piece->new
```

## pack
[pack](pack.pl)

## evaluation in s//$1/ <a name="sub_s_eval"></a>
```perl
$add = 4 + 3;
$_ = 'Sum: $add';
s/(\$\w+)/$1/ee;
```
```perl
without /e -> "" interpolation
   with /e -> normal code:
              $1 gets 'interpolated' by the first /e,
              it's value (4 + 3) gets evaluated by the second /e!
```

## return values <a name="sub_return"></a>

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

# Command line <a name="cmd_line"></a>

```perl
perl -n # while (<>) { ...        } read           lines from files, add -l for chomp
perl -p # while (<>) { ...; print } read and print lines from files

-a implies -n
-F implies -an

perl -00   # paragraph  mode
perl -0777 # file slurp mode

# to match newlines we need 'slurp' and //s
# use print $1 because $& would be the whole file
# 'while //sg' could be replaced with 'if //ms' when matching with ^ and/or $
perl -0777 -lne 'print $1 while /(---)/sg' file
```

## sed

```perl
perl -lpe 's///' file

perl [-i(suffix)] -lp[0]e 's///' file
        \              \
         \              read null separated data
          edit in place
```

## use a module <a name="use_module"></a>
```perl
perl -M'Term::ANSIColor ":constants"' -E 'say YELLOW.Hello'
perl -mTerm::ANSIColor=:constants -E 'say YELLOW.Hello'
```

## one liners <a name="one_l"></a>

### delete lines <a name="one_l_delete"></a>
```perl
perl -i -lnE 'say unless /.../ or /.../' file
```

### search and replace in multiple files in parallel <a name="one_l_replace"></a>
```perl
rg -il mem | parallel -q perl -i -lpe 's/mem/Memory/ig'
```

### print from field $3 to last <a name="one_l_fields"></a>
```perl
perl -lane 'print "@F[2..$#F]"' /my/file
```

### regex based sort <a name="one_l_sort"></a>
```perl
perl -e 'print for sort {@m=map/(\d\.\d)/,$b,$a; pop@m<=>pop@m} <>' /my/file
perl -e 'print for sort {(split" ",$a)[1]<=>(split" ",$b)[1]} <>' /my/file # sort on 2nd field
```

### replace line(s) with contents of file <a name="authorized_keys"></a>
```perl
perl -i -lnE '$name=...; $_=`cat ~/keys/$name` if /$name/; chomp; say' authorized_keys
```

### namei -l <a name="one_l_namei"></a>
```perl
perl -e '$_=shift; push @paths, $`.$& while m{.*?/(?!$)}g; exec qw/ls -lhd/, @paths, $_' /my/file
```

### disk usage pretty <a name="one_l_du"></a>
```perl
du -ah0 -t100m -d1 | sort -hrz | perl -0lane 's:^\./:: for @F; print shift @F, " ", `ls -d --color "@F"`'
```

### find files older than a day <a name="one_l_find"></a>
```perl
perl -E 'for(<*>){say if-M>1}'
```

### PerlIO: convert from dos/cyrillic to unix/utf8 <a name="perlio"></a>
```perl
perl -Mopen=':std,IN,crlf:encoding(cp1251),OUT,unix:encoding(utf8)' -lpe '' star_wars.sub > star_wars.srt
```

# Precedence

`or`, `and` are the same as  
`||`, `&&` but with lower precedence

# Unicode
```perl
use utf8;                           # write Unicode characters in your source code
use Encode 'decode';                # process @ARGV in utf8 (perl -CA can also be used)
use open qw/:std :encoding(UTF-8)/; # Unicode with IO filehandles, e.g `say '零'`
```

# Exceptions

try, catch is:
```perl
   eval BLOCK;
if ($@) BLOCK
```

# Traps

always `chomp` after: `system`, backticks, `open`, `<STDIN>`

---

`glob`, `<*>` is safe for word splitting,  
it's arguments only split on whitespace, not the returned files!  
solutions: `<"">`, `glob '""'`, or **best** to completely avoid the shell:

```perl
opendir my $DIR, '.' or die "$!\n";
my @dotfiles = grep { -f and /^\./ } readdir $DIR;
```

---

use `open`, `system`, ... with 3 args `'-|', ...` to:
- be protected against clobbering, code exe, ... (`>`, `|`, ... in `$filename`)
- avoid spawning a shell

---

```perl
die "exception"; # without a newline, the script line number is appended
```

---

```perl
if (`lsof ...`)
vs
if (system('lsof', ...) == 0)
```
because  
`% lsof +D folder` 'always' sets `$?` to 1, `man lsof` (DIAGNOSTICS)

---

do not use `-X` file tests because of race conditions  

_example_: just use
```perl
`cat $file`
vs
`cat $file` if -f $file;
```

---

`each` and `//g` return boolean so use `while` instead of `for`:  
```perl
while (each %hash)
while (//g)
```

---

use
```perl
@backups[0 .. $#backups - 3]
vs
@backups[0 .. -3]
```
because `..` counts up only

---

```perl
100 %  3 =  1 (100 - 3 * 33 = 99)
100 % -3 = -2 (100 - 3 * 34 = 102 <=> 100 % 3 - 3) # => it's either 0 or negative
```

# Documentation

[Easier access to Perl help topics](https://github.com/kurkale6ka/scripts/blob/master/man.pl)

```perl
perldoc perl
perldoc perldoc
perldoc perlop
perldoc perlrun # command line options
perldoc File::Basename
perldoc -f split
perldoc -f -x # file test operators
```

* [Perl Training Australia - Perl Tips](http://perltraining.com.au/tips)
* [Learn Perl in about 2 hours 30 minutes](https://qntm.org/perl_en)
* [perlsecret](https://metacpan.org/dist/perlsecret/view/lib/perlsecret.pod)
* [Have fun with code golf](https://code.golf/)

# Modules

```perl
use warnings;
use diagnostics;
use Getopt::Long 'GetOptions';
use File::Basename 'basename';
use File::Path 'make_path';
use Term::ANSIColor ':constants';
use List::Util 'any';
```

# End of the program <a name="end"></a>

`__END__` or `__DATA__`

* POD
* _comments_
* data that we want to process with `while (<DATA>)`
