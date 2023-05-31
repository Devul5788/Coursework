from functools import reduce
import sys
import pbp
from fractions import gcd
from operator import mul
from Crypto.PublicKey import RSA

def product_tree(X):
    result = [X]
    while len(X) > 1:
        X = [reduce(mul, X[(i * 2):((i + 1) * 2)], 1) for i in range((len(X) + 1) // 2)]
        result.append(X)
    return result

def remainder_tree(X):
    remainders = X.pop()
    while X:
        div = X.pop()
        remainders = [remainders[i // 2] % div[i] ** 2 for i in range(len(div))] # /
    return remainders, div

def euclidGCD(a, b):
    if a == 0:
        return (b, 0, 1)
    else:
        g, y, x = euclidGCD(b % a, a)
        return (g, x - (b // a) * y, y)

def modinv(a, m):
    g, x, y = euclidGCD(a, m)
    if g != 1:
        raise Exception('modular inverse does not exist')
    else:
        return x % m

def batchgcd_simple(modulo_array):
    r, d = remainder_tree(product_tree(modulo_array))
    return [gcd(r // n, n) for r, n in zip(r, d)] # /

modulo_array = []

with open(sys.argv[1], 'r') as f:
    ct = "".join(f.readlines())

with open(sys.argv[2], 'r') as f:
    for line in f:
        modulo_array.append(int(line.rstrip(), 16))

gcds = batchgcd_simple(modulo_array)

for gcd, modulo in zip(gcds, modulo_array):
    if gcd != 1:
        phi = (gcd - 1) * ((modulo // gcd) - 1)
        d = modinv(65537, phi)
        key = RSA.construct((modulo, 65537, d))
        try:
            plaintext = pbp.decrypt(key, ct)
            plaintext_str = plaintext.decode()
            print(plaintext_str)
            with open(sys.argv[3], "w") as f1:
                f1.write(plaintext_str)
            break
        except ValueError:
            pass

# Sources:
# remainder_tree(): https://facthacks.cr.yp.to/remainder.html
# euclidGCD() and modinv(): https://stackoverflow.com/questions/4798654/modular-multiplicative-inverse-function-in-python
# batchgcd_simple(): https://facthacks.cr.yp.to/batchgcd.html
# product_tree(): https://facthacks.cr.yp.to/product.html