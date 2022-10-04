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

    //Not Safe to send refunds to addresses
    function sendRefund() public onlyOwner returns (bool success) {}

    //Safe - Allow addresses to claimRefunds/withdraw
    function withdraw() public view returns (bool success){
        require(balance[msg.sender] > 0);
        msg.sender.transfer(balance[msg.sender]);
    }
}
