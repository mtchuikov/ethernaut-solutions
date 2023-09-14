// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

import {King} from "../src/task_9/King.sol";
import {KingAttack} from "../src/task_9/KingAttack.sol";


contract Task_9 is Test {
    King king;
    KingAttack kingAttack;

    address public alice;
    address public bob;
    address public dave;
    address public chunk;

    function setUp() public {
        alice = makeAddr("alice");
        
        vm.prank(alice);
        king = new King();

        bob = makeAddr("bob");
        dave = makeAddr("ted");
        chunk = makeAddr("chunk");
    }

    function test_KingAttack() public {
        deal(bob, 1 ether);

        vm.prank(bob);
        (bool ok, ) = address(king).call{value: 1 ether}("");
        require(ok, "Call failed");

        assertEq(king._king(), bob);
        
        deal(dave, 2 ether);

        vm.prank(dave);
        kingAttack = new KingAttack{value: 2 ether}(payable(address(king)));
        
        assertEq(king._king(), address(kingAttack));

        deal(chunk, 3 ether);

        vm.prank(chunk);
        (ok, ) = address(king).call{value: 3 ether}("");
        
        assertEq(ok, false);     
    }
}
