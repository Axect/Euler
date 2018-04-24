def main():
    print(path(20, 20))

def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n-1)

def path(h, v):
    return factorial(h+v)/(factorial(h) * factorial(v))

if __name__ == '__main__':
    main()
