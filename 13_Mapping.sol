// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

contract mapped {
    struct details {
        string name;
        uint256 class;
    }
    mapping(uint256 => details) public students;

    function addStudent(
        uint256 _roll,
        string memory _names,
        uint256 _class
    ) public {
        students[_roll] = details( _names,_class);
    }
}
