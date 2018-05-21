def is_primes(x): 
    for i in range(2,x//2):
        if x % i == 0:
            return False
    return True

def main():
    print(sum(list(filter(is_primes,range(2,2000000)))))
    
if __name__ == '__main__':
    main()
