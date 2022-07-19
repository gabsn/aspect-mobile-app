1. Compile Starknet Contracts

```
starknet-compile starknet/contracts/ArgentAccount.cairo --output starknet/compiled_contracts/ArgentAccount.json --abi starknet/abi/ArgentAccount.abi.json --account_contract
```

2. Generate public key

```
python starknet/scripts/generate_private_key.py
```
