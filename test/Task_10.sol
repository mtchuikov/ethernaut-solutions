// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

import {Reentrance} from "../src/task_10/Reentrance.sol";
import {ReentranceAttack} from "../src/task_10/ReentranceAttack.sol";


contract Task_10 is Test {
    Reentrance reentrance;
    ReentranceAttack reentranceAttack;

    address public alice;
    address public bob;
    address public dave;
    address public eve;

    function setUp() public {
        alice = makeAddr("alice");
        
        vm.prank(alice);
        reentrance = new Reentrance();

        bob = makeAddr("bob");
        dave = makeAddr("ted");
        eve = makeAddr("eve");
    }

    function test_ReentranceAttack() public {
        deal(bob, 2.1 ether);
        vm.prank(bob);
        reentrance.donate{value: bob.balance}(bob);

        deal(dave, 7.4 ether);
        vm.prank(dave);
        reentrance.donate{value: dave.balance}(dave);
        
        deal(eve, 1 ether);

        vm.prank(eve);
        reentranceAttack = new ReentranceAttack(payable(address(reentrance)));

        vm.prank(eve);
        reentranceAttack.run{value: 1 ether}();    

        console.log(address(reentranceAttack).balance);     
        console.log(address(reentrance).balance);     
    }
}