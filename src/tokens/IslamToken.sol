// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./ReligiousToken.sol";

contract IslamToken is ReligiousToken {
    constructor() ReligiousToken("Islam Token", "B_MUSLIM") {}
}