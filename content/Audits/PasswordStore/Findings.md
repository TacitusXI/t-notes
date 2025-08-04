### [H-1] Storing the password on-chain makes it visible to anyone, and no longer private

  

**Description:** All data stored on-chain is visible to anyone, and can be read directly from the blockchain. The `PasswordStore::s_password` variable is intended to be a private variable and only accessed through the `PasswordStore::getPassword` function, which is intended to be only called by the owner of the contract.

  

We show one such method of reading any data off chain below.

  

**Impact:** Anyone can read the private password, severly breaking the functionlity of the protocol.

  

**Proof of Concept:** (Proof of Code)

  

The below test case shows how anyone can read the password directly from the blockchain.

  

1. Create a locally running chain

```bach

make anvil

```

  

2. Deploy the contract to the chain

```

make deploy

```

  

3. Run the storage tool

We use `1` because that's the storage slot of `s_password` in the contract

```

cast storage <CONTRACT_ADDRESS_HERE> 1

```

  

You'll get an output that looks like this:

  

`0x6d7950617373776f726400000000000000000000000000000000000000000014`

  

You then parse that hex to string with:

  

```

cast parse-bytes32-string 0x6d7950617373776f726400000000000000000000000000000000000000000014

```

  

And get an output of

  

```

myPassword

```

  
  

**Recommended Mitigation:** Due to this, the overall architecture of the contract should be rethought. One could encrypt the password off-chain, and then sore the encrypted password on-chain. This would require user to remember another passwoord off-chain to decrypt the password. However, you'd also likely want to remove view function as you wouldn't want the user to accidentally send a transaction with the password that decrypt your password.

  
  

## Likelihood & Impact:

- Impact: High

- Likelihood: HIGH

- Severity: HIGH

  

### [H-2] `PasswordStore::setpassword` has no access control, meaning a non-owner could change the password

  

  

**Description:** The `PasswordStore::setpassword` function is set to be an `external` function, however the natspec of the function and overall purpose of the smart contract is that `The function allows only the owner to set a new password.`

```javascript

function setPassword(string memory newPassword) external {

☧> // @audit - There are no access controls

s_password = newPassword;

emit SetNetPassword();

}

```

  

  

**Impact:** Anyone can set/change the password of the contract, severly breaking the contract intended functionality.

  

  

**Proof of Concept:** Add the following to the `PasswordStore.t.sol` test file.

<details>

<summary>Code</summary>

  

```javascript

function test_anyone_can_set_password(address randomAddress) public {

vm.assume(randomAddress != owner);

vm.prank(randomAddress);

string memory expectedPassword = "myNewPassword";

passwordStore.setPassword(expectedPassword);

  

vm.prank(owner);

string memory actualPassword = passwordStore.getPassword();

assertEq(actualPassword, expectedPassword);

}

```

</details>

  
  

**Recommended Mitigation:** Add an access control conditional to the `setPassword` function.

  

```javascript

if(msg.sender != s_owner){

revert PasswordStore__NotOwner();

}

```

  

## Likelihood & Impact:

- Impact: High

- Likelihood: HIGH

- Severity: HIGH

  
  

### [I-1] The `PasswordStore::getPassword` natspec indicates a parameter that doesn't exist, causing the natspec to be incorrect.

  

  

**Description:**

```

/*

* @notice This allows only the owner to retrieve the password.

☧> * @param newPassword The new password to set.

*/

function getPassword() external view returns (string memory) {

```

  

The `PasswordStore::getPassword` function signature is `getPassword()` which the natspec say it should be `getPassword(string)`

  

  

**Impact:** THe natspec is incorrect.

  
  

**Recommended Mitigation:** Remove the incorrect natspec line.

```diff

- * @param newPassword The new password to set.

```

  

## Likelihood & Impact:

- Impact: NONE

- Likelihood: HIGH?

- Severity: Informational/Gas/Non-Crits

  

Informational: Hey, this isn't a bug, but you should know...