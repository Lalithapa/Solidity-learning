// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;
contract whileLoop{
    uint[10] public arr;
    uint public count;
    function looping() public{
        // while(count < arr.length){
        //     arr[count]=count;
        //     count++;
        // }///while loop
        //  for(uint i= count ;i < arr.length;count++){
        //     arr[count]=count;
        // }///for  loop
        do{
            arr[count]=count;
            count++;
        }while(count < arr.length); //do while
    }
}