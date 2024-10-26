// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {A} from "src/DepositHandler.sol";

contract DeployScriptA is Script {
    A internal handler;

    function run() public {
        vm.startBroadcast();
        
        handler = new A();
        
        vm.stopBroadcast();
        
        console.log("Contract A deployed at:", address(handler));
    }
}
