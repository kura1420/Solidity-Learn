// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

/*
Reference: https://www.youtube.com/watch?v=jZJsFjjiDzg&list=PL-buOnh3mkNHKnlojPSZjBWUzHvOlx5vN&index=2
Rules:

1. Owner: 
    - Yang deploy SMART CONTRACT
    - Mendaftarkan kandidat
    - Mengatur status voting

2. User/Kandidat:
    - Memilih kandidat
    - Melihat siapa saja kandidatnya
    - Melihat siapa yang menang
*/

contract Evoting {

    address public owner;
    bool internal isVote;
    bool internal isDone;

    struct Candidat {
        address cAddress;
        uint cValue;
    }
    
    constructor() {
        owner = msg.sender;
        isVote = false;
        isDone = false;
    }

    Candidat[] public _candidat;

    mapping(address => bool) public candidatRegistered;
    mapping(address => bool) public userHasVote;

    function addCandidat(address _address) public {
        require(msg.sender == owner, "Anda bukan owner");

        require(!candidatRegistered[_address], "Data sudah tersedia");

        _candidat.push(
            Candidat(_address, 0)
        );

        candidatRegistered[_address] = true;
    }

    function getTotalCandidat() public view returns (uint) {
        return _candidat.length;
    }

    function setVote(bool _value) public {
        require(msg.sender == owner, "Anda bukan owner");

        isVote = _value;
    }

    function setDone(bool _value) public {
        require(msg.sender == owner, "Anda bukan owner");

        isDone = _value;
    }

    function voting(uint _value) public {
        require(isVote, "Belum waktunya voting");

        require(_value < _candidat.length, "Kandidat tidak ditemukan");

        require(userHasVote[msg.sender], "Anda sudah voting");

        require(msg.sender != owner, "Owner tidak bisa voting");

        _candidat[_value].cValue++;

        userHasVote[msg.sender] = true;
    }

    function whoIsWin() public view returns (address, uint) {
        require(_candidat.length >= 2, "Jumlah kandidat < 2");
        require(isVote, "Masih proses voting");
        require(!isDone, "Voting masih berlangsung");

        uint maxValue = 0;
        uint indexCandidate = 0;

        for (uint i = 0; i < _candidat.length; i++) 
        {
            if (_candidat[i].cValue > maxValue) {
                maxValue = _candidat[i].cValue;
                indexCandidate = i;
            } 
        }

        return (
            _candidat[indexCandidate].cAddress,
            _candidat[indexCandidate].cValue
        );
    }

}
