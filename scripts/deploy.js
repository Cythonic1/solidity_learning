require("@nomicfoundation/hardhat-toolbox");
const { ethers } = require("hardhat");

async function deploy() {
    const Greeting = await ethers.getContractFactory("Greeting");
    const greeting = await Greeting.deploy();
    await greeting.waitForDeployment();

    console.log("Greeting deployed to:", greeting.target);
    return greeting;
}

async function main() {
    const greeting = await deploy();  // Call deploy and get the greeting contract
    console.log(await greeting.getGreeting());  // Assuming `getGreeting()` is a function in the contract
    console.log(await greeting.add(1, 200));
}

main();

