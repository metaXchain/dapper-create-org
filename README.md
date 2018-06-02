# Create an Organization Manager Contract

# Documentation 


## Instructions for Dapper Bootcamp

1.) Open ```Organizatoion.sol``` in Remix IDE

2.) Read over commented document

3.) Try and recreate this Solidity code based on the comments

4.) Work with others 



- Answers will be provided after class
- This repository includes working tests with correctly constuceted code

___

## Repository Information

#### Start

First install ```git```, ```node```, ```npm```, & ```truffle``` if you do not have them already.


To install project dependencies run: ```npm install```

*If you get installation error try deleting the ```package-lock.json``` file*

## Contracts

You will see two additional contracts added to this repository. 

1.) Answers.sol: which includes the completed version of the annotated Organizations.sol

2.) Members.sol: This contract is and extended version of the Organization.sol contract. It includes functionality to for organizations to add members. First the contract creator must register and organizaiton to its public key, then only the organization itself can add and remove members in the organization. This means if an organization was registered to a public key, now only that wallet/owner is able to update their own member list.

## Local Deployment and Testing Information

- If not done so already install ```testrpc``` on your computer

- Development deployment/testing utilizes ```testrpc```

- *mnemonic* for your network should be copied into the ```secrets.json``` file

- Look in ```truffle.js``` for deployment configurations. *You shouldn't need to modify this unless you want to modify network*


### Local testing

Depending on which contract you want to test and deploy, you will need to go to the ```migrations/2_deploy_contracts.js``` folder and change the name of the contract you wish to work with. Currently it is set up to deploy ```Answers.sol```.


Run testrpc in your terminal: ```testrpc -m 'put your mnemonic from secrets.json here' ```

Then run: ```npm run test```

### Local compiling and deployment

```npm run compile```

```npm run deploy```


# Test
Alernatives:

```bash
truffle test
```

```bash
truffle compile
```

```bash
truffle migrate --reset --network=development
```


# Resources

- [truffle framework](https://github.com/trufflesuite/truffle)

- [Solidity](https://solidity.readthedocs.io)

# License

MIT
