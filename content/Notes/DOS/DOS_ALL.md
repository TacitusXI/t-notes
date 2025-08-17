everything you need to find DOS

Transactopm that being prevented going through
It can be caused by:
1. Unbounded for loop the have more than gas block limit
2. an external call failing

if you see for loop ask yourself:
1. is this iterable thing that being iterated is that bound to a certain size 
2. if not can a user add arbitrary amoung of data to it
3. how much user cost to do it
4. can user do it cheaply to make DOS


external call might be anything that transfering ether ot simply doing external call to a third patry contract

if you found ask yourself : 
1. is that a way for this tx to fail
2. if yes will it cause will it cause globlaaly entire call to revert(function that making that external clal)
3. how it can affect the system? will it be very dangerous or small effect?

and you can force external call to fail by:
1. sending ether to a contract that does not accept it
2. calling function that does not exist on the contract it is calling
3. the external call execution runs out of gas
4. third party contract is simply malicious
