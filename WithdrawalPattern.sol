// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract WithdrawalPattern {
    address public owner;
    mapping(address => uint) public balance;
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    //Safe - Allow addresses to claimRefunds/withdrawfunds using the withdraw pattern
    function withdrawFunds(uint amount) public returns (bool success){
        require(balance[msg.sender] >= amount);
        balance[msg.sender] -= amount; //optimistic accounting
        payable(msg.sender).transfer(amount); //transfer
        return true;
    }
}
