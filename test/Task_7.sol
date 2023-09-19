// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

import {Force} from "../src/task_7/Force.sol";
import {ForceAttack} from "../src/task_7/ForceAttack.sol";

contract Task_7 is Test {
    Force force;
    ForceAttack forceAttack;

    address public alice;
    address public eve;

    function setUp() public {
        alice = makeAddr("alice");

        vm.prank(alice);
        force = new Force();

        eve = makeAddr("eve");
    }

    function test_ForceAttack() public {
        deal(eve, 1 ether);

        vm.prank(eve);
        address forceAddress = address(force);
        forceAttack = new ForceAttack{value: 1 ether}(payable(forceAddress));

        assertNotEq(forceAddress.balance, 0);
    }
}
