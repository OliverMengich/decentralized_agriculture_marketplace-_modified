// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import './ERC721.sol';

contract ERC721Enumerable is ERC721{

    //returns all commodity in a list
    function totalSupply() public view returns(uint256){
        return product.length;
    }
    function totalCommodity() public view returns(Products[] memory){
        return product;
    }
    //returns all comodity by a farmer and their index
    function tokenOfOwnerByIndex(address _owner, uint256 _index) public view returns(Products memory){
        Products[] memory product = ownerProducts[_owner];
        return product[_index];
    }
    function tokenByIndex(uint256 _index) public view returns(Products memory){
        Products memory product = product[_index];
        return product;
    }
}