// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./PriceConverter.sol";
contract chain {
    address Owner;
    constructor(){
        Owner=msg.sender;
    }
    struct Organizer{
        string Name;
        uint Age;
        string Phonenumber;
        //string adherenumber;
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
    
    

    mapping(address=>Organizer) public Organizer_Info;
    address [] public Organizer_Log;

    function RegOrganizer(string memory _Name,uint _Age,string memory _Phone_number,string memory _work,string memory _Address,string memory _Email) public {
            Organizer memory xorganizer=Organizer({
                Name:_Name,
                Age:_Age,
                Phonenumber:_Phone_number,
                work:_work,
                Address:_Address,
                Email_Id:_Email,
                Organizer:msg.sender
            });
            Organizer_Info[msg.sender]=xorganizer;
            Organizer_Log.push(msg.sender);
    }

    function RegEvent(string memory _Patient_name,string memory _Dieases_name,){
        // string Patient_name;
        // string Dieases_name;
        // string Hospital_name;
        // string Docter_name;
        // string Contact_Docter;
        // uint Total_amount;
        // uint Remaining_amount
    }
    
}
