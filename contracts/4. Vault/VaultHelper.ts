import { expect } from "chai";
import { providers } from "ethers";
import { ethers, waffle } from "hardhat";



const helper = async (victim: any) => {
  /* 
    Add code here that will help you pass the test
    Note: Unlock without using the string "A very strong password"
    Unlock the vault by somehow reading the private password from 
    Vault directly
  */

  // got help from https://medium.com/coinmonks/a-quick-guide-to-hack-private-variables-in-solidity-b45d5acb89c0

  const decodePassword = async() => {
    const storage1 = await ethers.provider.getStorageAt(victim.address, 1);
    return ethers.utils.parseBytes32String(storage1);
  }

  const passWord = await decodePassword();
  await victim.unlock(ethers.utils.formatBytes32String(passWord));

};

export default helper;
