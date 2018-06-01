const HDWalletProvider = require('truffle-hdwallet-provider')
const fs = require('fs')
const providerUrl =  'http://localhost:8545' //'https://rinkeby.infura.io:443' 


let secrets
let mnemonic = ''

if (fs.existsSync('./secrets.json')) {
  secrets = require('./secrets.json')
  mnemonic = secrets.mnemonic
}

module.exports = {
  networks: {
    // For local
     development: {
      provider: new HDWalletProvider(mnemonic, providerUrl),
      network_id: '*',
      gas: 4500000,
      gasPrice: 25000000000
    },
    rinkeby: {
      provider: new HDWalletProvider(mnemonic, 'https://rinkeby.infura.io'),
      network_id: '*',
      gas: 4500000,
      gasPrice: 25000000000
    }
  }
}
