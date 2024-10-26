// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract B {
    
    // Holds OORT (main balance) and sends to A on behalf of user
    function depositToA(address payable contractA) external {
        //require(address(this).balance >= amount, "Insufficient balance in contract B");
        
        // Call deposit on A with the specified amount
        (bool success, ) = contractA.call{value: address(this).balance}(
            abi.encodeWithSignature("deposit()")
        );
        require(success, "Deposit to contract A failed");
    }

    function depositB() external payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
    }
    receive() external payable {}
}