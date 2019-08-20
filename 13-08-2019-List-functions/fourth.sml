fun range n m =
    if (n=m) then
	n ::[]
    else
	n :: (range(n+1) m);

fun mul(n,m)=n*m;

fun fact n = foldl mul 1 (range 1 n);
