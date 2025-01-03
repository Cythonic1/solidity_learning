// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;



contract Twitter {

    uint16 tweet_char_limit = 280;
    struct Tweet{
        address auther;
        string tweet;
        uint256 timestamp;
        uint256 likes;
    }
    address owner;

    constructor() {
        owner = msg.sender;
    }
    // Mapping from address to user data
    mapping(address => Tweet[]) public tweets_map;



    // // Function to add a tweet for a specific user
    // function creatTweets(string memory _tweet, address _owner) public {
    //     Tweet memory tweet_data;
    //     tweet_data.auther = msg.sender;
    //     tweet_data.timestamp = block.timestamp;
    //     tweet_data.tweet = _tweet;
    //     tweet_data.likes = 0;

    //     tweets_map[_owner].push(tweet_data); // Add the tweet to the user's tweets array
    // }

    function creatTweets(string memory _tweet )public {
        require(bytes(_tweet).length <= tweet_char_limit, " Please Enter message less than 280 char");
        address _owner = msg.sender;
        Tweet memory tweet_data ;
        tweet_data.auther = msg.sender;
        tweet_data.timestamp = block.timestamp;
        tweet_data.tweet = _tweet;
        tweet_data.likes = 0;

        tweets_map[_owner].push(tweet_data); // Add the tweet to the user's tweets array
    }

    // Function to get all tweets for a specific user
    function getSignleTweets(address _owner) public view returns (Tweet[] memory) {
        return tweets_map[_owner]; // Return the tweets array
    }
    
    // Function to get all tweets for a specific user
    function getAllTweets() public view returns (Tweet[] memory) {
        address _owner = msg.sender;
        return tweets_map[_owner]; // Return the tweets array
    }

    modifier ownerOnlyChange(uint256 _index){
        require(msg.sender == tweets_map[msg.sender][_index].auther, "You are not the auther you can not change the content");
        _;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "You are not the owner" );
        _;
    }

    function changeTweetMaxLength(uint16 _len) public onlyOwner{
        tweet_char_limit = _len;
    }


   

    function editTweet(uint256 _index, string memory new_str) public ownerOnlyChange(_index){
         tweets_map[msg.sender][_index].tweet = new_str; 
    }

    function transferTweet(address _reciver, uint256 _tweet_index) public ownerOnlyChange(_tweet_index){
        Tweet storage  data = tweets_map[msg.sender][_tweet_index]; 
        data.auther = _reciver;
    }
}


