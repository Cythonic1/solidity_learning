require("@nomicfoundation/hardhat-toolbox");
const { ethers } = require("hardhat");

async function deploy() {
    // When deploy we focus on the name of the contract it self not the file name of the contract;
    const Twitter = await ethers.getContractFactory("Twitter");
    const tweets = await Twitter.deploy();
    await tweets.waitForDeployment();

    console.log("Greeting deployed to:", tweets.target);
    return tweets;
}

async function main() {
    const tweets = await deploy();  // Call deploy and get the greeting contract
    // Use quotes for Ethereum addresses to treat them as strings
    // await tweets.creatTweets("Hello Mohe", "0xcd3B766CCDd6AE721141F452C550Ca635964ce71");
    // await tweets.creatTweets("Hello my Love", "0x8626f6940E2eb28930eFb4CeF49B2d1F2C9C1199");

    // // Fetch tweets for a specific address
    // console.log(await tweets.getTweets("0x8626f6940E2eb28930eFb4CeF49B2d1F2C9C1199"));
    // console.log(await tweets.getTweets("0xcd3B766CCDd6AE721141F452C550Ca635964ce71"));
    await tweets.creatTweets("Hello Mohe");
    await tweets.creatTweets("Hello Mohe");
    await tweets.creatTweets("Hello Mohe");
    await tweets.creatTweets("Hello Mohe");
    await tweets.editTweet(0, "I love you");
    console.log(await tweets.getAllTweets());
    await tweets.transferTweet("0x8626f6940E2eb28930eFb4CeF49B2d1F2C9C1199", 0)
    await tweets.editTweet(0, "I love you");
    console.log(await tweets.getAllTweets());
    
}

main();

