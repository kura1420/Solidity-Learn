// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

interface IContractB3 {
    function getValue() external view returns (uint);
    function setValue(uint _value) external;
}

contract b4 {

    address private addressContractB3 = 0x78FD83768c7492aE537924c9658BE3D29D8ffFc1; // get address from deploy contract b3

    function readValue() public view returns (uint) {
        IContractB3 _iContractB3 = IContractB3(addressContractB3);

        return _iContractB3.getValue();
    }

    function setValue(uint _value) public {
        IContractB3 _iContract = IContractB3(addressContractB3);

        _iContract.setValue(_value);
    }

}
