// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

contract enums {
    enum users {
        allowed,
        notAllowed,
        wait
    }
    users public isAllowed = users.allowed;
    uint256 public lottery = 1000;
    function checkEligibility() public{
        if (isAllowed == users.allowed) {
            lottery = 0;
        }else{
            lottery=1000;
        }
    }

}
