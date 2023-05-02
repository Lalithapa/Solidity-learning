//SPDX-License-Identifier:MIT 
pragma solidity ^0.8.9;
    
    import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter{
function getPrice() internal view returns(uint256) { //getting ethereum market price in terms of  USD
          AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
          (,int price,,,)= priceFeed.latestRoundData();
          return uint256(price * 1e10); //removing 10 decimal 
     }
    function getVersion() internal view returns (uint256){
        // ETH/USD price feed address of Sepolia Network.
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }
     function getConversionRate(uint ethAmt) internal view returns(uint256) { //converting ether into usd price
        uint etherMarketPrice = getPrice();
        uint ethAmtInUsd = (etherMarketPrice * ethAmt) / 1e18;
        return ethAmtInUsd;
     }
}

//Library must be of type Internal