// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ManualToken {

    string public s_name = "Token";
    mapping (address => uint256) private s_balances;

    function name() public view returns (string memory){
        return s_name;
    }

    function totallSupply() public pure returns (uint256){
        return 100 ether;  // 100000000000000
    }

    function decimals() public pure returns (uint8){
        return 10;
    }

    function balanceOf(address _owner) public view returns (uint256){
        return s_balances[_owner];
    }

    function transfer(address _to, uint256 _amount) public {
        uint256 previousBalances = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] -= _amount;
        s_balances[_to] += _amount;
        require(balanceOf(msg.sender) + balanceOf(_to) == previousBalances);
    }

}