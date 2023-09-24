// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

import {Recovery} from "../src/task_17/Recovery.sol";
import {RecoveryAttack} from "../src/task_17/RecoveryAttack.sol";

contract Task_17 is Test {
    Recovery recovery;
    RecoveryAttack recoveryAttack;

    address public eve;

    function setUp() public {
        eve = makeAddr("eve");

        vm.setNonce(eve, 5);

        vm.prank(eve);
        recovery = new Recovery();
    }

    function test_RecoveryAttack() public {
        recoveryAttack = new RecoveryAttack(eve, 5);

        vm.prank(eve);
        address recoveredAddress = recoveryAttack.run();

        assertEq(address(recovery), recoveredAddress);
    }
}
