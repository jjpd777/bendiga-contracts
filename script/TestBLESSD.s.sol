// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/BLESSDToken.sol";

contract TestBLESSD is Script {
    function run() external {
        uint256 testWalletKey = vm.envUint("TEST_WALLET_KEY");
        // Replace with your deployed contract address
        address tokenAddress = address(0x/* deployed contract address */);
        
        vm.startBroadcast(testWalletKey);
        
        BLESSDToken token = BLESSDToken(tokenAddress);
        
        // Try to claim tokens
        token.claimTokens();
        
        // Check balance
        uint256 balance = token.balanceOf(vm.addr(testWalletKey));
        console.log("Test wallet balance:", balance);
        
        vm.stopBroadcast();
    }
}