pragma solidity ^0.4.4;


contract Answers {

  mapping (bytes32 => address) public organizationAddress;


  mapping (address => bytes32) public organizations;

  address public owner;

  event _OrganizationAddressRegistered(bytes32 indexed organization, address indexed memberAddressKey);


  modifier onlyOwner() {
    if (msg.sender != owner) {
      revert();
    }

    _;
  }

  modifier isRegistered() {
    if (organizations[msg.sender] == 0) {
      revert();
    }

    _;
  }

  modifier organizationAddressDoesNotExist(address pubKey) {
    if (organizations[pubKey] != 0) {
      revert();
    }

    // continue with code execution
    _;
  }

  constructor() public {
    owner = msg.sender;
  }

  function registerOrganizationAddress(bytes32 organizationName, address pubKey) onlyOwner organizationAddressDoesNotExist(pubKey) external {
    organizationAddress[keccak256(organizationName)] = pubKey;
    organizations[pubKey] = organizationName;
    emit _OrganizationAddressRegistered(organizationName, pubKey);
  }




  // HELPER MODIFIER FUNCTIONS FOR TESTS
  
  /**
   * @notice Check if organizationAddress is registered.
   * @param pubKey organizationAddress public key
   * @return bool
   */
  function isRegisteredOrganizationAddress(address pubKey) external constant returns (bool) {
    return (organizations[pubKey] != "");
  }

  /**
   * @notice Check if organizationAddress is registered
   * @param organizationName name
   * @return bool
   */
  function isRegisteredOrganization(bytes32 organizationName) external constant returns (bool) {
    return (organizationAddress[keccak256(organizationName)] != address(0));
  }


}
