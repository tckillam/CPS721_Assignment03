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

%%%%% SECTION: puzzleInterleaving
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

%  takes in the list of variables and finds an assignment that solves the puzzle using a smart interleaving of generate and test 
solve([J,E,T,A,X,L,O,V]) :-

    /*
    Instead of generating every number at the beginning, this program tests as it goes to make sure that the numbers all work 
    together so the program does not have to backtrack as often so computation time is much shorter.

    Everytime a new variable is introduced, we first assign it a digit and makes sure it is not the same as any of the exisiting
    digits and then check to see if it fits the constraint. If not, then it can backtrack and change the digits that were chosen
    so a new unique group of the variables that were not working can be selected without having to change all of them every time
    */

    % the variables that start with Cs are carry overs to be used for the next variable
    isDigit(E), isDigit(X), isDigit(T), not E=X, not E=T, not X=T,
    E is (X*T) mod 10, C1 is (X*T) // 10,
    isDigit(L), not L=E, not L=X, not L=T,
    L is (X*E+C1) mod 10, C10 is (X*E+C1) // 10,
    isDigit(J), J > 0, not X=J, not J=E, not J=T, not J=L, 
    X is (X*J+C10) mod 10, C100 is (X*J+C10) // 10,
    isDigit(A), A > 0, not A=E, not A=X, not A=T, not A=L, not A=J,
    A is C100,
    T is (A*T) mod 10, C2 is (A*T) // 10,
    E is (A*E+C2) mod 10, C20 is (A*E+C2) // 10,
    J is A*J+C20,
    isDigit(V), not V=E, not V=X, not V=T, not V=L, not V=J, not V=A,
    V is (L+T) mod 10, C3 is (L+T) // 10,
    isDigit(O), not O=E, not O=X, not O=T, not O=L, not O=J, not O=A, not O=V,
    O is (X+E+C3) mod 10, C30 is (X+E+C3) // 10,
    L is A+J+C30.

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