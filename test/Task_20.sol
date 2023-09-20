// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

import {Denial} from "../src/task_20/Denial.sol";
import {DenialAttack} from "../src/task_20/DenialAttack.sol";

contract Task_11 is Test {
    Denial denial;
    DenialAttack denialAttack;

    address public eve;

    function setUp() public {
        eve = makeAddr("eve");

        vm.prank(eve);
        denial = new Denial();
    }

    function test_DenialAttack() public {
        address denialAddress = address(denial);
        deal(denialAddress, 5 ether);

        vm.prank(eve);
        denialAttack = new DenialAttack(payable(denialAddress));

        vm.prank(eve);
        denialAttack.run();

        denial.withdraw();

        assertEq(address(denialAttack).balance, 0);
    }
}
