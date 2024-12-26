// SPDX-License-Identifier: MIT


pragma solidity ^0.8.28;


contract Visibility{
    // Public allow anyone to see the function and use it even if 
    // Also other contract can use it
    // The wallat you deploy the smart contract on.
    string public  hi = "Hi mohe";
    function getString() public view returns (string memory){
        return hi;
    }

    // Private allow you to use the function or the var inside the contract only
    function changeString() private  returns (string memory){
        hi = "Hello mom";
        return hi ;
    }

    //internal this can be used in the contract and the inherent contracrs
    function returnString() internal returns (string memory){
        hi = "Hi mohe";
        return hi ;
    }

    // external like saying we allow for external contracts to access it.
    function helloOutSide() external returns (string memory){
        hi = "Hi everyone";
        return hi ;
    }
}
