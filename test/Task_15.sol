// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";

import {NaughtCoin} from "../src/task_15/NaughtCoin.sol";
import {NaughtCoinAttack} from "../src/task_15/NaughtCoinAttack.sol";

contract Task_15 is Test {
    NaughtCoin naughtCoin;
    NaughtCoinAttack naughtCoinAttack;

    address public eve;

    function setUp() public {
        eve = makeAddr("eve");

        vm.prank(eve);
        naughtCoin = new NaughtCoin(eve);
    }

    function test_NaughtCoinAttack() public {
        vm.prank(eve);
        naughtCoinAttack = new NaughtCoinAttack(address(naughtCoin));

        vm.prank(eve);
        naughtCoin.approve(address(naughtCoinAttack), type(uint256).max);

        naughtCoinAttack.run();
        assertEq(naughtCoin.balanceOf(eve), 0);
    }
}
