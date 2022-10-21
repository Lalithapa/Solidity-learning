// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;
contract balance{
    address payable toUser= payable(0x617F2E2fD72FD9D5503197092aC168c91465E7f2);
 function paybalance() public payable{

 }
 function getBalance() public view returns(uint){
     return address(this).balance;
 }
 function sendEther() public{
    toUser.transfer(1 ether);
 }
}