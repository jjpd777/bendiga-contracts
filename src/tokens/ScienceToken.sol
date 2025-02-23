// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./ReligiousToken.sol";

contract ScienceToken is ReligiousToken {
    constructor() ReligiousToken("Science Token", "B_ATHEIST") {}
}