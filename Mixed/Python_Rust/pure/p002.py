def answer():
    fib = (1, 2)
    s = 0
    while fib[0] <= 4000000:
        if fib[0] % 2 == 0:
            s += fib[0]
        fib = (fib[1], fib[0] + fib[1])
    return s

if __name__ == "__main__":
    print(answer())
    