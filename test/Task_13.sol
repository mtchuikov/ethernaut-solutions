// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";

import "../src/task_13/GatekeeperOne.sol";
import "../src/task_13/GatekeeperOneAttack.sol";

contract Task_13 is Test {
    GatekeeperOne gatekeeperOne;
    GatekeeperOneAttack gatekeeperOneAttack;

    function setUp() public {
        gatekeeperOne = new GatekeeperOne();
        gatekeeperOneAttack = new GatekeeperOneAttack(address(gatekeeperOne));
    }

    function test_GatekeeperOneAttack() public {
        gatekeeperOneAttack.run();
        assertEq(tx.origin, gatekeeperOne.entrant());
    }
}
