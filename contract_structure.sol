// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.13;

/**
 @title Solidity Basic Syntax
 @author kedarpujara
 @notice edu only 
 @dev this is a multi-line natspec comment 
 */

 struct Planet {
    uint age;
    string name;
    address adr; 
 }

contract Space {

    Planet public planet;
    
    /// @notice enum declarations don't need to end with ;
    enum State {Habited, Uninhabited, Unknown}

    State public universeState;
    
    ///@notice price is declared as uint256 (20K gas set for this)
    uint256 public price = 100; 
    address public immutable owner;
    uint[3] public arr1;

    /// @dev stores as "0x616263"
    bytes public s1 = "abc";

    /// @dev stores as abc
    string public s2 = "abc";

    // Hashmap mapping the address of the account to the 
    // amount in wei that they bid in an auction 
    mapping (address => uint) public bids;

    constructor (uint256 age, string memory name) {
        planet.age = age;
        planet.name = name;
        planet.adr = msg.sender;
    }

    function bid() payable public { 
        /// @dev msg.sender --> address that calls this function 
        /// @dev msg.value --> value in wei that this sender is bidding for 
        /// @notice adding a key value pair to the map 
        bids[msg.sender] = msg.value;
    }

    function setPrice(uint256 newPrice) public {
        price = newPrice;
    }

     function setPriceWReturn(uint256 newPrice) public returns (uint, bool) {
        price = newPrice;
        return (price, false);
    }    


    // pure does not read or write from the blockchain 
     function memoryArrayPure() public pure {
        uint[] memory mem1 = new uint[](3);
        mem1[0] = 1;
     }


    // View reads from the blockchain 
     function memoryArrayView() public view {        
     }
}