datatype Nat = O | S of Nat;

(* Nat is datatype we define and it says O is Nat type or S of Nat is also Nat *)

fun toInt O =0 | toInt (S x) = toInt x + 1;

(* toInt is definded Nat to int O mean 0 or  S x is x+1 *)



fun plus O y = y | plus (S x)  y = S(plus x y);

(* plus is defined as 0+ x =x or plus x+1 y = x + y + 1 => S (plus x y) *)




fun mul O y = O |mul (S x) y = plus(mul x y) y;

 (* mul is defined as o*y =0 or (x+1)*y = x*y + y=> plus (mul x y) y *)



fun pow O y = O 
|   pow y O   = S O
|   pow x (S y) = mul (pow x y) y;

toInt( mul(S(S(S O))) (S O) );
toInt(S O);


 (* pow is defined as 0^y=0 or y^0  =1  or pow x y+1  = (pow x y)*y  *) 
