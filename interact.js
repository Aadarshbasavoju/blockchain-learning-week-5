const { ethers } = require("ethers");
const fs = require("fs");

async function main() {
    const privateKey = "YOUR_PRIVATE_KEY";
    const provider = new ethers.providers.JsonRpcProvider("YOUR_RPC_URL");
    const wallet = new ethers.Wallet(privateKey, provider);

    const contractAddress = "YOUR_CONTRACT_ADDRESS";
    const abi = JSON.parse(fs.readFileSync("VotingSystem.json"));

    const contract = new ethers.Contract(contractAddress, abi, wallet);

    // Read state variables
    const owner = await contract.owner();
    console.log("Owner:", owner);

    const candidates = await contract.candidates();
    console.log("Candidates:", candidates);

    // Cast vote
    const candidateIndex = 0; // Index of the candidate to vote for
    await contract.vote(candidateIndex);
    console.log("Voted for candidate at index", candidateIndex);

    // Check if address has voted
    const hasVoted = await contract.hasVoted(wallet.address);
    console.log("Has voted:", hasVoted);

    // Get total votes for a candidate
    const totalVotes = await contract.getTotalVotes(candidateIndex);
    console.log("Total votes for candidate at index", candidateIndex, ":", totalVotes);
}

main().then(() => process.exit(0)).catch(error => {
    console.error(error);
    process.exit(1);
});
