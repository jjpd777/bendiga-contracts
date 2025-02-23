// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console2} from "forge-std/Script.sol";
import {ReligiousToken} from "../src/tokens/ReligiousToken.sol";

contract CheckReligiousTokenBalances is Script {
    // Token addresses from deployment
    address[] private tokens = [
        0x908BE4717360397348F35271b9461192B6c84522, // Christianity
        0xC1b3a96113aC409fe3a40126962c74aEBccDda62, // Orthodox
        0x848B9D2d07C601706ff86b7956579bDFB9Bc0635, // Judaism
        0x723da9e13D5519a63a5cbC8342B4e4c3aE1eEb8A, // Islam
        0x840934539c988fA438f005a4B94234E50f5D6c4a, // Sikhism
        0x5b1b84197a2235C67c65E0Ec60f891A6975bcb95, // Hinduism
        0x2AC26A1380B3eBbe4149fbcAf61e88D0304688d7, // Science
        0xd01366ca8642a0396c4e909feb8c5E9Ec3A00F65  // Buddhism
    ];
    string[] private tokenNames = [
        "Christianity", "Orthodox", "Judaism", "Islam",
        "Sikhism", "Hinduism", "Science", "Buddhism"
    ];

    function run() public {
        // Get the deployer address from private key
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployer = vm.addr(deployerPrivateKey);

        console2.log("Checking balances for address:", deployer);
        console2.log("----------------------------------------");

        for (uint i = 0; i < tokens.length; i++) {
            ReligiousToken token = ReligiousToken(tokens[i]);
            uint256 balance = token.balanceOf(deployer);
            uint256 contractBalance = token.balanceOf(address(token));
            
            console2.log(tokenNames[i], "Token:");
            console2.log("  Address:", address(token));
            console2.log("  Your Balance:", balance / 1e18, "tokens");
            console2.log("  Contract Balance:", contractBalance / 1e18, "tokens");
            console2.log("----------------------------------------");
        }
    }
}