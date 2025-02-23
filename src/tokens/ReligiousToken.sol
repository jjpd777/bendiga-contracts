// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ReligiousToken is ERC20, Ownable {
    mapping(address => uint256) public lastClaimTime;
    uint256 public constant CLAIM_AMOUNT = 1e18;
    uint256 public constant CLAIM_COOLDOWN = 1 minutes;
    uint256 public constant INITIAL_SUPPLY = 1_000_000_000e18;
    uint256 public constant OWNER_ALLOCATION = 22_000_000e18;

    constructor(string memory name, string memory symbol) ERC20(name, symbol) Ownable(msg.sender) {
        _mint(address(this), INITIAL_SUPPLY - OWNER_ALLOCATION);
        _mint(msg.sender, OWNER_ALLOCATION);
    }

    function claimTokens() external {
        require(block.timestamp >= lastClaimTime[msg.sender] + CLAIM_COOLDOWN, "Too soon to claim again");
        require(balanceOf(address(this)) >= CLAIM_AMOUNT, "Insufficient tokens in contract");
        
        lastClaimTime[msg.sender] = block.timestamp;
        _transfer(address(this), msg.sender, CLAIM_AMOUNT);
    }
}
