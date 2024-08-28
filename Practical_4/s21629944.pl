greaterThan(X,Y) :- X > Y.
lessEqualThan(X,Y) :- X =< Y.
% equalTo(X,Y) :- X =:= Y.

stripNegativesAndZerosDuplicatePositives([], []).

stripNegativesAndZerosDuplicatePositives([Head|Tail], X) :- lessEqualThan(Head,0), stripNegativesAndZerosDuplicatePositives(Tail, X).

stripNegativesAndZerosDuplicatePositives([Head|Tail], [Head, Head|X]) :- greaterThan(Head,0), stripNegativesAndZerosDuplicatePositives(Tail,X).


% ?- stripNegativesAndZerosDuplicatePositives([], X).
% X=[]
% ?- stripNegativesAndZerosDuplicatePositives([0, -1, -2], X).
% X=[]
% ?- stripNegativesAndZerosDuplicatePositives([2, 3, 4], X).
% X = [2, 2, 3, 3, 4, 4].
% ?- stripNegativesAndZerosDuplicatePositives([0, 2, -3, 3, 4, -5], X).
% X = [2, 2, 3, 3, 4, 4].
