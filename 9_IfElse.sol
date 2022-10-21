// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

contract IfElse{

    function checkZero(int num) public pure returns(string memory){
        string memory result;
        if(num > 0){
            result="Greater than Zero";
        }else if(num ==0){
            result="Equal than Zero";
        }else{
            result="Less than Zero";
        }
        return result;
    }
}