// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

contract array{
 uint[] public arr;
    
      function length() public view returns(uint){
       return arr.length;
    }
    function adding(uint valueAdd) public{
        arr.push(valueAdd);
    }
    function deleting() public{
        arr.pop();
    }
  
}