## Euler 1.
# procedure
def main():
    a = 0
    for i in range(1,1000):
        if i % 3 == 0 or i % 5 == 0 : 
            a += i
    return a

if __name__ == '__main__':
    main()
print(main())

## 233168

## funtion 
print(sum(list(filter(lambda x : x % 3 ==0 or x% 5==0,range(1,1000)))))
