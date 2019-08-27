datatype 'a tree = nulltree
		 | node     of 'a tree * 'a * 'a tree
(* inorder: 'a tree -> 'a list *)
fun inorder nulltree        = []
  | inorder (node (l,k,r))  = inorder l  @ [k] @ inorder r
(* inorder traversal first print left then parent then right *)
(* preorder : 'a tree -> 'a list *)
fun preorder nulltree       = []
  | preorder (node (l,k,r)) = [k] @ preorder l @ preorder r
(* postorder : 'a tree -> 'a list *) 
fun postorder nulltree       = []
  | postorder (node (l,k,r)) = postorder r @ [k] @ postorder l

(* here @ is used for concinent of list *) 
	
