instance Functor (Either a) where    -- Either a has nothing to do with currying, it is simple substitution
    fmap f (Right x) = Right (f x)   -- Right is usually used for the result
    fmap f (Left x) = Left x         -- Left is usually used for the error

:t fmap
Functor f => (x -> y) -> f x -> f y

So we would have ... (x -> y) -> Either a x -> Either a y
                                 --------      --------
To match Either type1 type2,         \            /
  we use Right x                     Left unchanged
     and Left x

--------------------------------------------------------------------------------

Functions are functors
                     g
instance Functor ((->) r) where
    fmap f g = (\x -> f (g x))
          g x         f (g x)
OR
    fmap = (.), so f . g is the same as fmap f g

a -> b is a type, the type of a function =>
(->) a is a type constructor expecting one parameter only

Resemblances: [2,11,..] :: [Int]
              Just 'a'  :: Maybe Char
              g 2.3     :: r -> Float
