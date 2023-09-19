// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

import {Coin, GoodSamaritan} from "../src/task_27/GoodSamaritan.sol";
import {GoodSamaritanAttack} from "../src/task_27/GoodSamaritanAttack.sol";

contract Task_27 is Test {
    GoodSamaritan goodSamaritan;
    GoodSamaritanAttack goodSamaritanAttack;

    address public alice;
    address public eve;

    function setUp() public {
        alice = makeAddr("alice");

        vm.prank(alice);
        goodSamaritan = new GoodSamaritan();

        eve = makeAddr("eve");
    }

    function test_GoodSamaritanAttack() public {
        deal(eve, 1 ether);

        address goodSamaritanAddress = address(goodSamaritan);

        vm.prank(eve);
        goodSamaritanAttack = new GoodSamaritanAttack(goodSamaritanAddress);

        goodSamaritanAttack.run();
        assertEq(Coin(goodSamaritan.coin()).balances(goodSamaritanAddress), 0);
    }
}
