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
        bool active;
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

    mapping (address=>Event) public Event_Info;

    mapping(address=>End_user) public End_user_Info;

    function RegOrganizer(string memory _Name,uint _Age,string memory _Phone_number,string memory _work,string memory _Address,string memory _Email) public {
            Organizer memory xorganizer=Organizer({
                Name:_Name,
                Age:_Age,
                Phonenumber:_Phone_number,
                work:_work,
                Address:_Address,
                Email_Id:_Email,
                active:true,
                Organizer:msg.sender
            });
            Organizer_Info[msg.sender]=xorganizer;
            Organizer_Log.push(msg.sender);
    }

    function RegEvent(string memory _Patient_name,string memory _Dieases_name,string memory _Hospital_name,string memory _Docter_name,string memory _Contact_Docter,uint _Total_amount)public{
            require(Organizer_Info[msg.sender].active==true,"Only Organizer Can Activate Event");
            Event memory xEvent=Event({
                Patient_name:_Patient_name,
                Dieases_name:_Dieases_name,
                Hospital_name:_Hospital_name,
                Docter_name:_Docter_name,
                Contact_Docter:_Contact_Docter,
                Total_amount:_Total_amount,
                Remaining_amount:_Total_amount

            });
            Event_Info[msg.sender]=xEvent;

    }

    function Pay(address payable to,string memory _Name,uint _Amount,string memory _Phone_number,string memory _Emailid) public payable{
            require(msg.value>=_Amount,"Insufficient Balance");
            require(Event_Info[to].Remaining_amount!=0,"Already Funded");
            require(Event_Info[to].Remaining_amount>-_Amount,"Please Enter Correct Amount");
            End_user memory xend_user=End_user({
                Name:_Name,
                Amount:_Amount,
                user_address:msg.sender,
                Phone_number:_Phone_number,
                Email_id:_Emailid
            });

            End_user_Info[msg.sender]=xend_user;
            payable(to).transfer(_Amount);
            Event_Info[to].Remaining_amount-=_Amount;
            

            
    }
    
}
