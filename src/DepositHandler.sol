// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract A {
    event Deposited(address indexed from, uint256 amount);

    function deposit() external payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        emit Deposited(msg.sender, msg.value);
    }

    function contractBalance() public view returns(uint256) {
        return address(this).balance;
    }
}
