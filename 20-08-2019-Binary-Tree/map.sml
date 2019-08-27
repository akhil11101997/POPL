datatype 'a tree = nulltree
		 | node of 'a tree * 'a * 'a tree
(* 'a tree datatype is nulltree or node of 'a tree and 'a and 'a tree *)

    (* map: ('a->'b) -> 'a tree -> 'b tree *)

fun map f nulltree       = nulltree
  | map f (node (l,k,r)) = node (map f l , f k , map f r)
(* here we apply f on all elements of 'a tree on key *)
					 
