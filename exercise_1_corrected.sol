pragma solidity ^0.8.0;

contract Exercise_1_Corrected {
    mapping(address => uint256) public balances; // Mapping to store user balances
    mapping(address => bool) public locked; // Mapping to track locked accounts

    // Function to deposit funds into user's balance
    function deposit(address user, uint256 amount) public {
        balances[user] += amount; // Add deposited amount to user's balance
    }

    // Function to withdraw funds from user's balance
    function withdraw(address user, uint256 amount) public {
        // Ensure sufficient balance and account not locked
        require(amount <= balances[user], "Insufficient balance");
        require(!locked[user], "Account locked");

        // Deduct withdrawn amount from user's balance
        balances[user] -= amount;
    }

    // Function to lock user's account
    function lockAccount(address user) public {
        locked[user] = true; // Set account status to locked
    }

    // Function to unlock user's account
    function unlockAccount(address user) public {
        locked[user] = false; // Set account status to unlocked
    }
}
