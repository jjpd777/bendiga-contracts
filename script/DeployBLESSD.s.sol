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
        
        // Create and sign ownership message
        string memory message = string.concat(
            "I hereby confirm that I am the owner of the contract at address: ",
            vm.toString(address(token))
        );
        
        bytes32 messageHash = keccak256(abi.encodePacked(
            "\x19Ethereum Signed Message:\n",
            bytes(message).length,
            message
        ));
        
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(deployerPrivateKey, messageHash);
        
        // Log the information needed for verification
        console.log("Contract Address:", address(token));
        console.log("Message to sign:", message);
        console.log("Signature components:");
        console.log("v:", v);
        console.log("r:", vm.toString(r));
        console.log("s:", vm.toString(s));
        
        vm.stopBroadcast();
    }
}