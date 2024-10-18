
% q2_game.pl
%%%%% NAME: Shaghayegh Dehghanisanij
%%%%% NAME: Theresa Killam
%%%%% NAME: 

%%%%% SECTION: fourExactly
%%%%% Predicate to check if X occurs exactly 4 times in a list.
fourExactly(X, List) :- counter(X, List, 0, Amount), Amount = 4.

% Helper counter predicate
counter(_, [], Amount, Amount).
counter(X, [X|T], Total, Amount) :- NewTotal is Total + 1, counter(X, T, NewTotal, Amount).
counter(X, [_|T], Total, Amount) :- counter(X, T, Total, Amount).

%%%%% SECTION: gameSolve
%%%%% Predicate to solve the game based on constraints.

% Domain of possible outcomes for each team in each round
outcome(w). % Win
outcome(l). % Loss
outcome(d). % Draw
outcome(n). % Did not participate



% Main solve predicate
solve([O, P, R, S, T]) :-



    O = [O1, O2, O3, O4, O5], 
    write('Oakville outcomes: '), write(O), nl,  % Debug output for Oakville
    P = [P1, P2, P3, P4, P5], 
    write('Pickering outcomes: '), write(P), nl,  % Debug output for Pickering
    R = [R1, R2, R3, R4, R5], 
    write('Richmond Hill outcomes: '), write(R), nl,  % Debug output for Richmond Hill
    S = [S1, S2, S3, S4, S5], 
    write('Scarborough outcomes: '), write(S), nl,  % Debug output for Scarborough
    T = [T1, T2, T3, T4, T5], 
    write('Toronto outcomes: '), write(T), nl,  % Debug output for Toronto



    % Check constraint logic
    P1 = l, S1 = w, P2 = w, O2 = l,
    write('Constraint 1 passed'), nl,
    write('P:'),write(P), nl,
    write('S:'),write(S), nl,
    write('O:'),write(O), nl,
    write('T:'),write(T), nl,
    write('R:'),write(R), nl,


    T3 = n, countWins([T1 , T2] , 1) , countLosses([T1 , T2] , 1),
    write('Constraint 2 passed'), nl,
    write('P:'),write(P), nl,
    write('S:'),write(S), nl,
    write('O:'),write(O), nl,
    write('T:'),write(T), nl,
    write('R:'),write(R), nl,

    O4 = n, countWins([O1,O2,O3], 2),
    write('Constraint 3 passed'), nl,
    write('P:'),write(P), nl,
    write('S:'),write(S), nl,
    write('O:'),write(O), nl,
    write('T:'),write(T), nl,
    write('R:'),write(R), nl,

    fourExactly(d, [O4, P4 , R4 , S4 , T4]),
    fourExactly(d, [O5, P5 , R5 , S5 , T5]),
    write('Constraint 4 passed'), nl,
    write('P:'),write(P), nl,
    write('S:'),write(S), nl,
    write('O:'),write(O), nl,
    write('T:'),write(T), nl,
    write('R:'),write(R), nl,

    countWins([R1, R2, R3], 1), countLosses([R1, R2, R3], 1),
    write('Constraint 5 passed'), nl,
    write('P:'),write(P), nl,
    write('S:'),write(S), nl,
    write('O:'),write(O), nl,
    write('T:'),write(T), nl,
    write('R:'),write(R), nl,

    countDraws([O1, O2, O3, P1, P2, P3, R1, R2, R3, S1, S2, S3, T1, T2, T3] , 0),
    write('Constraint 6 passed'), nl,
    write('P:'),write(P), nl,
    write('S:'),write(S), nl,
    write('O:'),write(O), nl,
    write('T:'),write(T), nl,
    write('R:'),write(R), nl,

    
    Round1 = [O1 , P1 , R1 , S1 , T1],
    Round2 = [O2 , P2 , R2 , S2 , T2],
    Round3 = [O3 , P3 , R3 , S3 , T3],
    Round4 = [O4 , P4 , R4 , S4 , T4],
    Round5 = [O5 , P5 , R5 , S5 , T5],
    write('Round1:'),write(Round1), nl,
    write('Round2:'),write(Round2), nl,
    write('Round3:'),write(Round3), nl,
    write('Round4:'),write(Round4), nl,
    write('Round5:'),write(Round5), nl,



    write('Constraint 7 passed'), nl,
    exactlyOne(n, O),
    exactlyOne(n, P),
    exactlyOne(n, S),
    exactlyOne(n, R),
    exactlyOne(n, T),

    write('Constraint 8 passed'), nl,
    compare(Round1),
    compare(Round2),
    compare(Round3),
    compare(Round4),
    compare(Round5),



    write('Constraint 9 passed'), nl,
    exactlyOne(n, Round1),
    exactlyOne(n, Round2),
    exactlyOne(n, Round3),
    exactlyOne(n, Round4),
    exactlyOne(n, Round5),
    write('Round1:'),write(Round1), nl,
    write('Round2:'),write(Round2), nl,
    write('Round3:'),write(Round3), nl,
    write('Round4:'),write(Round4), nl,
    write('Round5:'),write(Round5), nl.





cityDomain([C1,C2,C3,C4,C5]) :-
    outcome(C1),
    outcome(C2),
    outcome(C3),
    outcome(C4),
    outcome(C5).








% Helper predicates for counting np & wins & losses & draws
countNPs([], 0).
countNPs([H|T], Count) :- H=n, countNPs(T, NewCount), Count is NewCount + 1.
countNPs([H|T], Count) :- not H=n, countNPs(T, Count).

countWins([], 0).
countWins([H|T], Count) :- H=w,countWins(T, NewCount), Count is NewCount + 1.
countWins([H|T], Count) :- not H=w, countWins(T, Count).

countLosses([], 0).
countLosses([H|T], Count) :- H=l, countLosses(T, NewCount), Count is NewCount + 1.
countLosses([H|T], Count) :- not H=l, countLosses(T, Count).

countDraws([], 0).
countDraws([H|T], Count) :- H=d, countDraws(T, NewCount), Count is NewCount + 1.
countDraws([H|T], Count) :- not H=d, countDraws(T, Count).

compareWL(Roundn) :- countLosses(Roundn , X) , countWins(Roundn , X).



% Predicate to solve and print the solution in a readable format
solve_and_print :-
    solve([O, P, R, S, T]),
    write("Oakville: "), write(O), nl,
    write("Pickering: "), write(P), nl,
    write("Richmond Hill: "), write(R), nl,
    write("Scarborough: "), write(S), nl,
    write("Toronto: "), write(T), nl.
