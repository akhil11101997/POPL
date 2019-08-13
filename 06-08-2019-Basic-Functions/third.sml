datatype Nat = O | S of Nat;
fun plus O y = y | plus (S x)  y = S(plus x y);
fun mul O y = O | mul (S x) y = plus(mul x y) y;
