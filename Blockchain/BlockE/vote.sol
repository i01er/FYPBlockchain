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
        uint voteIndex1;
        uint voteIndex2;
        uint voteIndex3;
        uint weight;
    }
    
    address public owner;
    string public choice;
    mapping(address => Voter) public voters;
    Question[] public question1;
    Question[] public question2;
    Question[] public question3;
    uint public auctionEnd;

    string public answer1 = "1 - Very Good";
    string public answer2 = "2 - Okay";
    string public answer3 = "3 - Not Good";
    string public answer4 = "4 - Really Bad";
    
    event Result(string choice, uint voteCount);
    
    function Election(string _choice, uint durationMinutes)
    {
        owner = msg.sender;
        choice = _choice;
        auctionEnd = now + (durationMinutes * 1 minutes);
        
        question1.push(Question(answer1, 0));
        question1.push(Question(answer2, 0));
        question1.push(Question(answer3, 0));
        question1.push(Question(answer4, 0));

        question2.push(Question(answer1, 0));
        question2.push(Question(answer2, 0));
        question2.push(Question(answer3, 0));
        question2.push(Question(answer4, 0));

        question3.push(Question(answer1, 0));
        question3.push(Question(answer2, 0));
        question3.push(Question(answer3, 0));
        question3.push(Question(answer4, 0));
    }
    
    function authorize(address voter)
    {
        require(msg.sender == owner);
        require(!voters[voter].voted);
        
        voters[voter].weight = 1;
    }
    
    function vote(uint voteIndex1, uint voteIndex2, uint voteIndex3)
    {
        require(now < auctionEnd);
        require(!voters[msg.sender].voted);
        
        voters[msg.sender].voted = true;
        voters[msg.sender].voteIndex1 = voteIndex1;
        voters[msg.sender].voteIndex2 = voteIndex2;
        voters[msg.sender].voteIndex3 = voteIndex3;
        
        question1[voteIndex1].voteCount += voters[msg.sender].weight;
        question2[voteIndex2].voteCount += voters[msg.sender].weight;
        question3[voteIndex3].voteCount += voters[msg.sender].weight;
    }
    
    function end()
    {
        require(msg.sender == owner);
        require(now >= auctionEnd);
        
        for(uint i=0; i < questions.length; i++)
        {
            Result(question1[i].choice, question1[i].voteCount);
            Result(question2[i].choice, question2[i].voteCount);
            Result(question3[i].choice, question3[i].voteCount);
        }
    }
}