// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract b1 {

    string private namaDepan;
    string private namaBelakang;

    string private nama = "dafi deva";
    uint private umur = 6;
    string private hobi = "bermusik dan sepak bola";

    // constructor (string memory _value) payable {
    //     namaDepan = "abdul ";
    //     namaBelakang = _value;
    // }

    struct Objek {
        string nama;
        uint umur;
        string hobi;
    }

    Objek private dafi = Objek(
        "dafi",
        5,
        "bermusik"
    );

    Objek private defa = Objek(
        "defa",
        1,
        "sepak bola"
    );

    string[] private kids = ["dafi", "defa"];

    uint[] private seq = [1, 2, 3];
    
    function addLoopSeq(uint _value) private {
        seq.push(_value);
    }

    function removeLastSeq() private {
        seq.pop();
    }

    function getSeq(uint _value) private view returns (uint) {
        return seq[_value];
    }

    function getSeqs() private view returns (uint[] memory) {
        return seq;
    }

    function checkGasReturnVariableFromStorage() private view returns(uint[] memory) {
        return seq; // execution cost: 10143 gas
    }

    function checkGasReturnVariableFromMemory(string memory _value) private pure returns(string memory) {
        return _value; // execution cost: 1371 gas
    }

    function checkGasReturnVariableFromCalldata(string calldata _value) private pure returns (string memory) {
        return _value; // execution cost: 1115 gas
    }

    // function pullEth() public payable {
    //     // check balance account
    //     // set value ETH
    //     // check ETH from Deployed Contract
    // }

    mapping (string => uint) private _map;
    function addMap(string memory _name, uint _value) private {
        _map[_name] = _value;
    }

    mapping (string => string[]) private _maps;
    function addMapArray(string memory _name, string memory _params) private {
        _maps[_name].push(_params);
    }
    function getMap(string memory _name) private view returns (string[] memory) {
        return _maps[_name];
    }

    uint private loop;
    function sampleIf1(uint pin) private {
        require(pin == 123, "PIN is Wrong");

        loop++;
    }
    function sampleIf2(string memory _value) public pure returns (string memory) {
        require(keccak256(abi.encodePacked(_value)) == keccak256(abi.encodePacked("123")), "Value is wrong");
        
        return _value;
    }
}
