import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import dotenv from "dotenv";

dotenv.config();

const config: HardhatUserConfig = {
  solidity: {
    version: "0.8.28",
    settings: {
      evmVersion: "shanghai",
      optimizer: {
        enabled: false,
        runs: 100,
      },
      viaIR: false,
    },
  },
  networks: {
    monadTestnet: {
      url: process.env.MONAD_TESTNET_RPC as string,
      accounts: [process.env.PRIVATE_KEY as string],
      chainId: Number("10143")
    },    
  },
  sourcify: {
    enabled: true,
    apiUrl: "https://sourcify-api-monad.blockvision.org",
    browserUrl: "https://testnet.monadexplorer.com"
  },
  etherscan: {
    enabled: false
  }
};

export default config;