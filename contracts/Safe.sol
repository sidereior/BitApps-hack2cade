pragma solidity ^0.8.9;

contract Safe {
    receive() external payable {}

    constructor() {}

    address[] publishers;
    address[] players;

    mapping(address => uint256) public balances;//need to set size?
    uint counter = 0;

    function createPublisher() public {
        publishers.push(msg.sender);
        balances[msg.sender] = 0;
    }

    function createPlayer() public {
        players.push(msg.sender);
    }

    function deposit(address memory name) public payable { //the parameter here is the publisher name to be paid
        balances[name] += msg.value;
        //cases where the deposit function should be used:
        //1. when a publisher uploads an app
        //2. when a player purchars an app
    }

    function distribute(uint256 amount, address memory name) public {//the parameter is the name of the account to be paid
        balances[name] -= amount;
        payable(name).transfer(amount);
        //cases where the distribute function should be used:
        //1. when a player purchases an app, the publisher ping restapi to call this and should be paid the amount equal to the price of the app
    }

    function getBalance(address memory name) public view returns (uint) {
        return balances[name];
    }

    function getPublishers() public view returns (address[] memory) {
        return publishers;
    }
}