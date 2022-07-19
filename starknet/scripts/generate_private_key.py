from starkware.starknet.compiler.compile import get_selector_from_name
from nile.signer import Signer

# Pub key: 1507006766355892958516764486967006466194506203002516466097524351150155385502
PUBLIC_KEY = 0x1717

signer = Signer(PUBLIC_KEY)
print(signer.public_key)