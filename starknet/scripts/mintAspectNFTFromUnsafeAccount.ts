import { Account, defaultProvider, ec, number } from "starknet";

// https://goerli.voyager.online/contract/0x00daa3d87fd97cf920edaeb13e7fc342a748cb8eab43ff5dee2e54c6542608cf#readContract
const accountAddress =
  "0x00daa3d87fd97cf920edaeb13e7fc342a748cb8eab43ff5dee2e54c6542608cf";
const pubKey = "0x1717";
const privKey =
  "1507006766355892958516764486967006466194506203002516466097524351150155385502";

async function main() {
  const kp = ec.getKeyPair(number.toBN(privKey));
  console.log(number.toBN(kp.getPublic("hex"), "hex").toString());
  const account = new Account(defaultProvider, accountAddress, kp);
  console.log(account);
}

main();
