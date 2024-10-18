
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

    fourExactly(d, [O4, P4, R4, S4, T4]),
    fourExactly(d, [O5, P5, R5, S5, T5]),
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

    
    exactlyOne(n, O),
    exactlyOne(n, P),
    exactlyOne(n, S),
    exactlyOne(n, R),
    exactlyOne(n, T),

    countLosses(Round1 , X1) , countWins(Round1 , Y1), 
    countLosses(Round2 , X2) = countWins(Round2 , Y2),
    countLosses(Round3 , X3) = countWins(Round3 , Y3),
    countLosses(Round4 , X4) = countWins(Round4 , Y4),
    countLosses(Round5 , X5) = countWins(Round5 , Y5),

    exactlyOne(n, Round1),
    exactlyOne(n, Round2),
    exactlyOne(n, Round3),
    exactlyOne(n, Round4),
    exactlyOne(n, Round5).



cityDomain([C1,C2,C3,C4,C5]) :-
    outcome(C1),
    outcome(C2),
    outcome(C3),
    outcome(C4),
    outcome(C5).








% Helper predicates to ensure exactly one occurrence of 'n' (did not participate)
exactlyOne(n, List) :- counter(n, List, 0, 1).

% Helper predicates for counting wins & losses & draws
countWins([], 0).
countWins([w|T], Count) :- countWins(T, NewCount), Count is NewCount + 1.
countWins([_|T], Count) :- countWins(T, Count).

countLosses([], 0).
countLosses([l|T], Count) :- countLosses(T, NewCount), Count is NewCount + 1.
countLosses([_|T], Count) :- countLosses(T, Count).

countDraws([], 0).
countDraws([d|T], Count) :- countDraws(T, NewCount), Count is NewCount + 1.
countDraws([_|T], Count) :- countDraws(T, Count).

% Predicate to solve and print the solution in a readable format
solve_and_print :-
    solve([O, P, R, S, T]),
    format('Oakville: ~w~nPickering: ~w~nRichmond Hill: ~w~nScarborough: ~w~nToronto: ~w~n', [O, P, R, S, T]).
