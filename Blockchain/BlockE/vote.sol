pragma solidity ^0.4.0;
/*
IERG4999HJ Final Year Project
WAN Kam Leung
1155068082
*/

contract Election 
{
    struct Question
    {
        string choice;
        uint voteCount;
    }
    
    struct Voter
    {
        bool voted;
        uint voteIndex;
        uint weight;
    }
    
    address public owner;
    string public choice;
    mapping(address => Voter) public voters;
    Question[] public questions;
    uint public auctionEnd;
    
    event QuestionResult(string choice, uint voteCount);
    
    function Election(string _choice, uint durationMinutes, string choice1, string choice2)
    {
        owner = msg.sender;
        choice = _choice;
        auctionEnd = now + (durationMinutes * 1 minutes);
        
        questions.push(Question(choice1, 0));
        questions.push(Question(choice2, 0));
    }
    
    function authorize(address voter)
    {
        require(msg.sender == owner);
        require(!voters[voter].voted);
        
        voters[voter].weight = 1;
    }
    
    function vote(uint voteIndex)
    {
        require(now < auctionEnd);
        require(!voters[msg.sender].voted);
        
        voters[msg.sender].voted = true;
        voters[msg.sender].voteIndex = voteIndex;
        
        questions[voteIndex].voteCount += voters[msg.sender].weight;
    }
    
    function end()
    {
        require(msg.sender == owner);
        require(now >= auctionEnd);
        
        for(uint i=0; i < questions.length; i++)
        {
            QuestionResult(questions[i].choice, questions[i].voteCount);
        }
    }
}