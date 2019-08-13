datatype Nat = O | S of Nat;


fun iterate O f y = y
  | iterate (S x) f y =f (iterate x f y);
(* iterate is fn which iterate first input times and f is single argument fn and value given to f is third argument *)
fun toInt O =0
  | toInt (S x)= toInt x + 1;


fun plus x y = iterate x S y;
(*using iterate we are calculating plus plus is like x + y we can iterate either x time or y time and initial with y and x respectively *)

fun mul x y = iterate x (plus y) O;
(*  mul fn is like x*y=> y + (x-1)*y  and at last its 0*y =0 so f is plus y and initial argument is O  *)

fun pow O y = O
  | pow x O = S O
  | pow x (S y)  = iterate y (mul x) x;
(*  pow fn is like x^y => (x^y-1)*x so we iterate it y times and end is y=1 in which its x  *)
toInt(plus (S(S(S O))) (S(S(S(S O)))));
toInt( mul (S(S(S(S O)))) (S(S O)));
toInt( pow (S(S(S(S O)))) (S(S(S O))));

