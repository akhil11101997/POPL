(*
    SORT
    - Signature of a structure which would contain a type t
    and a sort function which sorts a list which contains
    elements of type t
*)
signature SORT = sig
    type t
    val sort : t list -> t list
end

(*
    ORD_KEY
    - Signature of a structure which contains a type ord_key
    and a comparater function over this type
*)
signature ORD_KEY = sig

    type ord_key
    val compare : ord_key * ord_key -> order

end

(*
    QSort
    - A functor which takes as input a structure of type
    ORD_KEY and outputs a structure of type SORT
    - It builds a sorting function for lists having 
    elements of type specified by the input structure
*)
functor QSort (O : ORD_KEY) : SORT = struct 

    type t = O.ord_key

    (*
        Get all elements of a list which are less than or
        equal to y using the comparator function
    *)
    fun getLessEqual [] y = []
        | getLessEqual (x :: xs) y = (
            if(O.compare (x, y) = GREATER) then getLessEqual xs y
                else x :: getLessEqual xs y
        )
    
    (*
        Get all elements of a list which are greater than
        y using the comparator function
    *)
    fun getGreater [] y = []
        | getGreater (x :: xs) y = (
            if(O.compare (x, y) = GREATER) then x :: getGreater xs y
                else getGreater xs y
        )
    
    (*
        - Using starting element as pivot, break the list
        into 2 parts -> one with elements less than or equal
        and other with elements greater
        - Then Sort them individually and concatenate them
        in the correct order
    *)
    fun sort [] = []
        | sort (x :: xs) = (sort (getLessEqual xs x)) @ [x] @ (sort (getGreater xs x))
    
end

(*
    Building a structure of type ORD_KEY using int
    as type and Int.compare as the comparator
    function
*)
structure IntOrd : ORD_KEY = struct

    type ord_key = int
    fun compare (x, y) = Int.compare (x, y)

end

(*
    Building a structure for sorting int lists
    using a structure 'IntOrd' which contains
    the required elements
*)
structure intSort = QSort (IntOrd)

(* Testing the Sorting Function *)
val arr = [1, 5, 12, ~4, ~40, 100, 0, 12, 20, 30, ~17, 10]
val ans = intSort.sort arr
