// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

contract Boolean{
    bool public isFit=true;
    bool public value;
    function changeFitness()public{
         isFit=!isFit;
    }
    function checkGreater(int num) public returns(bool){
        
        if(num == 0){
            value=true;
            return value;
        }else{
            value= false;
              return value;
        }
    }
}