pragma solidity ^0.8.9;

contract Safe {
    receive() external payable {}

    constructor() {}

    string[] publishers;
    string[] players;

    mapping(string => uint256) public balances;
    uint counter = 0;

    function createPublisher(string memory name) public {
        publishers.push(name);
        balances[name] = 1; // this is 1 MATIC from the holding fee
    }

    function createPlayer(string memory name) public {
        players.push(name);
    }

    function deposit(string memory name) public payable { //the parameter here is the publisher name to be paid
        balances[name] += msg.value;
    }

    function distribute(uint256 amount, string memory name) public {//the parameter is the name of the account to be paid
        for(int i = 0; i < publishers.length; i++) {
            while(balances[publishers[i]] > 1) {
                payable(name).transfer(amount)-tx.gasprice;
                balances[name] -= amount;
            }
            payable(players[i]).transfer(amount);
        }
        
        payable(msg.sender).transfer(amount);
    }

    function getBalance(string memory name) public view returns (uint) {
        return balances[name];
    }

    function getPublishers() public view returns (string[] memory) {
        return publishers;
    }
}