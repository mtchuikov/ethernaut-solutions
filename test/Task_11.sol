// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

import {Elevator} from "../src/task_11/Elevator.sol";
import {ElevatorAttack} from "../src/task_11/ElevatorAttack.sol";

contract Task_11 is Test {
    Elevator elevator;
    ElevatorAttack elevatorAttack;

    address public alice;
    address public eve;

    function setUp() public {
        alice = makeAddr("alice");

        vm.prank(alice);
        elevator = new Elevator();

        eve = makeAddr("eve");
    }

    function test_GoodSamaritanAttack() public {
        vm.prank(eve);
        elevatorAttack = new ElevatorAttack(address(elevator));

        elevatorAttack.run();
        assert(elevator.top());
    }
}
