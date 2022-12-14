// SPDX-License-Identifier:MIT
pragma solidity ^0.8.8;
import './PriceConverter.sol';
 error notOwner(); //custom error handling to gas optimization
contract FundMe{
     address public immutable i_owner;
    constructor(){
       i_owner= msg.sender;
    }
    using PriceConverter for uint256;   //Taken from PriceConverter library
    //constant and immutable make the code gas efficient;
    uint public constant minimumUsd=50 *1e18; // constant keyword make the code gas efficient
   address[] public funders;// to track the sender address
    mapping(address=>uint256) public addressAmtFunded;
    function fund() public payable{
        // as using library we have to use the parameter first and then tghe funtion calls is the 2nd parameter
        //X- getConversionRate(msg.value)
        //using Library-msg.value.getConversionRate();
        require(msg.value.getConversionRate() >=minimumUsd ,"Didntsend enough!"); // 1e18 means 1 Ether
        //this is if else Condition , if 1st condition is false then the next
        // will happen and the transaction will undo/ revert and all the trasaction will be undone
        funders.push(msg.sender);
        addressAmtFunded[msg.sender] += msg.value;
    } 
    //oracle and chainlink- we have to use decentralized oracle to get the price of 1 ether into rs
    // blockchain oracle - any device that interacts with the off-chain world to  provide data or computational to the smart contracts.ink 
     function widthdraw() public onlyOwner{
        //  starting index; ending Index; step
         for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder= funders[funderIndex];
            addressAmtFunded[funder]=0;
         }
         funders= new address[](0);

        //  3 methods to transfer amount 
        // 1)transfer 
            //  payable( msg.sender).transfer(address(this).balance);
        //2) send
            // bool SuccessFul= payable( msg.sender).transfer(address(this).balance);
            // require(SuccessFul," Sending Failed");
        //3)  call  (Recommended)
         (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
         require(callSuccess,"Call Failed");
     }
     modifier onlyOwner(){
        //  _; at starting this means first check the code and the do require
    // require(msg.sender == i_owner,"You're not the Owner");
    if(msg.sender != i_owner){revert notOwner();}
    _; // this means- do the rest of the code after checking the require;
     }
      // Function to receive Ether. msg.data must be empty
      //if someone accidently send ether it will go and revert back
    receive() external payable {
        fund();
    }

    // Fallback function is called when msg.data is not empty
    fallback() external payable {
        fund();
    }
}