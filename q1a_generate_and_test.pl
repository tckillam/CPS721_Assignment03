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

%%%%% SECTION: puzzleGenerateAndTest
%%%%% Below, you should define rules for the predicate "solve", which takes in your list of
%%%%% variables and finds an assignment for each variable which solves the problem.
%%%%%
%%%%% You should also define rules for the predicate "solve_and_print" which calls your
%%%%% solve predicate and prints out the results in an easy to read, human readable format.
%%%%% The predicate "solve_and_print" should take in no arguments
%%%%% 
%%%%% This section should also include your domain definitions and any other helper
%%%%% predicates that you choose to introduce


solve_and_print.

solve(J,E,T,A,X,L,O,V).

% checks to see that all the variables are different digits
allDiff(J,E,T,A,X,L,O,V) :-
    isDigit(J), isDigit(E), isDigit(T), isDigit(A), isDigit(X), isDigit(L), isDigit(O), isDigit(V),
    not J=E, not J=T, not J=A, not J=X, not J=L, not J=O, not J=V,
             not E=T, not E=A, not E=X, not E=L, not E=O, not E=V,
                      not T=A, not T=X, not T=L, not T=O, not T=V,
                               not A=X, not A=L, not A=O, not A=V,
                                        not X=L, not X=O, not X=V,
                                                 not L=O, not L=V,
                                                          not O=V.

% checks to see if a variable is a digit
isDigit(0).
isDigit(1).
isDigit(2).
isDigit(3).
isDigit(4).
isDigit(5).
isDigit(6).
isDigit(7).
isDigit(8).
isDigit(9).
