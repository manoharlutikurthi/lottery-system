// SPDX-License-Identifier:GPL-3.0

pragma solidity >=0.5.0 <0.9.0;
contract lottery{
    address public manager;
    address payable[] public participants;
    constructor(){
        manager=msg.sender;

    }
    receive() external payable{
        require(msg.value>=1 ether);
        participants.push(payable(msg.sender));
        
    }

    function getbalance() public view returns(uint){
        require(msg.sender==manager);
        return address(this).balance;
    }
    function random() public view returns(uint)
{
    //algorithm like sha256
    keccak256(abi.encodePacked(block.difficulty,block.timestamp,participants.length));
}}
