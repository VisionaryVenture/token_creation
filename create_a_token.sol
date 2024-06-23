// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    string public name;
    string public symbol;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;

    constructor(string memory _name, string memory _symbol, uint256 _totalSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
        balanceOf[msg.sender] = _totalSupply;
    }

    function mint(address account, uint256 amount) public {
        require(account != address(0), "eror: cannot mint to zero address");

        totalSupply += amount;
        balanceOf[account] += amount;
    }

    function burn(address account, uint256 amount) public {
        require(account != address(0), "error: cannot burn from the zero address");
        require(balanceOf[account] >= amount, "error: burn amount exceeds balance");

        totalSupply -= amount;
        balanceOf[account] -= amount;
    }
}
