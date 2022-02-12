//SPDX-License-Identifier: MIT
pragma solidity 0.8.11;

contract Users{
    struct NewUser{
        string name;
        uint256 age;
        string color;
    }
    mapping(address => NewUser[]) public usersmap;
    mapping(address => bool) public there;
    NewUser[] newUser;
    //mapping(address => NewUser) public usersmap;
    function setMember(string calldata name, uint256 age, string memory color) public {
        NewUser memory newUse = NewUser({name: name,age:age, color:color});
        newUser.push(newUse);
        mint(msg.sender, newUse);
    }
    function mint(address _to, NewUser memory u) public{
        usersmap[msg.sender].push(u);
        counter+=1;
        there[_to] = true;
    }
    function transferFrom(address _from, address _to, NewUser memory u) public {
        require(_from != address(0));
        require(_to != address(0));
        require(exists(_from) ==true);
        deleteFromUser(_from, 0);
        usersmap[_to].push(u);
    }
    function deleteFromUser(address _from, uint256 _index) private {
        NewUser[] storage owninguser = usersmap[_from];
        for(uint i = _index; i< owninguser.length-1; i++){
            owninguser[i] = owninguser[i+1]; 
        }
        owninguser.pop();
        deleteFromArr(_index);
    }
    function exists(address _owner) public view returns(bool){
        bool isthere = there[_owner];
        return isthere;
    }
    uint256[] public array1;
    uint256 private counter;
    constructor(){
        counter = 0;
    }
    function deleteFromArr(uint256 index) private{
        for(uint i = index; i< newUser.length-1; i++){
            newUser[i] = newUser[i+1]; 
        }
        newUser.pop();
    }
    uint256[] public _age;
    string[] public _color;
    string[] public _name;
    function getmembers() public returns(uint256[] memory,string[] memory, string[] memory){
        for(uint256 i = 0; i < newUser.length; i++){
            _age.push(newUser[i].age);
            _color.push(newUser[i].color);
            _name.push(newUser[i].name);
        }
        return(_age, _color, _name);
    }
    function newUserLength() public view returns(uint256){
        return newUser.length;
    }
    function arraylength() public view returns(uint256[] memory){
        return _age;
    }
    function getmembersByIndex(uint index) public view returns(NewUser memory){
        return newUser[index];
    }
    function balanceOf(address _owner) public view returns(NewUser[] memory){
        require(_owner != address(0));
        NewUser[] memory newuser = usersmap[_owner];
        return newuser;
    }
    
}