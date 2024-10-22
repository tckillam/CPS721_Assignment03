
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
counter(X, [Y|T], Total, Amount) :- not X=Y , counter(X, T, Total, Amount).

%%%%% SECTION: gameSolve
%%%%% Predicate to solve the game based on constraints.





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

    
    




    
    outcome(P1) , outcome(P2) , outcome(S1) , outcome(O2) ,

    P1 = l, S1 = w, P2 = w, O2 = l,
    write('Constraint 1 passed'), nl,
    write('P:'),write(P), nl,
    write('S:'),write(S), nl,
    write('O:'),write(O), nl,
    write('T:'),write(T), nl,
    write('R:'),write(R), nl,





    outcome(T1) ,outcome(T2) , outcome(T3) ,
    
    T3 = n, oneExactly(w , [T1 , T2]) , oneExactly(l , [T1 , T2]),
    write('Constraint 2 passed'), nl,
    write('P:'),write(P), nl,
    write('S:'),write(S), nl,
    write('O:'),write(O), nl,
    write('T:'),write(T), nl,
    write('R:'),write(R), nl,





    outcome(O1) , outcome(O3) ,
    
    O4 = n, twoExactly(w , [O1,O2,O3]),
    write('Constraint 3 passed'), nl,
    write('O:'),write(O), nl,






    outcome(R1) ,outcome(R2) , outcome(R3) ,
    
    oneExactly(w , [R1,R2,R3]), oneExactly(l , [R1,R2,R3]),
    write('Constraint 5 passed'), nl,
    write('R:'),write(R), nl,






    outcome(S2) , outcome(S3) , outcome(P3) ,
    zeroExactly(d , [R1,R2,R3,T1,T2,T3,S1,S2,S3,O1,O2,O3,P1,P2,P3]),


    oneExactly(n , [O1 , P1 , R1 , S1 , T1]),
    oneExactly(n , [O2 , P2 , R2 , S2 , T2]),
    oneExactly(n , [O3 , P3 , R3 , S3 , T3]),
    
    
    outcome(O4) ,
    outcome(P4) ,
    outcome(R4) ,
    outcome(T4) ,
    outcome(S4) , 
    fourExactly(d, [O4, P4 , R4 , S4 , T4]),
    oneExactly(n, [O4, P4 , R4 , S4 , T4]),



    outcome(S5) ,outcome(T5) , outcome(R5) ,outcome(P5) ,outcome(O5) ,
    fourExactly(d, [O5, P5 , R5 , S5 , T5]),
    oneExactly(n, [O5, P5 , R5 , S5 , T5]),
    

    

    compare_wins_and_losses([O1 , P1 , R1 , S1 , T1]),
    compare_wins_and_losses([O2 , P2 , R2 , S2 , T2]),
    compare_wins_and_losses([O3 , P3 , R3 , S3 , T3]),
    compare_wins_and_losses([O4 , P4 , R4 , S4 , T4]),
    compare_wins_and_losses([O5 , P5 , R5 , S5 , T5]),


    oneExactly(n , O),
    oneExactly(n , P),
    oneExactly(n , S),
    oneExactly(n , T),
    oneExactly(n , R),




% Domain of possible outcomes for each team in each round
outcome(w). % Win
outcome(l). % Loss
outcome(d). % Draw
outcome(n). % Did not participate
 






cityDomain([C1,C2,C3,C4,C5]) :-
    outcome(C1),
    outcome(C2),
    outcome(C3),
    outcome(C4),
    outcome(C5).








% Helper predicates for counting np & wins & losses & draws


oneExactly(X, List) :- counter(X, List, 0, Amount), Amount = 1.

twoExactly(X, List) :- counter(X, List, 0, Amount), Amount = 2.

zeroExactly(X, List) :- counter(X, List, 0, Amount), Amount = 0.


compare_wins_and_losses(List) :- counter(w, List, 0, W), counter(l, List, 0, L), W = L.






% Predicate to solve and print the solution in a readable format
solve_and_print :-
    solve([O, P, R, S, T]),
    write("Oakville: "), write(O), nl,
    write("Pickering: "), write(P), nl,
    write("Richmond Hill: "), write(R), nl,
    write("Scarborough: "), write(S), nl,
    write("Toronto: "), write(T), nl.
