// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IPuzzleProxy {
    function admin() external view returns (address);
    function proposeNewAdmin(address) external;
    function maxBalance() external view returns (uint256);
    function init(uint256) external;
    function setMaxBalance(uint256) external;
    function addToWhitelist(address) external;
    function deposit() external payable;
    function execute(address, uint256, bytes calldata) external payable;
    function multicall(bytes[] calldata) external payable;
}
