// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

contract Identifier{
    string public name;
    uint public age;
    uint8 public rollNo = 255;
    // constructor(string memory initialName, uint initialAge){
    //     name= initialName;
    //     age=initialAge;
    // }

    // function getName() view public returns(string memory){
    //     return name;
    // }
    //   function getAge() view public returns(uint ){
    //     return age;
    // }

    function changeAge(uint setAge) public{
      age= setAge;
    }
     function changeName(string memory setName) public{
      name= setName;
    }
    function incrementNo() public{
      rollNo++;
    }
}