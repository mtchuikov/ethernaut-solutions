// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";

import "../src/task_29/Switch.sol";
import "../src/task_29/SwitchAttack.sol";

contract Task_29 is Test {
    Switch switch_;
    SwitchAttack switchAttack;

    function setUp() public {
        switch_ = new Switch();
        switchAttack = new SwitchAttack(address(switch_));
    }

    function test_SwitchAttack() public {
        switchAttack.run();
        assert(switch_.switchOn());
    }
}
