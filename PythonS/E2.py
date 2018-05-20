## Euler 2
# proceduse

def fibo(x):
    a,b = 1,1
    for i in range(1,x+1):
        a,b = b,a+b
    return a

def main():
    s = 0 
    l = 1
    while fibo(l) < 4000000:
        if fibo(l) % 2 ==0 :
            s += fibo(l)
        l +=1
    print(s)

if __name__ == '__main__':
    main()