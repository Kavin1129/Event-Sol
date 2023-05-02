// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./PriceConverter.sol";
contract chain {
    address Owner;
    constructor(){
        Owner=msg.sender;
    }
    struct RegOrganizer{
        string Name;
        uint Age;
        string Phonenumber;
        string adherenumber;
        string work;
        string Address;
        string Email_Id;
        address Organizer;
    }

    struct Event{
        string Patient_name;
        string Dieases_name;
        string Hospital_name;
        string Docter_name;
        string Contact_Docter;
        uint Total_amount;
        uint Remaining_amount;
    }

    struct End_user{
        string Name;
        uint Amount;
        address user_address;
        string Phone_number;
        string Email_id;
    }
    
    mapping(address=>RegOrganizer) public RegOrganizer_Info;
    address[] public RegOrganizer_Log;
    
}
