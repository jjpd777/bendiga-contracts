// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./ReligiousToken.sol";

contract OrthodoxToken is ReligiousToken {
    constructor() ReligiousToken("Orthodox Chistian Token", "B_ORTHODOX") {}
}