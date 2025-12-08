// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract b3 {

    uint number = 100;

    function getValue() public view returns (uint) {
        return number;
    }

    function setValue(uint _value) public {
        number += _value;
    }

}
