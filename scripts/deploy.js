require("@nomicfoundation/hardhat-toolbox");
const { ethers } = require("hardhat");

async function deploy() {
    // When deploy we focus on the name of the contract it self not the file name of the contract;
    const Greeting = await ethers.getContractFactory("Visibility");
    const greeting = await Greeting.deploy();
    await greeting.waitForDeployment();

    console.log("Greeting deployed to:", greeting.target);
    return greeting;
}

async function main() {
    const vis = await deploy();  // Call deploy and get the greeting contract
    // console.log(await greeting.getGreeting());  // Assuming `getGreeting()` is a function in the contract
    // console.log(await greeting.add(1, 200));
    console.log(await vis.getString());
    console.log(await vis.helloOutSide());

}

main();

