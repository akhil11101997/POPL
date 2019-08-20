fun  foldr f(x::xs) y = f x (foldr f xs y)
  |  foldr f [] y = y;

fun foldl g y (x::xs) = foldl g (g y x) (xs)
  | foldl g y [] =y; 
