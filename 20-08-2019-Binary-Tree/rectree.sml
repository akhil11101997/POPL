datatype 'a tree = nulltree
		 | Node of 'a tree * 'a * 'a tree
(* nulltree: 'a tree
   Node: 'a tree * 'a * 'a tree -> 'a tree
 *)
(* rectree: 'b -> ('b * 'a * 'b)-> 'a tree -> 'b
 *)
fun rectree N C nulltree = N
  | rectree N C (Node (l,d,r)) = C(rectree N C l, d, rectree N C r)

fun rotate (Node (Node (l,d,r), data, right))
    = Node (l, d,  Node (r, data, right))
  | rotate x = x
