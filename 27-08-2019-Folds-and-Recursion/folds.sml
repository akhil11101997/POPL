datatype 'a option = NONE
		   | SOME of 'a



(*
val bar = fn : ('a -> bool) -> 'a * ('a list * 'a list) -> 'a list * 'a list
val partition = fn : ('a -> bool) -> 'a list -> 'a list * 'a list
*)

fun bar f (x,(y,z)) = if (f x) then (x::y,z) else (y,x::z)
						    
fun partition f l = List.foldr (bar f) ([],[]) l


(* 
val foobar = fn : ('a -> 'b) -> 'a * 'b list -> 'b list
val map = fn : ('a -> 'b) -> 'a list -> 'b list
*)

fun foobar f (x,y) = ((f x)::y)
		       
fun map f l = List.foldr (foobar f) [] l


(*
val barfoo = fn : 'a * 'a list -> 'a list
val reverse = fn : 'a list -> 'a list
*)

fun barfoo (x,y) = x::y
			
fun reverse l = List.foldl barfoo [] l


(*
val nth = fn : 'a list -> int -> 'a option
val funct = fn : 'a * (int * 'a option) -> int * 'a option
val funct1 = fn : 'a * 'b -> 'b
*)

fun funct (y,(~1,x)) = (~1,x)
  | funct (y,(n,x))  = (n-1,SOME y)
			   
fun funct1 (_,y)=y
		       
fun nth l n = if (List.length(l)>n andalso n >= 0) then  funct1 (List.foldl funct (n,NONE) l)
              else NONE

