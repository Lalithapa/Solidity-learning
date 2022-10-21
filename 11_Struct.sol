// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

 struct Student{
     uint rollNo;
     string name;
 }
 contract example{
     Student public details;
     constructor(uint _roll, string memory _name){
         details.rollNo=_roll;
         details.name= _name;
     }
      function changeDetails(uint _roll, string memory _name) public{
            details.rollNo=_roll;
         details.name= _name;
      }
 }