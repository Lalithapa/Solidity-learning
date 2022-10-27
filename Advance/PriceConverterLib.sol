// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
 import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

 library PriceConverter{
      function getPrice() internal  view returns(uint256){
        //ABI
        //Address 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e;
        AggregatorV3Interface priceFeed=AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
       (
            /*uint80 roundID*/,
            int price,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) =priceFeed.latestRoundData();

        //eth in terms of Usd 
        //3000.00000000
        return uint256(price * 1e10);
    }
    function getVersion() internal view returns(uint256){
        //ABI
        //Address 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e;
         AggregatorV3Interface priceFeed=AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
    }
    function getConversionRate(uint256 ethAmt) internal view returns(uint256){
       uint256 ethprice= getPrice();
       //3000_000000000000000000=ETH/USD price;
       uint ethAmtinUSD=(ethprice*ethAmt) /1e18; 
       return ethAmtinUSD;
    }
 }