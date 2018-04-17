import pyprimes as pyp

def main():
    result = sum(filter(pyp.isprime, [i for i in range(1,2000001)]))
    print(result)

if __name__ == '__main__':
    main()
