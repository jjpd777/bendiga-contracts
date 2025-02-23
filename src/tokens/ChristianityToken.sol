// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./ReligiousToken.sol";

contract ChristianityToken is ReligiousToken {
    constructor() ReligiousToken("Christianity Token", "B_CHRISTIAN") {}
}