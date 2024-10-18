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
solve([O, P, R, S, T) :-
    % Define the outcomes for Oakville, Pickering, Richmond Hill, Scarborough, and Toronto in each round
    O = [O1, O2, O3, O4, O5], exactlyOne(n, O),
    P = [P1, P2, P3, P4, P5], exactlyOne(n, P),
    R = [R1, R2, R3, R4, R5], exactlyOne(n, R),
    S = [S1, S2, S3, S4, S5], exactlyOne(n, S),
    T = [T1, T2, T3, T4, T5], exactlyOne(n, T),
    
    % Constraint 1: Pickering lost to Scarborough in the first round, won over Oakville in the second round
    P1 = l, S1 = w, P2 = w, O2 = l,
    
    % Constraint 2: Toronto did not play in round 3; they had one win and one loss in the previous two rounds
    not T1=d, not T1=T2, not T2=d, T3 = n,    
    
    % Constraint 3: Oakville did not participate in round 4, but they won twice in the first three rounds
    O4 = n, countWins(O, 2),
    
    % Constraint 4: All matches in the fourth and fifth rounds finished in a draw
    fourExactly(d, [O4, P4, R4, S4, T4]),
    fourExactly(d, [O5, P5, R5, S5, T5]),
    
    % Constraint 5: Before round 4, Richmond Hill won once and lost once
    countWins([R1, R2, R3], 1), countLosses([R1, R2, R3], 1),
    
    % Constraint 6: No draws in the first three rounds
    countDraws([O1, O2, O3, P1, P2, P3, R1, R2, R3, S1, S2, S3, T1, T2, T3] , 0).

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
    solve([O, P, R, S, T, Round1, Round2, Round3, Round4, Round5]),
    format('Oakville: ~w~nPickering: ~w~nRichmond Hill: ~w~nScarborough: ~w~nToronto: ~w~n', [O, P, R, S, T]),
    format('Round 1: ~w~nRound 2: ~w~nRound 3: ~w~nRound 4: ~w~nRound 5: ~w~n', [Round1, Round2, Round3, Round4, Round5]).

