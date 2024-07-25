// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20Generator is ERC20 {
    constructor(
        uint256 _initialSupply,
        string memory _tokenName,
        string memory _tokenSymbol
    ) ERC20(_tokenName, _tokenSymbol) {
        _mint(msg.sender, _initialSupply);
    }
}

contract exERC20Generator is ERC20 {
    address public owner;
    uint256 public rate; // Number of tokens per ether
    constructor(
        uint256 _initialSupply,
        string memory _tokenName,
        string memory _tokenSymbol
    ) ERC20(_tokenName, _tokenSymbol) {
        owner = msg.sender;
        _mint(msg.sender, _initialSupply);
        // rate = 10000000; ==>  1 ether = 100,000 tokens
    }
}
