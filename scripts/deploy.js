async function main() {
    const nftContractFactory = await hre.ethers.getContractFactory("BitApps");
    const nftContract = await nftContractFactory.deploy();
    await nftContract.deployed();
    console.log("Contract deployed to:", nftContract.address);
}

main();