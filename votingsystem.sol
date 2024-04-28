// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    address public owner; // Address of the contract owner
    string[] public candidates; // Array of candidate names
    mapping(address => bool) public voters; // Mapping to track whether an address has voted or not
    mapping(uint256 => uint256) public votesReceived; // Mapping to store the vote count for each candidate

    // Event to log each vote with the address of the voter and the index of the candidate they voted for
    event Voted(address indexed voter, uint256 candidateIndex);

    // Modifier to ensure only the contract owner can perform administrative tasks
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    // Constructor to initialize the contract owner and set up the list of candidates
    constructor(string[] memory _candidates) {
        owner = msg.sender;
        candidates = _candidates;
    }

    // Function to allow a voter to cast their vote for a candidate
    function vote(uint256 candidateIndex) public {
        require(!voters[msg.sender], "You have already voted");

        require(candidateIndex < candidates.length, "Invalid candidate index");

        votesReceived[candidateIndex]++;
        voters[msg.sender] = true;

        emit Voted(msg.sender, candidateIndex);
    }

    // Function to check the total number of votes received by a specific candidate
    function getTotalVotes(uint256 candidateIndex) public view returns (uint256) {
        require(candidateIndex < candidates.length, "Invalid candidate index");
        return votesReceived[candidateIndex];
    }

    // Function to check if a specific address has already voted
    function hasVoted(address voter) public view returns (bool) {
        return voters[voter];
    }

    // Function to add a new candidate (only accessible by the contract owner)
    function addCandidate(string memory candidateName) public onlyOwner {
        candidates.push(candidateName);
    }

    // Function to remove a candidate (only accessible by the contract owner)
    function removeCandidate(uint256 index) public onlyOwner {
        require(index < candidates.length, "Invalid candidate index");
        require(votesReceived[index] == 0, "Cannot remove candidate with votes");
        
        for (uint256 i = index; i < candidates.length - 1; i++) {
            candidates[i] = candidates[i + 1];
        }
        candidates.pop();
    }

    // Function to transfer ownership of the contract (only accessible by the current owner)
    function transferOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }
}
