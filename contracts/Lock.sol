pragma solidity ^0.8.9;

contract Vault {
    receive() external payable {}

    constructor() {}

    string[] companies;

    mapping(string => uint256) public balances;
    uint counter = 0;

    function createCompany(string memory name) public {
        companies.push(name);
        balances[name] = 0;
    }

    function deposit(string memory name) public payable {
        balances[name] += msg.value;
    }

    function distribute(uint256 amount, string memory name) public {
        balances[name] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function getBalance(string memory name) public view returns (uint) {
        return balances[name];
    }

    function getCompanies() public view returns (string[] memory) {
        return companies;
    }
}