// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract Greeting {
    string public greeting = "Hello, World!";
    

    function getGreeting() public view returns (string memory) {
        return greeting;
    }

    function add(int number1, int number2) public pure returns (int) {
        return number1 + number2;
    }
}

