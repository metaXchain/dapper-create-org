pragma solidity ^0.4.4;


contract Members {
  /**
   * @notice a mapping of organization name to organization public address
   *
   * @example
   * "Medi Corp" -> "0x9L1m03nl0Pc5ns4kh2Kp34kl23fjskoL2m"
   * organizationAddress[organization] = Public Key
   */
  mapping (bytes32 => address) public organizationAddress;

  /**
   * @notice a mapping of organization public address to organization name
   *
   * @example
   * "0x123...abc" -> "Medi Corp"
   */
  mapping (address => bytes32) public organizations;

   /**
    * @notice a mapping of organization to
    * their hashes of Member Records
    *
    * @example example
    * members[organization][MemberHash] -> Member Hash
    */
  mapping (bytes32 => mapping (bytes32 => bytes32)) public members;

  /**
   * @notice The owner of this contract.
   */
  address public owner;

  /**
   * Events, when triggered, record logs in the blockchain.
   * Clients can listen on specific events to fetch data.
   */
  event _OrganizationAddressRegistered(bytes32 indexed organization, address indexed memberAddressKey);
  event _MemberAdded(bytes32 indexed member, bytes32 indexed memberHash);
  event _MemberRemoved(bytes32 indexed member, bytes32 indexed memberHash);

  /**
   * @notice modifier which limits execution of the function to the owner.
   */
  modifier onlyOwner() {
    if (msg.sender != owner) {
      revert();
    }

    // continue with code execution
    _;
  }

  /**
   * @notice modifier which checks if sender is a registered organizationAddress.
   */
  modifier isRegistered() {
    if (organizations[msg.sender] == 0) {
      revert();
    }

    // continue with code execution
    _;
  }

  /**
   * @notice modifier which checks that organizationAddress doesn't exist.
   */
  modifier organizationAddressDoesNotExist(address pubKey) {
    if (organizations[pubKey] != 0) {
      revert();
    }

    // continue with code execution
    _;
  }

  /*
   * @notice The constructor function,
   * called only once when this contract is initially deployed.
   */
  constructor() public {
    owner = msg.sender;
  }

  /**
   * @notice Register new organizationAddress.
   * Only the owner of the contract can register new organizationAddress.
   * organizationAddress public key must not already exist in order to
   * be added or modified.
   * @param organizationName name
   * @param pubKey organization public key
   */
  function registerOrganizationAddress(bytes32 organizationName, address pubKey) onlyOwner organizationAddressDoesNotExist(pubKey) external {
    organizationAddress[keccak256(organizationName)] = pubKey;
    organizations[pubKey] = organizationName;
    emit _OrganizationAddressRegistered(organizationName, pubKey);
  }

  /**
   * @notice Allow organizationAddress to add a Member by the hash of the Member information.
   * @param hash keccak256 hash of Member information
   */
  function addMemberRecord(bytes32 hash) isRegistered public {
    members[keccak256(organizations[msg.sender])][hash] = hash;
   emit _MemberAdded(organizations[msg.sender], hash);
  }

  /**
   * @notice Remove Member from organizationAddress
   * @param hash keccak256 hash of Member information
   */
  function removeMemberRecord(bytes32 hash) isRegistered public {
    delete members[keccak256(organizations[msg.sender])][hash];
   emit _MemberRemoved(organizations[msg.sender], hash);
  }

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

  /**
   * @notice Return true if member record exits for the organizationAddress
   * @param pubKey organizationAddress public key
   * @param name of member
   * @param occupation of member   
   * @param location of member
   * @return boolean
   */
  function doesMemberRecordExist(
    address pubKey,
    string name,
    string occupation,
    string location
  )
  external
  constant
  returns (bool) 
  {
    bytes32 hash = keccak256(name, occupation, location);
    return (members[keccak256(organizations[pubKey])][hash] != "");
  }
}
