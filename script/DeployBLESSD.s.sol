// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/BLESSDToken.sol";

contract DeployBLESSD is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        
        vm.startBroadcast(deployerPrivateKey);
        
        // Deploy the contract
        BLESSDToken token = new BLESSDToken();
        
        // Fund the contract with some tokens for distribution
        token.fundContract(1000e18); // Fund with 1000 tokens initially
        
        vm.stopBroadcast();

        console.log("BLESSD Token deployed to:", address(token));
    }
}