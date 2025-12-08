// SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

contract Belajar {

    string public textRaw;
    address private owner;
    uint public angka;

    constructor() {
        owner = msg.sender;
        textRaw = "";
    }

    function setText(string calldata _text) external {
        textRaw = _text;
    }

    function inc() external {
        require(msg.sender == owner, "NOT_OWNER");

        angka++;
    }

    function getPemilik() public view returns (address) {
        return owner;
    }

}