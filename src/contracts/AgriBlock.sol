//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './ERC721Connector.sol';

contract AgriBlock is ERC721Connector{
    
    address private contract_owner;
    constructor(){
        contract_owner = msg.sender;
    }
}