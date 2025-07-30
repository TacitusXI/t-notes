- Each slot is 32 bytes long, and represents the bytes version of the object.
      For example: the uint256 is 0x000...0019, since that's the hex representation.
      For a 'true' boolean, it would be 0x000...001, since that's it's hex.
- For dynamic values like mappings and dynamic arrays, the elements are stored using a hashing function. You can see those function in the documentation.
      For arrays, a sequential storage spot is taken up for the length of the array.
      For mappings, a sequential storage spot is taken up, but left blank.
- Constants and immutable variable are not in storage, but they are considered part pf the core of the bytecode of the contract.