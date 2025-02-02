// require("@nomicfoundation/hardhat-toolbox");

// /** @type import('hardhat/config').HardhatUserConfig */

// const NEXT_PUBLIC_POLYGON_MUMBAI_RPC = "https://rpc.ankr.com/polygon_mumbai";
// const NEXT_PUBLIC_PRIVATE_KEY = "YOUR_PRIVATE_KEY";
// module.exports = {
//   solidity: "0.8.0",
//   defaultNetwork: "matic",
//   networks: {
//     hardhat: {},
//     polygon_mumbai: {
//       url: NEXT_PUBLIC_POLYGON_MUMBAI_RPC,
//       accounts: [`0x${NEXT_PUBLIC_PRIVATE_KEY}`],
//     },
//   },
// };

// require('@nomiclabs/hardhat-waffle');

require("@nomicfoundation/hardhat-toolbox");

// 在本地端啟用
module.exports = {
  solidity: "0.8.0",
  networks: {
    hardhat: { chainId: 31337 },
    // mumbai: {
    //   url: '',
    //   accounts: [''],
    // },
  },
};
