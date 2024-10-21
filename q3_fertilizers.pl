% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Shaghayegh Dehghanisanij
%%%%% NAME: Theresa Killam
%%%%% NAME:
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below
%

%%%%% SECTION: minAndMaxList
%%%%% Below, you should define rules for the predicate "minList(List, M)", 
%%%%% which takes in an input List and finds the minimal element there.
%%%%%
%%%%% You should also define rules for the predicate "maxList(List, M)", 
%%%%% which takes in an input List and finds the maximal element there.
%%%%%
%%%%% If you introduce any other helper predicates for implementing minList
%%%%% and maxList, they should be included in this section.

% base case for an empty list returns 0
minList([],null).

% recursion
minList([H|T], M) :- minimum(T,H,M).
minimum([], M, M).
minimum([H|T],X,M) :- H < X, minimum(T,H,M).
minimum([H|T],X,M) :- H >= X, minimum(T,X,M).

% minList([5,-2,7,-89,100,-25],X) --> -89
% minList([5,-25],X) --> -25


% base case for an empty list returns 0
maxList([],null).

% recursion
maxList([H|T], M) :- maximum(T,H,M).
maximum([], M, M).
maximum([H|T],X,M) :- H > X, maximum(T,H,M).
maximum([H|T],X,M) :- H =< X, maximum(T,X,M).

% maxList([5,-2,7,-89,100,-25],X) --> -100
% maxList([5,-25],X) --> -5

%%%%% SECTION: fertilizersSolve
%%%%% Below, you should define rules for the predicate "solve", which takes in your list of
%%%%% variables and finds an assignment for each variable which solves the problem.
%%%%%
%%%%% You should also define rules for the predicate "solve_and_print" which calls your
%%%%% solve predicate and prints out the results in an easy to read, human readable format.
%%%%% The predicate "solve_and_print" should take in no arguments
%%%%%
%%%%% This section should also include your domain definitions and any other helper
%%%%% predicates (other than minList, maxList, and their helpers) that you choose to introduce.


solve_and_print :- 
    solve([P1,P2,P3,P4,P5]),
    write("P1 has the values of: "), write(P1), nl,
    write("P2 has the values of: "), write(P2), nl,
    write("P3 has the values of: "), write(P3), nl,
    write("P4 has the values of: "), write(P4), nl,
    write("P5 has the values of: "), write(P5), nl.


solve([P1,P2,P3,P4,P5]) :-

% the plants and their fertilizers, heights, yeilds and weights

% the fertilizers for each plant
FN = [F1, F2, F3, F4, F5],

% the heights for each plant
HN = [H1, H2, H3, H4, H5],

% the yields for each plant
YN = [Y1, Y2, Y3, Y4, Y5],

% the weights for each plant
WN = [W1, W2, W3, W4, W5],

assignF(FN),
assignH(HN),
assignY(YN),
assignW(WN),

P1 = [F1,H1,Y1,W1],
P2 = [F2,H2,Y2,W2],
P3 = [F3,H3,Y3,W3],
P4 = [F4,H4,Y4,W4],
P5 = [F5,H5,Y5,W5],

write('ta da'), nl.

% assigns the varibles in a list to unique values in fertilizers
assignF([A,B,C,D,E]) :-
    fertilizer(A), fertilizer(B), not A=B, 
    fertilizer(C), not A=C, not B=C,
    fertilizer(D), not A=D, not B=D, not C=D,
    fertilizer(E), not A=E, not B=E, not C=E, not D=E.
   

% assigns the varibles in a list to unique values in heights
assignH([A,B,C,D,E]) :-
    height(A), height(B), not A=B, 
    height(C), not A=C, not B=C,
    height(D), not A=D, not B=D, not C=D,
    height(E), not A=E, not B=E, not C=E, not D=E.

% assigns the varibles in a list to unique values in yields
assignY([A,B,C,D,E]) :-
    yield(A), yield(B), not A=B, 
    yield(C), not A=C, not B=C,
    yield(D), not A=D, not B=D, not C=D,
    yield(E), not A=E, not B=E, not C=E, not D=E.

% assigns the varibles in a list to unique values in weights
assignW([A,B,C,D,E]) :-
    weight(A), weight(B), not A=B, 
    weight(C), not A=C, not B=C,
    weight(D), not A=D, not B=D, not C=D,
    weight(E), not A=E, not B=E, not C=E, not D=E.

% unique plants
uniq(A, B, C, D, E) :-
    plant(A), plant(B), not A=B, 
    plant(C), not A=C, not B=C,
    plant(D), not A=D, not B=D, not C=D,
    plant(E), not A=E, not B=E, not C=E, not D=E.

% different plants
plant(plant1),
plant(plant2),
plant(plant3),
plant(plant4),
plant(plant5).

% domain of fertilizers
fertilizer('bone-meal').
fertilizer('compost').
fertilizer('egg-shells').
fertilizer('manure').
fertilizer('seaweed').

% domain of heights
height(1).
height(2).
height(4).
height(5).
height(7).

% domain of yields
yield(4).
yield(6).
yield(9).
yield(12).
yield(21).

% domain of weights
weight(3).
weight(9).
weight(10).
weight(14).
weight(19).




