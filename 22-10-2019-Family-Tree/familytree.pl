man(arjun).
man(pandu).
man(bheem).
man(yudhistir).
woman(kunti).
woman(madri).
woman(raksha).
parent(arjun, pandu).
parent(arjun, kunti).
parent(bheem, pandu).
parent(bheem, kunti).
parent(yudhistir, pandu).
parent(yudhistir, kunti).
parent(raksha, pandu).
parent(raksha, kunti).
parent(nakul, pandu).
parent(nakul, madri).
parent(sahadev, pandu).
parent(sahadev, madri).
parent(pandu, me).
parent(me, yo).

%%% Facts end here %%%%%%%%%%%%%%%%%%%

mother(X,Y)  :- woman(Y), parent(X,Y).
father(X,Y)  :- man(Y), parent(X,Y).
sibling(X,Y) :- dif(X,Y), father(X,Z), father(Y,Z), mother(X,M), mother(Y,M).
brother(X,Y) :- man(Y), sibling(X,Y).
sister(X,Y) :- woman(Y), sibling(X,Y).
ancestor(X,Y) :- parent(X,Y); (ancestor(Z,Y), parent(X,Z)).

