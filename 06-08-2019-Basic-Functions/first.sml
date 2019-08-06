fun curry f x y z = f(x,y,z);
(*

1.  curry is takes uncurry fn and return curry fn.

2.

	domain: ('a * 'b * 'c)->'d.
	range: 'a->'b->'c->'d.
3.	fun curry f = _____:'a->'b->'c->'d
	fun curry f x = ___:'b->'c->'d
	fun curry f x y z = ___:'d
	
	about f:('a * 'b * 'c) -> 'd 
	so,
	fun curry f x y z = f(x,y,z)

	


*)

fun uncurry f (x,y,z) = f x y z;
(* 


1.
	uncurry:
		domain: 'a->'b->'c->'d
		range: 'a *'b *'c->'d

2.
	uncurry is fn which takes curry fn and return uncurry fn.

3.
	f is fn : 'a->'b->'c->'d 

4.
	uncurry f = _____:'a * 'b * 'c -> 'd
	uncurry f (x,y,z) = ____: 'd
	uncurry f (x,y,z) = f x y z


*)
