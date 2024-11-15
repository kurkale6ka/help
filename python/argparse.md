# nargs
```sh
parser.add_argument("--foo", nargs="?", const="c", default="d")
parser.parse_args(["--foo", "YY"]) # Namespace(foo="YY")
parser.parse_args(["--foo"])       # Namespace(foo="c")
parser.parse_args([])              # Namespace(foo="d")
```
