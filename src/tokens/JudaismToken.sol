// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./ReligiousToken.sol";

contract JudaismToken is ReligiousToken {
    constructor() ReligiousToken("Judaism Token", "B_JEWISH") {}
}