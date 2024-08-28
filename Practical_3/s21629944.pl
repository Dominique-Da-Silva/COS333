%TASK1
%========================

%Facts
married(peter,mary).
married(lilly,joseph).
ownsPet(peter,rover).
ownsPet(mary,fluffy).
ownsPet(joseph,tweety).
ownsPet(lilly,fluffy).

%Rules
household(X,Y) :- married(X,Y).
household(X,Y) :- married(Y,X).
householdPet(O1, O2, P) :- household(O1, O2), ownsPet(O1,P).
householdPet(O1,O2,P) :- household(O1,O2), ownsPet(O2,P).
wanderingPet(P) :- householdPet(A,B,P), householdPet(C,D,P),A\=B, A\=C, A\=D, B\=C, B\=D, C\=D.

% ?-household(mary,peter). ==> true
% ?-household(mary,X). ==> X=peter
% ?-household(joseph,lilly). ==>true
% ?-householdPet(mary,peter,rover). ==> true
% ?-householdPet(peter,mary,fluffy). ==> true
% ?-householdPet(lilly,mary,fluffy). ==> false
% ?-householdPet(X,Y,rover).
% ?-householdPet(X,Y,tweety).
% ?-householdPet(X,Y,fluffy).
% ?-wanderingPet(X). ==> true X=fluffy
% ?-wanderingPet(fluffy). ==> true
% ?-wanderingPet(rover). ==> false


%TASK2
%========================
%Facts
%Rules
greaterThan(X, Y) :- X > Y.
addPositives([],0).
addPositives([Head|Tail], Sum) :- greaterThan(Head,0), addPositives(Tail,RestSum), Sum is Head + RestSum.
addPositives([Head|Tail], Sum) :- not(greaterThan(Head,0)), addPositives(Tail,Sum).

% ?- addPositives([],X). ==> X=0.
% ?- addPositives([3, -3, 0], X).
% ?- addPositives([-1, 3, -4, 2, 1], X).



%TASK3
%========================
%Facts
%Rules
singleElementlist([H]).
secondElement([First, Second|Tail], Second).
getEverySecondValue([],[]).
getEverySecondValue([_],[]).
getEverySecondValue([_,S|Tail],[S|Result]) :- getEverySecondValue(Tail,Result).

% ?- getEverySecondValue([],X). ==> X=[].
% % ?- getEverySecondValue([4],X).
% ?- getEverySecondValue([4, 5],X).
% ?- getEverySecondValue([4, 5, 1, 3],X).
