const Organization  = artifacts.require('./Organization.sol')
const sha3 = require('solidity-sha3').default
const {soliditySHA3} = require('ethereumjs-abi')

const organization = 'TestInc'



contract('Organization', function (accounts) {
  const owner = accounts[0]

  console.log("Available Accounts: ", accounts)

  it('should register organization under organizationAddress', async () => {
    const instance = await Organization.deployed()

    const organizationAddress = accounts[1]
    const isRegisteredAddress = await instance.isRegisteredOrganizationAddress(organizationAddress)
    assert.equal(isRegisteredAddress, false)

    const isOrganizationRegistered = await instance.isRegisteredOrganization(organization)
    assert.equal(isOrganizationRegistered, false)

    console.log("Organization Data: ", organization, organizationAddress, {from: owner})

    await instance.registerOrganizationAddress(organization, organizationAddress, {from: owner})
    
    const organizationHash = `0x${soliditySHA3(['bytes32'], [organization]).toString('hex')}`
    const organizationAddress2 = await instance.organizationAddress.call(organizationHash)

    console.log("Are Equal? : ", organizationAddress2, organizationAddress)
    assert.equal(organizationAddress2, organizationAddress)

    const isRegistered2 = await instance.isRegisteredOrganizationAddress(organizationAddress)
    assert.equal(isRegistered2, true)

    const isOrganizationRegistered2 = await instance.isRegisteredOrganization(organization)
    assert.equal(isOrganizationRegistered2, true)
  })


})
