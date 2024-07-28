// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract LookupContract {
    // ERC20Token 結構體
    struct ERC20Token {
        uint256 tokenID; // 代幣的唯一標識符
        address owner; // 代幣的擁有者地址
        string tokenSupply; // 代幣的供應量
        string tokenName; // 代幣的名稱
        string tokenSymbol; // 代幣的符號
        string tokenAddress; // 代幣合約地址
        string tokenTransactionHash; // 與代幣相關的交易哈希
        string tokenCreatedDate; // 代幣創建日期
    }

    // Donation 結構體
    struct Donation {
        uint256 donationID; // 捐贈的唯一標識符
        address donor; // 捐贈者的地址
        uint256 fund; // 捐贈的資金數額
    }

    // 帳戶2（自己的）錢包地址
    // 用於儲存合約擁有者的錢包地址，這個地址可以接收和管理合約中的以太幣
    address payable contractOwner =
        payable(0x5aE5ea0E5a40723fd6C763A175EE86D3c8e0DaFb);

    // TODO：要再另外確認是主鏈還是測試鏈
    // 無論使用者在自己的平台如何創建自己的代幣都會被收取 0.025 ETH
    // 理想的收費費用 0.025ETH
    uint256 public listingPrice = 0.025 ether;

    /*
        mapping：一種鍵值對數據結構，類似於哈希表或字典。
        uint256 => ERC20Token：鍵類型是 uint256，值類型是 ERC20Token 結構體。
        private：訪問修飾符，表示該映射只能在合約內部訪問。
        erc20Tokens：映射變量，用於儲存 ERC20Token 結構體，其中鍵是 uint256 類型的代幣ID。
    */

    // 功能是創建一個私有映射，將每個 uint256 類型的代幣ID 映射到相應的 ERC20Token 結構體。
    mapping(uint256 => ERC20Token) private erc20Tokens;
    mapping(uint256 => Donation) private donations;

    uint256 public _tokenIndex;
    uint256 public _donationIndex;

    // 誰是捐贈者 / 捐了多少錢
    event DonationReceived(address indexed donor, uint256 amount);
    // 合約持有者，獲得了多少種捐贈的代幣
    event ERC20TokenListed(
        uint256 indexed id,
        address indexed owner,
        string indexed token
    );
}
