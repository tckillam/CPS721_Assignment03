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

%%%%% SECTION: fourExactly
%%%%% Below, you should define rules for the predicate "fourExactly(X,List)", 
%%%%% which takes in an input List and checks whether there are exactly 4 
%%%%% occurrences of a given element X in the list.
%%%%%
%%%%% If you introduce any other helper predicates for implementing fourExactly,
%%%%% they should be included in this section.

fourExactly(X, List) :- counter(X, List, 0, Amount), Amount = 4.

% Helper counter predicate
counter(_, [], Amount, Amount).
counter(X, [X|T], Total, Amount) :- NewTotal is Total + 1, counter(X, T, NewTotal, Amount).
counter(X, [Y|T], Total, Amount) :- not X=Y , counter(X, T, Total, Amount).

%%%%% SECTION: gameSolve
%%%%% Below, you should define rules for the predicate "solve", which takes in your list of
%%%%% variables and finds an assignment for each variable which solves the problem.
%%%%%
%%%%% You should also define rules for the predicate "solve_and_print" which calls your
%%%%% solve predicate and prints out the results in an easy to read, human readable format.
%%%%% The predicate "solve_and_print" should take in no arguments
%%%%%
%%%%% This section should also include your domain definitions and any other helper
%%%%% predicates (other than fourExactly and its helpers) that you choose to introduce.

% Main solve predicate
solve([O, P, R, S, T]) :-

    O = [O1, O2, O3, O4, O5], 
    P = [P1, P2, P3, P4, P5], 
    R = [R1, R2, R3, R4, R5], 
    S = [S1, S2, S3, S4, S5], 
    T = [T1, T2, T3, T4, T5], 

    % we started with the simplest constraints , the ones that assign domain to variables

    % then we added our own constraints , such as having one team not playing in each round 
    % oneExactly( n , Round)

    % also, each team must have a round that they did not play in
    % oneExactly( n , Team)

    % we added these constraints when all the domains were assigned in the compare_wins_and_losses

    
    % P won against S , P won agains O
    outcome(P1) , outcome(P2) , outcome(S1) , outcome(O2) ,
    P1 = l, S1 = w, P2 = w, O2 = l,

    % T did not play in third round
    % T had one win and one loss in the first two rounds.
    outcome(T1) ,outcome(T2) , outcome(T3) ,
    T3 = n, oneExactly(w , [T1 , T2]) , oneExactly(l , [T1 , T2]),


    % O did not participate in the fourth round
    % O won twice in the first three matches
    outcome(O1) , outcome(O3) ,
    O4 = n, twoExactly(w , [O1,O2,O3]),


    % R won only once and lost once in first three rounds
    outcome(R1) ,outcome(R2) , outcome(R3) ,
    oneExactly(w , [R1,R2,R3]), oneExactly(l , [R1,R2,R3]),


    % no draw in fisrt three  rounds
    outcome(S2) , outcome(S3) , outcome(P3) ,
    zeroExactly(d , [R1,R2,R3,T1,T2,T3,S1,S2,S3,O1,O2,O3,P1,P2,P3]),


    % since all the domains are assigned to all the variables in the first three round by now
    % now, we can add the constraint to check for the team who did not play in each round
    oneExactly(n , [O1 , P1 , R1 , S1 , T1]),
    oneExactly(n , [O2 , P2 , R2 , S2 , T2]),
    oneExactly(n , [O3 , P3 , R3 , S3 , T3]),
    
    
    % All matches in the fourth round finished with a draw.
    % so we also check for the team who did not play in fourth round
    outcome(O4) ,outcome(P4) ,outcome(R4) ,outcome(T4) ,outcome(S4) , 
    fourExactly(d, [O4, P4 , R4 , S4 , T4]),
    oneExactly(n, [O4, P4 , R4 , S4 , T4]),


    % All matches in the fifth round finished with a draw.
    % so we also check for the team who did not play in fifth round
    outcome(S5) ,outcome(T5) , outcome(R5) ,outcome(P5) ,outcome(O5) ,
    fourExactly(d, [O5, P5 , R5 , S5 , T5]),
    oneExactly(n, [O5, P5 , R5 , S5 , T5]),
    

    % for every team that loses, there is a team that wins
    % so we check if the count of wins and losses are the same in each round
    compare_wins_and_losses([O1 , P1 , R1 , S1 , T1]),
    compare_wins_and_losses([O2 , P2 , R2 , S2 , T2]),
    compare_wins_and_losses([O3 , P3 , R3 , S3 , T3]),
    compare_wins_and_losses([O4 , P4 , R4 , S4 , T4]),
    compare_wins_and_losses([O5 , P5 , R5 , S5 , T5]),


    % for the last constraint, we check that every team did not play in exactly one round
    oneExactly(n , O),
    oneExactly(n , P),
    oneExactly(n , S),
    oneExactly(n , T),
    oneExactly(n , R).



% Domain of possible outcomes for each team in each round
outcome(w). % Win
outcome(l). % Loss
outcome(d). % Draw
outcome(n). % Did not participate
 


% Helper predicates for counting np & wins & losses & draws


oneExactly(X, List) :- counter(X, List, 0, Amount), Amount = 1.

twoExactly(X, List) :- counter(X, List, 0, Amount), Amount = 2.

zeroExactly(X, List) :- counter(X, List, 0, Amount), Amount = 0.

compare_wins_and_losses(List) :- counter(w, List, 0, W), counter(l, List, 0, L), W = L.



% Predicate to solve and print the solution in a readable format
solve_and_print :-
    solve([O, P, R, S, T]),
    nl,
    write("The output reads as --> "),
    nl,
    write("City: [Round 1 Outcome, Round 2 Outcome, Round 3 Outcome, Round 4 Outcome, Round 5 Outcome]"), nl, nl,
    write("Oakville: "), write(O), nl,
    write("Pickering: "), write(P), nl,
    write("Richmond Hill: "), write(R), nl,
    write("Scarborough: "), write(S), nl,
    write("Toronto: "), write(T), nl.

