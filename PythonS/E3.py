def is_primes(x): 
    for i in range(2,x//2):
        if x % i == 0:
            return False
    return True


def primes(n):
    fac = []
    m = n
    p =2
    while m >= p:
        if m % p == 0:
            fac.append(p)
            m = m // p 
        else:
             p +=1
             while not is_primes(p):
                 p +=1
    return fac

def main():
    print(max(primes(600851475143)))

if __name__ == '__main__':
    main()
