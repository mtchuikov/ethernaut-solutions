// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";

import "../src/task_25/Motorbike.sol";
import "../src/task_25/MotorbikeAttack.sol";

contract Test_22 is Test {
    Motorbike motorbike;
    Engine engine;
    MotorbikeAttack motorbikeAttack;

    function setUp() public {
        engine = new Engine();
        motorbike = new Motorbike(address(engine));

    }

    function test_MotorbikeAttack() public {
        bytes32 slot = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;
        address engineAddress = address(uint160(uint256(vm.load(address(motorbike), slot))));
        motorbikeAttack = new MotorbikeAttack(engineAddress);
        motorbikeAttack.run();
    }
}
