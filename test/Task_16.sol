// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";

import {Preservation} from "../src/task_16/Preservation.sol";
import {PreservationAttack} from "../src/task_16/PreservationAttack.sol";

contract Task_16 is Test {
    Preservation preservation;
    PreservationAttack preservationAttack;

    address public alice;
    address public eve;

    function setUp() public {
        eve = makeAddr("eve");

        vm.prank(eve);
        preservationAttack = new PreservationAttack();

        alice = makeAddr("alice");

        address preservationAttackAddress = address(preservationAttack);

        vm.prank(alice);
        preservation = new Preservation(preservationAttackAddress, preservationAttackAddress);
    }

    function test_PreservationAttack() public {
        vm.prank(alice);
        preservation.setFirstTime(block.timestamp);

        assertEq(preservation.owner(), eve);
    }
}
