// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract B {

    receive() external payable {}
    
    // Holds OORT (main balance) and sends to A on behalf of user
    function depositToA(address payable contractA, uint256 amount) external {
        require(address(this).balance >= amount, "Insufficient balance in contract B");
        
        // Call deposit on A with the specified amount
        (bool success, ) = contractA.call{value: amount}(
            abi.encodeWithSignature("deposit()")
        );
        require(success, "Deposit to contract A failed");
    }

    function depositB() external payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
    }
}