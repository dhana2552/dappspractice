// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract chai {
    struct Memo {
        string name;
        string messages;
        uint timestamp;
        address from;
    }

    Memo[] memos;
    address payable owner;
    constructor() {
        owner = payable(msg.sender);
    }

    function buyChai (string calldata name, string calldata message) external payable{
        require(msg.value > 0, "Please pay more than 0 Ether");
        owner.transfer(msg.value);
        memos.push(Memo(name, message, block.timestamp, msg.sender));
    }

    function getMemos() public view returns(Memo[] memory){
        return memos;
    }
}