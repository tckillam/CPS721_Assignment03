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




