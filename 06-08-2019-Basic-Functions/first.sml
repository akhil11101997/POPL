fun curry f x y z = f(x,y,z);
(* val  f is fn: (('a*'b)*'c)->'d and val  curry is fn : ('a *'b *'c->'d)->('a->'b->'c->'d) *)

fun uncurry f (x,y,z) = f x y z;
(* val  f is fn : 'a->'b->'c->'d and val uncurry is fn :   ('a->'b->'c->'d)->('a *'b *'c->'d) *)
