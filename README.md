# CPS721_Assignment03

  Q1: I think I might have done q1 wrong because I am not sure if (1) the variables are supposed to be unique and (2) if the variables are supposed to match each     
      other. If you look at the variables 'E' in the example with 123 and 12, they do not match as the first instance of E is 1 or 2 and the second is 6. And then 
      there are a bunch of variables that share values so I do not think they have to be unqiue. I am waiting on his reply.

  Q2: TEST CASES for fourExactly(X,List) ->
    
fourExactly(q,[q,a,b,q,q,b,q,a,c,b,c]). -> Yes
fourExactly(q,[q,a,b,q,q,b,q,a,c,b,c,q]). -> No
fourExactly(q,[q,a,b,q,q,b,a,c,b,c]). -> No
counter(q,[a,b,c,q],0,Amount). -> Amount=1
counter(q,[q,a,b,c,q,q,q],0,Amount). -> Amount=4
counter(q,[q,a,b,q,q,b,q,a,c,b,c],0,Amount). ->Amount=4

