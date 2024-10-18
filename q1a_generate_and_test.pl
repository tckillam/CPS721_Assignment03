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

% calls the solve rule and prints out the solution in a human-readable form
solve_and_print :- 
    solve([J,E,T,A,X,L,O,V]), 
    write("The value of J is: "), write(J), nl,
    write("The value of E is: "), write(E), nl,
    write("The value of T is: "), write(T), nl,
    write("The value of A is: "), write(A), nl,
    write("The value of X is: "), write(X), nl,
    write("The value of L is: "), write(L), nl,
    write("The value of O is: "), write(O), nl,
    write("The value of V is: "), write(V), nl.

%  takes in the list of variables and finds an assignment that solves the puzzle
solve([J,E,T,A,X,L,O,V]) :-

    % checks to see that all the variables are different unique digits and the leading digits (J and A) are not 0
    allDiff(J,E,T,A,X,L,O,V), J > 0, A > 0,

    % the variables that start with Cs are carry overs to be used for the next variable
    E is (X*T) mod 10, C1 is (X*T) // 10,
    L is (X*E+C1) mod 10, C10 is (X*E+C1) // 10,
    X is (X*J+C10) mod 10, C100 is (X*J+C10) // 10,
    A is C100,
    T is (A*T) mod 10, C2 is (A*T) // 10,
    E is (A*E+C2) mod 10, C20 is (A*E+C2) // 10,
    J is A*J+C20,
    V is (L+T) mod 10, C3 is (L+T) // 10,
    O is (X+E+C3) mod 10, C30 is (X+E+C3) // 10,
    L is A+J+C30.

% checks to see that all the variables are different unique digits
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