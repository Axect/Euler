def is_primes(x): 
    for i in range(2,x//2):
        if x % i == 0:
            return False
    return True

def main():
    pr = []
    i = 0
    while len(pr) <=10000:
        if is_primes(i):
            pr.append(i)
        i += 1
    print(pr[-1])

if __name__ == '__main__':
    main()
