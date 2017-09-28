# Blockchain Commenting/Voting Application

<<<<<<< Updated upstream
## How it works
Users would use his/her own private key with a public key to verify their identity before posting/commenting/voting. This could keep all information in the blockchain valid. In addition, all the comments cannot be deleted or filtered by 3rd party. Everyone can help to confirm the validity of the contents.
=======
### How it works
Users would use his/her own private key with a public key to verify their identity before posting/commenting. This could keep all information in the blockchain valid. In addition, all the comments cannot be deleted or filtered by 3rd party. Everyone can help to confirm the validity of the contents.
>>>>>>> Stashed changes

[Example](https://www.reddit.com/r/ethereum/comments/3hx73f/freakiest_thing_ever_the_blockchain_now_has_a/)

In this example, users could even upload a song into the blockchain system. It could see that blockchain has the ability to contain every votes or every comments in the system.

### Requirements
- An existing blockchain system for storing information.
- 

### Assumptions
- Every user only can vote once
- Every user only got one identity
- Every identity is unique
- 

### Registration
When users finish the registration, they will receive a private key. The application could use the key to verify which one is the vaild user.

Identities will not be checked after the registration stage, in order to provide an anonymous system.

### Posting/Commenting
Users need to use their private key and a public key for posting/commenting/voting any information. This action can verify the users' identity and still provide an anonymous commenting system. 

![](https://github.com/i01er/FYPBlockchain/blob/master/Images/Voting.png)
When the voting starts, the application will make a remark. After the voting is finished, it will make another remark to keep all the vaild votes between two remarks. Any votes before or after the remarks are invaild.

The comment/post/vote would be post to the Blockchain system(e.g. Bitcoin, Ether).

For example, the comment has to be hashed and contained into the OP_Return/geth function. It could be successfully saved to the system (forever).

### View/Check Comments
The application would go through the whole blockchain and verify the information. Omit all the invaild votes/comments and prevent any potential attack.

### Edit
Users or 3rd party could not edit any information after it posted to the blockchain.

