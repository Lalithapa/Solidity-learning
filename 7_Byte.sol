// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

contract myByte{
    bytes public name= "abc";
    
    function addByte() public{
      name.push('d');
    }
    function getIndex(uint i) public view returns(bytes1){
      return name[i];
    }
    function getLength() public view returns(uint){
      return name.length;
    }
}