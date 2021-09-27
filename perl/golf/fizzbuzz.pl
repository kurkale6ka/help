for(1..100){$d=$_;$_%3||s/.+/Fizz/;$d%5||s/\d+|$/Buzz/;say}
say'Fizz'x!($_%3).Buzz x!($_%5)||$_ for 1..100
say+[Fizz]->[$_%3].(Buzz)[$_%5]||$_ for+1..1e2
say+(Fizz)[++$_%3].Buzz x/.?[05]$/||$_ until$`
say+(Fizz)[++$_%3].(Buzz)[$_%5]||$_ until/00/
map{say+(Fizz)[$_%3].(Buzz)[$_%5]||$_}1..1e2
say+(Fizz)[$_%3].(Buzz)[$_%5]||$_ for+1..1e2
say+(Fizz)[$_%3].Buzz x/0|5$/||$_ for 1..1e2
