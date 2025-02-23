// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/tokens/ChristianityToken.sol";
import "../src/tokens/OrthodoxToken.sol";
import "../src/tokens/JudaismToken.sol";
import "../src/tokens/IslamToken.sol";
import "../src/tokens/SikhismToken.sol";
import "../src/tokens/HinduismToken.sol";
import "../src/tokens/ScienceToken.sol";
import "../src/tokens/BuddhismToken.sol";

contract DeployReligiousTokens is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // Deploy all tokens
        ChristianityToken christ = new ChristianityToken();
        OrthodoxToken orthx = new OrthodoxToken();
        JudaismToken judao = new JudaismToken();
        IslamToken islam = new IslamToken();
        SikhismToken sikh = new SikhismToken();
        HinduismToken hindu = new HinduismToken();
        ScienceToken sci = new ScienceToken();
        BuddhismToken buddha = new BuddhismToken();

        // Log all addresses
        console.log("\nDeployed Token Addresses:");
        console.log("=======================");
        console.log("Christianity Token:", address(christ));
        console.log("Orthodox Token:", address(orthx));
        console.log("Judaism Token:", address(judao));
        console.log("Islam Token:", address(islam));
        console.log("Sikhism Token:", address(sikh));
        console.log("Hinduism Token:", address(hindu));
        console.log("Science Token:", address(sci));
        console.log("Buddhism Token:", address(buddha));

        vm.stopBroadcast();
    }
}