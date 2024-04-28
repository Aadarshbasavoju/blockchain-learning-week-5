# Smart Contract Bug Identification and Correction

## Overview
This repository contains smart contracts for Part 1 of the assignment. The goal is to identify potential bugs in the provided contracts and correct them. Additionally, simple smart contracts are developed to exploit the identified bugs for testing purposes.

## Part 1 - Find Bugs & Correct the Contract
- Two smart contracts (`Exercise_1.sol` and `Exercise_2.sol`) are provided, each containing potential vulnerabilities.
- The task involves identifying the bugs in the contracts and writing exploit contracts/tests to demonstrate the vulnerabilities.
- Corrected versions of the contracts (`Exercise_1_Corrected.sol` and `Exercise_2_Corrected.sol`) are provided to address the identified vulnerabilities.

## Folder Structure
- `contracts`: Contains the original and corrected versions of the smart contracts.
- `tests`: Contains test scripts to validate the contracts and ensure the corrections are effective.

## Instructions
1. Review the provided contracts (`Exercise_1.sol` and `Exercise_2.sol`) to identify potential bugs.
2. Write test scripts to exploit the identified bugs and validate the vulnerabilities.
3. Implement corrections in the contracts (`Exercise_1_Corrected.sol` and `Exercise_2_Corrected.sol`) to address the identified vulnerabilities.
4. Run test scripts to ensure that the corrected contracts behave as expected and the vulnerabilities are mitigated.

---

# Voting System Smart Contract

## Overview
This repository contains the smart contract and interaction script for Part 2 of the assignment. The objective is to develop a sophisticated smart contract for a simple voting system and interact with it using ethers.js.

## Part 2 - Develop a Simple Smart Contract, Deploy, and Interact using ethers.js
- The smart contract (`VotingSystem.sol`) implements a voting system where users can cast votes for candidates.
- Advanced Solidity features are showcased, including state variables, functions, modifiers, and events.
- The contract is tested using Hardhat and deployed on the Polygon Mumbai testnet.
- An interaction script (`interact.js`) is provided to interact with the deployed contract, read state variables, and cast votes.



## Instructions
1. Review the smart contract code (`VotingSystem.sol`) to understand the voting system implementation.
2. Compile and test the contract using Hardhat to ensure correct behavior.
3. Deploy the contract on the Polygon Mumbai testnet using ethers.js.
4. Use the provided interaction script (`interact.js`) to interact with the deployed contract, read state variables, and cast votes.
5. Ensure that the contract functions as expected and handles edge cases properly.
