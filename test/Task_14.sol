// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";

import "../src/task_14/GatekeeperTwo.sol";
import "../src/task_14/GatekeeperTwoAttack.sol";

contract Task_13 is Test {
    GatekeeperTwo gatekeeperTwo;
    GatekeeperTwoAttack gatekeeperTwoAttack;

    function setUp() public {
        gatekeeperTwo = new GatekeeperTwo();
    }

    function test_GatekeeperTwoAttack() public {
        gatekeeperTwoAttack = new GatekeeperTwoAttack(address(gatekeeperTwo));
        assertEq(gatekeeperTwo.entrant(), tx.origin);
    }
}
