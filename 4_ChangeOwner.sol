// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ChangeOwner{
    uint256 public phone;
   
    function changeOwnerName(uint256 number) public{
      phone=number;
    }
      function retrieve() public view returns (uint256){
        return phone;
    }
}