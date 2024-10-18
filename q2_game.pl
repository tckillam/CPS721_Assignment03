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

/**
fourExactly(q,[q,a,b,q,q,b,q,a,c,b,c]).
fourExactly(q,[q,a,b,q,q,b,q,a,c,b,c,q]).
fourExactly(q,[q,a,b,q,q,b,a,c,b,c]).
counter(q,[a,b,c,q],0,Amount).
counter(q,[q,a,b,c,q,q,q],0,Amount).
counter(q,[q,a,b,q,q,b,q,a,c,b,c],0,Amount).
**/

fourExactly(X,List) :- counter(X,List,0,Amount), Amount = 4.

counter(X,[X],Total,Amount) :- Amount is Total + 1.
counter(X,[H],Total,Amount) :- not X=H, Amount is Total.
counter(X,[X|T],Total,Amount) :- X=X, NewTotal is Total + 1, counter(X,T,NewTotal,Amount).
counter(X,[H|T],Total,Amount) :- not X=H, counter(X,T,Total,Amount).


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

solve_and_print :-

/**
Your task is to write a Prolog program that finds the outcome of each match for each
team, based on the clues provided below. You have to write a Prolog program that implements
precisely not only the given constraints, but also constraints that remain implicit
**/

solve([O,P,R,S,T, Round1, Round2, Round3, Round4, Round5]) :-
    O is [O1,O2,O3,O4,O5], exactlyOne(n,O),
    P is [P1,P2,P3,P4,P5], exactlyOne(n,P),
    R is [R1,R2,R3,R4,R5], exactlyOne(n,R),
    S is [S1,S2,S3,S4,S5], exactlyOne(n,S),
    T is [T1,T2,T3,T4,T5], exactlyOne(n,T),
             
              % match 1  match 2
    Round1 is [ X1,Y1,   Z1,T1],   evenDraws(d,Round1),
    Round2 is [ X2,Y2,   Z2,T2],   evenDraws(d,Round2),
    Round3 is [ X3,Y3,   Z3,T3],   evenDraws(d,Round3),
    Round4 is [ X4,Y4,   Z4,T4],   evenDraws(d,Round4),
    Round5 is [ X5,Y5,   Z5,T5],   evenDraws(d,Round5),


% 1. Pickering lost to Scarborough in the first round, but won over Oakville in the second round.
P1 = l, X1 = P1, S1 = w, Y1 = P1,
P2 = w, X2 = P2, O2 = l, Y2 = O2,

% 2. Toronto did not play in the third round; they had one win and one loss in the previous two rounds.
not T1=d, not T1=T2, not T2=d, T3 = n,

% 3. Oakville did not participate in the fourth round, but they already won twice in the preceding three matches.
O4 = n, countWins([O1,O2,O3] , 2).

% Helper predicates for counting wins
countWins([], 0).
countWins([w|T], Count) :- countWins(T, NewCount), Count is NewCount + 1.
countWins([_|T], Count) :- countWins(T, Count).

% 4. All matches in the fourth and in the fifth round finished with a draw.
% fourExactly(d,[X4,Y4,Z4,T4]),
% fourExactly(d,[X5,Y5,Z5,T5]),
fourExactly(d, [O4, P4, R4, S4, T4]),
fourExactly(d, [O5, P5, R5, S5, T5]),

% 5. Before the fourth round, Richmond Hill won only once and lost once
countWins([R1,R2,R3] , 1).
countLosses([R1,R2,R3] , 1).

% Helper predicates for counting losses
countLosses([], 0).
countLosses([l|T], Count) :- countLosses(T, NewCount), Count is NewCount + 1.
countLosses([_|T], Count) :- countLosses(T, Count).

% 6. None of the matches in the first, in the second and in the third rounds finished with a draw.
countDraws(Round1, 0).
countDraws(Round2, 0).
countDraws(Round3, 0).

countDraws([O1,O2,O3 , R1,R2,R3 , P1,P2,P3 , S1,S2,S3 ,T1,T2,T3], 0).

% Helper predicates for counting wins and losses
countDraws([], 0).
countDraws([d|T], Count) :- countDraws(T, NewCount), Count is NewCount + 1.
countDraws([_|T], Count) :- countDraws(T, Count).

/*
cityDomain([C1,C2,C3,C4,C5]) :-
    outcome(C1),
    outcome(C2),
    outcome(C3).
*/


/**
The 4 variables in Round1 should match to 4 of the 5 starting elements for the different cities,
the element that does not match is the one that did not participate. 
**/



/**
Round1 is [X1 , Y1 , Z1 , T1 , U1],
#n = 1
#d even always (0,2,4)
#w =:= #l
Round1 is [[city,result] , Y1 , Z1 , T1 , U1],



equalWinLoss [T1 , T2] :-
    (T1 = w, T2 = l);
    (T1 = l, T2 = w).

Round1 is [X1 , Y1 , Z1 , T1 , U1],
evenDraws(d, Round1),
exactlyOne(n , Round1),
equalWinLoss(Round1)
**/

exactlyOne(X,List) :- counter2(X,List,0,Amount), Amount = 1.
counter2(X,[X],Total,Amount) :- Amount is Total + 1.
counter2(X,[H],Total,Amount) :- not X=H, Amount is Total.
counter2(X,[X|T],Total,Amount) :- X=X, NewTotal is Total + 1, counter2(X,T,NewTotal,Amount).
counter2(X,[H|T],Total,Amount) :- not X=H, counter2(X,T,Total,Amount).

evenDraws(X,List) :- counter3(X,List,0,Amount), Amount = 0.
evenDraws(X,List) :- counter3(X,List,0,Amount), Amount = 2.
evenDraws(X,List) :- counter3(X,List,0,Amount), Amount = 4.
counter3(X,[X],Total,Amount) :- Amount is Total + 1.
counter3(X,[H],Total,Amount) :- not X=H, Amount is Total.
counter3(X,[X|T],Total,Amount) :- X=X, NewTotal is Total + 1, counter3(X,T,NewTotal,Amount).
counter3(X,[H|T],Total,Amount) :- not X=H, counter3(X,T,Total,Amount).

% domain
outcome(n).
outcome(d).
outcome(l).
outcome(w).















%%%%% CLUESSSSS
% Pickering did not play in round 5
% Toronto did not play in round 3
% Oakville did not play in round 4
% Richmond Hill did not play in round 1
% Scarbro did not play in round 5
% Pickering lost to Scarbro in round 1
% Oakville lost to Scarbro in round 2

% I am starting to think I am no longer picking up subtle clues and instead I am just solving the game
% look up what are implicit constraints
