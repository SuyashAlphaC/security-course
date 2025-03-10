// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import {Test} from "forge-std/Test.sol";

contract Counter is Test {
    function setUp() public {
        vm.createSelectFork({blockNumber: 0, urlOrAlias: "sepolia"});
    }
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}
