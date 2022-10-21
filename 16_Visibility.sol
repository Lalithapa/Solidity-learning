// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

contract visibility{
    function f1() public pure returns(uint){  //visibility -Outside env.
        return 1;
    }
      function f2() private pure returns(uint){
        return 2;
    }
      function f3() internal pure returns(uint){
        return 3;
    }
      function f4() external pure returns(uint){  //visibility -Outside env.
        return 4;
    }
}
contract second is visibility{
    uint public demo= f3();
}