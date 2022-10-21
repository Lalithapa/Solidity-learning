// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

 contract feature{
     function initial() public view returns(uint block_no , uint timestamp, address msgSender,uint chainid,uint difficulty){
         return (block.number,block.timestamp,msg.sender,block.chainid,block.difficulty);
     }
 }