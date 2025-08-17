# Everything You Need to Find DOS Vulnerabilities

A DOS (Denial of Service) attack prevents legitimate transactions from going through.

## Common Causes
1. Unbounded for loops that exceed the gas block limit
2. External calls failing

## For Loop Analysis
If you see a for loop, ask yourself:
1. Is the iterable thing being iterated bound to a certain size?
2. If not, can a user add an arbitrary amount of data to it?
3. How much does it cost the user to do this?
4. Can a user do it cheaply to cause DOS?

## External Call Analysis
External calls might be anything that transfers ether or makes calls to third-party contracts.

If you find external calls, ask yourself:
1. Is there a way for this transaction to fail?
2. If yes, will it cause the entire call to revert globally (the function making that external call)?
3. How can it affect the system? Will it be very dangerous or have a small effect?

## Ways to Force External Call Failures
You can force external calls to fail by:
1. Sending ether to a contract that does not accept it
2. Calling a function that does not exist on the contract being called
3. Making the external call execution run out of gas
4. Using a malicious third-party contract
