// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract  MyCustomToken is ERC20 {

    address My_owner;
    uint public total;
    address private _My_owner;
    mapping(address => uint256) private _balances;

    event Burn(address from, uint256 amount);
    event Mint(address to, uint256 amount);

    
   constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        My_owner = msg.sender;
    }

    function Token_mint(address to, uint256 amount) public  returns (bool) {
        _balances[to] = amount +_balances[to] ;
        total = amount + total;
        emit Mint(to, amount);
        return true;
    }
    
    function Token_burn(uint256 amount) public {
        address sender = msg.sender;
        _balances[sender] -= amount;
        total -= amount;
        emit Burn(sender, amount);
    }

    function getMy_owner() external view returns (address) {
        return My_owner;
    }
}