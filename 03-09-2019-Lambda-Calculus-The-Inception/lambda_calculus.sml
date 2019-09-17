datatype expr = v of string  (* variable *)
       | app of expr * expr  (*application *)
       | abs of string * expr (* abstraction *)

fun delete y [] = []
  | delete y  (x::xs) = if(y=x) then delete y xs
		        else x:: delete y xs
fun free (v x)= [x]
  | free (app (e1,e2))= (free e1) @ (free e2)
  | free (abs (x,e)) =delete x (free e) (*free: expr -> string list *)

fun bound (v x)=[]
  | bound (app (e1,e2)) = (bound e1) @ (bound e2)
  | bound (abs (x,e)) = x::(bound e)

fun subst (v y) x e1 = if(y=x)then e1
		       else v(y)
  | subst (app (e1,e2)) x e3 = (app ((subst e1 x e3) , (subst e2 x e3)))
  | subst (abs (y,e)) x e1 = if(y=x) then (abs (y, e))
			    else (abs(y,(subst e x e1)))
					     

			       
			    
	 
	 
