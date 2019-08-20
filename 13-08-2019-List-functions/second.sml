fun map f(x::xs) = f x :: map f xs
  | map f [] = [];
  (* map:('a->'b)->'a list->'b list *)
  (* it is like map is function which applies f on all elements of list *)