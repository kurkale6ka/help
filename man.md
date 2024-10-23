# View local page
`man -l app.1`

# Groff
```bash
.RB [ \-b | # roman (normal text) / bold alternating => [ will be rendered as is, -b will be bold, | normal
.B Hello \fIWorld\fR # inline markup with \fX...\fR

# bullet points
.PD 0 # for no extra newlines
.IP \(bu 2
item1
.IP \(bu 2
item2
```
_Ref_: `man groff_man`

# Misc
```bash
LESS= man manpage # -F was the problem
nroff -man <(zcat /usr/share/man/man1/env.1.gz) | LESS= less
groff -man -Tascii <(zcat /usr/share/man/man1/env.1.gz) | LESS= less

man -M/Users/XXX/.fzf/man fzf
```
