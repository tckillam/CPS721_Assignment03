# CPS721_Assignment03

Q2: TEST CASES for fourExactly(X,List) ->

fourExactly(q,[q,a,b,q,q,b,q,a,c,b,c]). -> Yes
fourExactly(q,[q,a,b,q,q,b,q,a,c,b,c,q]). -> No
fourExactly(q,[q,a,b,q,q,b,a,c,b,c]). -> No
counter(q,[a,b,c,q],0,Amount). -> Amount=1
counter(q,[q,a,b,c,q,q,q],0,Amount). -> Amount=4
counter(q,[q,a,b,q,q,b,q,a,c,b,c],0,Amount). ->Amount=4
