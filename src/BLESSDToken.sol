// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BLESSDToken is ERC20, Ownable {
    mapping(address => uint256) public lastClaimTime;
    uint256 public constant CLAIM_AMOUNT = 1e18; // 1 token with 18 decimals
    uint256 public constant CLAIM_COOLDOWN = 10 minutes;
    uint256 public constant INITIAL_SUPPLY = 100_000_000e18; // 100 million tokens

    constructor() ERC20("BLESSD", "BLESSD") Ownable(msg.sender) {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function claimTokens() external {
        require(block.timestamp >= lastClaimTime[msg.sender] + CLAIM_COOLDOWN, "Too soon to claim again");
        require(balanceOf(address(this)) >= CLAIM_AMOUNT, "Insufficient tokens in contract");
        
        lastClaimTime[msg.sender] = block.timestamp;
        _transfer(address(this), msg.sender, CLAIM_AMOUNT);
    }

    function fundContract(uint256 amount) external {
        _transfer(msg.sender, address(this), amount);
    }
}