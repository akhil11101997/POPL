(* defining datatype monotype *)
datatype monotype = var of string | basic of string | arrow of monotype*monotype

									
(*function checkingfree is to check free variable alpha in monotype  *)
fun checkingfree alpha (var beta) = ( alpha=beta )
  | checkingfree alpha (basic base) = false
  | checkingfree alpha (arrow (m1, m2)) = (checkingfree alpha m1) orelse (checkingfree alpha m2)

 (* geting key of map *)
structure keyofmap : ORD_KEY = struct
            type ord_key = string
            fun compare (str1, str2) = String.compare(str1, str2)
end
(* getting the map structure *)
structure Map = RedBlackMapFn (keyofmap)


(* function which substitutes the telescope content into the monotype given as a input, and return it after substituion *)

fun substitution tele (var alpha) = ( case (Map.find (tele, alpha)) of
				  SOME tau => substitution tele tau
				| NONE => var alpha
			)
       | substitution tele (basic base) = basic base
       | substitution tele (arrow (m1, m2)) = (
       	let
       		val m1tele = substitution tele m1
       		val m2tele = substitution tele m2
       	in
       		arrow(m1tele, m2tele)
       	end
       )
(* function twosubstitution takes two monotype and sunbstitute free var in a pair of monotypes using the telescope *)

fun twosubstitution tele (m1, m2) = (substitution tele m1, substitution tele m2)

exception UnableToUnify

(* function unifyList is to unify list *)

fun unifyList [] = Map.empty   (* if list is empty then nothing is there in telescope *)
  | unifyList ((mono1, mono2) :: mslist) = (
  	let
  		val tele1 = unify (mono1, mono2)
  		val mslist1 = List.map (twosubstitution tele1) mslist
  		val tele2 = unifyList mslist1
  	in
  		Map.unionWith (fn (u,v) => raise UnableToUnify) (tele1, tele2) (* if both telescope give different values to the same variables, then raise exception *)
  	end
  )


and unify (var alpha, var beta) = (
	if(alpha = beta) then Map.empty
		else Map.singleton (alpha, var beta)
	)
  | unify (var alpha, basic base) = Map.singleton (alpha, basic base)
  | unify (var alpha, arrow (m1, m2)) = (
  	if(((checkingfree alpha m1) orelse (checkingfree alpha m2)) = true) then raise UnableToUnify
  		else Map.singleton (alpha, arrow (m1,m2))
  )
  | unify (basic base, var alpha) = Map.singleton (alpha, basic base)  (* Unify a basic type and a variable *)
  | unify (basic base, basic v) = (                                  (* Unify two basic types *)
        if (base <> v) then raise UnableToUnify
            else Map.empty
   )
  | unify (basic base, arrow (m1, m2)) = raise UnableToUnify         (* Unify basic with arrow *)

  | unify (arrow (m1, m2), var alpha) = (                        (* Unify arrow with variable *)
        if (((checkingfree alpha m1) orelse (checkingfree alpha m2)) = true) then raise UnableToUnify
            else Map.singleton (alpha, arrow (m1, m2))
    )
  | unify (arrow (m1, m2), basic u) = raise UnableToUnify         (* Unify arrow with basic *)
  | unify (arrow (m1, m2), arrow (m1Prime, m2Prime)) = unifyList [(m1, m1Prime), (m2, m2Prime)]   (* Unify arrow with arrow *)


(* Verification *)
val tele = unifyList [(arrow (var "t1", var "t2"), arrow (arrow (var "t3", var "t4"), arrow (var "t4", var "t5")))]
val tele_list = Map.listItemsi tele
	
		


