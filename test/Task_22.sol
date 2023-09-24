// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";

import {Dex, SwappableToken} from "../src/task_22/Dex.sol";
// import {DexAttack} from "../src/task_22/DexAttack.sol";

contract Task_22 is Test {
    SwappableToken token1;
    SwappableToken token2;
    Dex dex;
    // DexAttack dexAttack;

    address public eve;

    function setUp() public {
        dex = new Dex();

        token1 = new SwappableToken(address(dex), "token1", "TOKEN1", 1e6);
        token2 = new SwappableToken(address(dex), "token2", "TOKEN2", 1e6);

        dex.setTokens(address(token1), address(token2));
    }

    function test_DexAttack() public {}
}
