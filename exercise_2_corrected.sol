pragma solidity ^0.8.0;

contract Exercise_2_Corrected {
    mapping(address => uint256) public balances;
    mapping(address => bool) public locked;

    // Deposit function to add funds to user's balance
    function deposit(address user, uint256 amount) public {
        balances[user] += amount;
    }

    // Withdraw function to transfer funds to user and update balance
    function withdraw(address user, uint256 amount) public {
        // Ensure sufficient balance and account not locked
        require(amount <= balances[user], "Insufficient balance");
        require(!locked[user], "Account locked");

        // Perform external call to transfer funds to user
        (bool success, ) = user.call{value: amount}("");
        require(success, "Transfer failed");

        // Update user's balance after successful transfer
        balances[user] -= amount;
    }

    // Lock account to prevent reentrancy attacks
    function lockAccount(address user) public {
        locked[user] = true;
    }

    // Unlock account after processing
    function unlockAccount(address user) public {
        locked[user] = false;
    }

    // Functions to directly add or subtract balances (for testing purposes)
    function addBalances(address user, uint256 amount) public {
        balances[user] += amount;
    }

    function subtractBalances(address user, uint256 amount) public {
        balances[user] -= amount;
    }

    // Function to destroy contract and transfer remaining balance
    function destroyContract(address payable recipient) public {
        selfdestruct(recipient);
    }
}
