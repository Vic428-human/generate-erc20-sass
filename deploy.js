// Sample
const main = async () => {
  const ContractFactory = await hre.ethers.getContractFactory(
    "your-contract-name"
  ); // the file name under 'contracts' folder, without '.sol'
  const Contract = await ContractFactory.deploy(param1, param2); // the constructor params
  await Contract.deployed();
  console.log("Contract deployed to:", Contract.address);
  // // You can test the function.
  // let txn = await nftContract.functionName()
  // // Wait for it to be mined.
  // await txn.wait()
  // console.log("function invoked!")
};
const runMain = async () => {
  try {
    await main();
    process.exit(0); // emit the exit event that ends all tasks immediately even if there still are asynchronous operations not done. The shell that executed the node should see the exit code as 0.
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};
runMain();
