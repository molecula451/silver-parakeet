// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {A} from "src/DepositHandler.sol";
import {B} from "src/MainContract.sol";

contract DeployScript is Script {
    A internal handler;
    B internal mainContract;

    function run() public {
        vm.startBroadcast();
        
        handler = new A();
        mainContract = new B();
        
        vm.stopBroadcast();
        
        console.log("Contract A deployed at:", address(handler));
        console.log("Contract B deployed at:", address(mainContract));
    }
}
