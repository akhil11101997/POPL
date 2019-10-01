signature SORT = sig
    type t
    val sort : t list -> t list
end

structure IntOrd : ORD_KEY = struct
type ord_key = int
fun compare (x,y)  = Int.compare(x,y)
end
         

functor QSort (O:ORD_KEY) : SORT = struct
type t = O.ord_key
fun foo x y = if(O.compare(x,y) = LESS) then false
        else true;

fun boo foo (y,(l1,l2,x)) = if (foo x y) then (y::l1,l2,x)
          else (l1,y::l2,x)

fun partition (x::xs) = foldr (boo foo) ([],[],x) (xs@[x])

fun first(x,_,_) = x
fun second(_,x,_) = x
          
                 
fun sort ([]) = [] 
  | sort (x::[]) = [x]
  | sort (xs) = (sort(first((partition xs)))) @ (sort(second((partition xs))));      
               
end

open IntOrd; 
structure ANew = QSort (IntOrd);
open ANew;

ANew.sort ([4,4,313,2324,35576,12,6,6,7,24]);
