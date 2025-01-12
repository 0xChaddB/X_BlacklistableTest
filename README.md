# Blacklistable Test

This repository contains a Forge test for the `Blacklistable` smart contract. The test demonstrates how a blacklisted user can renounce their `BLACKLISTED_ROLE`. This test was created for the [PeterSRWeb3 Challenge](https://x.com/PeterSRWeb3/status/1878509764805554642).

## Importing the Test

To import this test into your project:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/0xChaddB/X_BlacklistableTest
   ```

2. **Install Dependencies**:
   Ensure you have [Forge](https://book.getfoundry.sh/) installed. If not, install Foundry by running:
   ```bash
   curl -L https://foundry.paradigm.xyz | bash
   foundryup
   ```

3. **Run the Tests**:
   Navigate to the repository directory and run the test:
   ```bash
   cd X_BlacklistableTest
   forge test
   ```

   To run a specific test with detailed output:
   ```bash
   forge test --mt testBlacklistedUserCanRenounceRole -vvvvv
   ```

## File Structure

- **`test/BlacklistableTest.t.sol`**: Contains the Forge test for the `Blacklistable` contract.
- **`src/Blacklistable.sol`**: Smart contract implementation.

## Test Description
The test validates the following:

1. A user is successfully added to the blacklist.
2. The blacklisted user can renounce their `BLACKLISTED_ROLE`.
3. After renouncing, the user is no longer blacklisted.

## Challenge Context
This test was created as part of the [PeterSRWeb3 Challenge](https://x.com/PeterSRWeb3/status/1878509764805554642). It demonstrates a use case involving role management and blacklisting mechanics in smart contracts.

---

For any questions, reach out to me on [X/Twitter](https://x.com/0xChaddB).

