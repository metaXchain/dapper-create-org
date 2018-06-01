// Put the Solidity compiler type here

//========================


contract Organization {

  /**

   * Create a mapping called organizationAddress
   *
   * It should be a mapping of organization name to organization public key 
   *
   * @example
   * "Medi Corp" -> "0x9L1m03nl0Pc5ns4kh2Kp34kl23fjskoL2m"
   * organizationAddress[Organization Name Hash] = Public Key
   * the mapping's key should be type bytes 32 and public key type is type address
   * Organization Name Hash will be keccak256 when assigned
   */

  //========================

  /**

   * Create a mapping called organizations
   *
   * It should be a mapping of organization public key to organization name
   *
   * @example
   * "0x123...abc" -> "Medi Corp"
   * organizationAddress[Public Key] = Organization Name
   * the mapping's key should be type address and organization name is type bytes32
   */


  //========================


  /**

   * Declare a public variable of type address that is named owner
   *
   * @notice The owner of this contract.
   * 
   */

  //========================

  /**
   * Create a modifier that limits the execution of the function to the owner.
   * if false, revert. 
   * else continue with code execution.
   *
   * Modifier name should be: onlyOwner
   *
   */
  //========================


  /**
   * Create a modifier which checks if sender is a registered organizationAddress.
   * if false, revert. 
   * else continue with code execution. 
   *
   * Modifier name should be: isRegistered
   *
   */

  //========================

  /**
   *
   * Create a modifier which checks that organizationAddress doesn't already exist.
   * if false, revert. 
   * else continue with code execution. 
   *
   * Modifier name should be: organizationAddressDoesNotExist
   *
   */

  //========================

  /*
   * Create public constructor function.
   * Called only once when this contract is initially deployed.
   * It should assign the owner of the contract to the sender
   */

  //========================


  /**
   * Create a function that registers a new organizationAddress.

   * Only the owner of the contract can register new organizationAddress.

   * organizationAddress public key must not already exist in order to be added or modified.
   
   * Function should be external.

   * @param organizationName name. Type is bytes32
   * @param pubKey organization public key. Type is address

   * Should assign the public key value to the data structure organizationAddress. 
   * Key: Hash of Organization Name. Use keccak256 to hash
   * Value: Public Key

   * Similarly also assign the Organization Name  to the data structure organizations. 
   * Key: Public Key
   * Value: Organization Name. 
   */
  //========================


  /**
   * Create an event named _OrganizationAddressRegistered
   * It should have two parameters. 1.) Organization Name  2.) Public Key
   * Both parameters should be indexed
   * emit this event at the bottom of the registerOrganizationAddress function
   */


}

