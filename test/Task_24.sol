// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";

import {PuzzleProxy, PuzzleWallet} from "../src/task_24/PuzzleWallet.sol";
import {IPuzzleProxy} from "../src/task_24/IPuzzleProxy.sol";
import {PuzzleWalletAttack} from "../src/task_24/PuzzleWalletAttack.sol";

contract Task_24 is Test {
    PuzzleProxy puzzleProxy;
    PuzzleWallet puzzleWallet;
    IPuzzleProxy _IPuzzleProxy;
    PuzzleWalletAttack puzzleWalletAttack;

    address alice;
    address eve;

    function setUp() public {
        alice = makeAddr("alice");

        vm.startPrank(alice);
        puzzleWallet = new PuzzleWallet();

        bytes memory null_;
        puzzleProxy = new PuzzleProxy(address(alice), address(puzzleWallet), null_);
        _IPuzzleProxy = IPuzzleProxy(address(puzzleProxy));

        vm.stopPrank();

        eve = makeAddr("eve");

        vm.prank(eve);
        puzzleWalletAttack = new PuzzleWalletAttack(payable(address(puzzleProxy)));
    }

    function test_PuzzleWalletAttack() public {
        deal(eve, 2 ether);
        deal(address(_IPuzzleProxy), 3 ether);

        vm.prank(eve);
        puzzleWalletAttack.run{value: 1 ether}();

        assertEq(eve, _IPuzzleProxy.admin());
    }
}
