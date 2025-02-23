// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./ReligiousToken.sol";

contract BuddhismToken is ReligiousToken {
    constructor() ReligiousToken("Buddhism Token", "B_BUDDHIST") {}
}