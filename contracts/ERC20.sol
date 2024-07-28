// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20Generator is ERC20 {
    // 構造函數
    constructor(
        uint256 _initialSupply, // 初始供應量
        string memory _tokenName, // 代幣名稱
        string memory _tokenSymbol // 代幣符號
    ) ERC20(_tokenName, _tokenSymbol) {
        // 調用父合約ERC20的構造函數，設置代幣名稱和符號
        _mint(msg.sender, _initialSupply); // 給合約的發起者鑄造指定數量的代幣
    }
}

contract exERC20Generator is ERC20 {
    address public owner;
    uint256 public rate; // Number of tokens per ether

    /*
        indexed: 表示這個參數是可索引的，透過(買家)地址進行索引
        uint256 amount 是一個無符號的256位整數，表示(買家)的代幣數量
        uint256 cost 代表(買家)代幣所支付的乙太幣數量。
    */

    // 允許你在區塊鏈上記錄一些活動或變更，這些記錄可以被外部應用程序監聽和讀取。
    event TokensPurchased(address indexed buyer, uint256 amount, uint256 cost);

    constructor(
        uint256 _initialSupply,
        string memory _tokenName,
        string memory _tokenSymbol
    ) ERC20(_tokenName, _tokenSymbol) {
        owner = msg.sender;
        _mint(msg.sender, _initialSupply);
        rate = 10000000; // ==> 1 ether = N tokens
    }

    // 限制某些函數只能由合約的所有者調用
    modifier onlyOwner() {
        // 檢查調用函數的地址是否為合約所有者，不是則拋出參數2錯誤訊息
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    // 購買代幣的函數，公共函數，並且是 payable 的，意味著它可以接受以太幣（ETH）付款。
    function buyTokens() public payable {
        // 計算購買的代幣數量
        uint256 tokenAmount = msg.value * rate; // msg.value 是用戶發送的以太幣數量，rate 是每單位以太幣可購買的代幣數量。
        // 檢查所有者的代幣餘額
        require(balanceOf(owner) >= tokenAmount, "Not enough tokens available"); //合約所有者有足夠的代幣可供出售。如果所有者的代幣餘額不足，則拋出錯誤訊息

        //轉移代幣(合約持有者轉移給用戶)
        _transfer(owner, msg.sender, tokenAmount); //msg.sender 是發起這個交易的帳戶地址(用戶)
        // 記錄用戶(買家)地址、購買的代幣數量和支付的以太幣數量
        emit TokensPurchased(msg.sender, tokenAmount, msg.value); //觸發事件
    }

    // 設置匯率的函數
    function setRate(uint256 newRate) public onlyOwner {
        rate = newRate;
    }
}
