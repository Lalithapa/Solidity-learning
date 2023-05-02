//SPDX-License-Identifier:MIT 
pragma solidity ^0.8.9;

    import "./priceConverter.sol";
//813556   , now 717979
error NotOwner();
contract FundMe{
     using PriceConverter for uint256;
     address public immutable i_owner;

     constructor(){
       i_owner = msg.sender;
     }

    uint public constant MINIMUM_USD=50 *1e18;
     address[] public funderdsAddress;

     mapping(address => uint256) public amountFunded;
     function fundme() payable public {
     require( msg.value.getConversionRate() > MINIMUM_USD, "You need to spend more ETH!");
     funderdsAddress.push(msg.sender);
     amountFunded[msg.sender]= msg.value;
     }
      function withdraw() public isOwner {
         // payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4).transfer();
          for(uint i = 0 ; i< funderdsAddress.length ; i++){
              address fundAdd = funderdsAddress[i];
              amountFunded[fundAdd]=0;
          }
            //transfer
            // payable(msg.sender).transfer(address(this).balance);
            //address(this).balance - refers to whole contract balance
            //if fails , it automatically reverts 

            //send 
            //bool sendPaymentStatus = payable(msg.sender).send(address(this).balance);
            //  require(sendPaymentStatus, "Payment Unsuccessfull"); // This will revert 
              //call
              (bool callSuccess ,)=payable(msg.sender).call{value:address(this).balance}("");
            require(callSuccess , " Call Success Failed");
            funderdsAddress= new address[](0);

      }
       modifier isOwner {
         if(msg.sender == i_owner) revert NotOwner();
         //require(msg.sender == i_owner, "You are not the owner");
         _;
       }
          receive() external payable{
       fundme();  // by default fund function will active by default 
    }
      fallback() external payable{
            fundme();  // by default fund function will active by default 
      }
}