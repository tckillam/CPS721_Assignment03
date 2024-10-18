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

solve([O,P,R,S,T, Round1, Round2, Round3, Round4, Round5]) :-
    O is [O1,O2,O3,O4,O5], exactlyOne(n,O),
    P is [P1,P2,P3,P4,P5], exactlyOne(n,P),
    R is [R1,R2,R3,R4,R5], exactlyOne(n,R),
    S is [S1,S2,S3,S4,S5], exactlyOne(n,S),
    T is [T1,T2,T3,T4,T5], exactlyOne(n,T),
             
              % match 1  match 2
    Round1 is [ X1,Y1,   Z1,T1], 
    Round2 is [ X2,Y2,   Z2,T2],
    Round3 is [ X3,Y3,   Z3,T3],
    Round4 is [ X4,Y4,   Z4,T4],
    Round5 is [ X5,Y5,   Z5,T5],

/**
Round1 is [X1 , Y1 , Z1 , T1 , U1],
#n = 1
#d even always (0,2,4)
#w =:= #l
Round1 is [[city,result] , Y1 , Z1 , T1 , U1],
**/

exactlyOne(n,List) :- counter2(X,List,0,Amount), Amount = 1.
counter2(X,[X],Total,Amount) :- Amount is Total + 1.
counter2(X,[H],Total,Amount) :- not X=H, Amount is Total.
counter2(X,[X|T],Total,Amount) :- X=X, NewTotal is Total + 1, counter2(X,T,NewTotal,Amount).
counter2(X,[H|T],Total,Amount) :- not X=H, counter2(X,T,Total,Amount).

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
