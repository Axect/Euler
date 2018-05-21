def gcd(a,b): 
    while b != 0:        
        a,b = b,a % b
    return a
               
def lcm(a,b):
    return a*b // gcd(a,b)

def LCM_2(A):
    if len(A)==1:
        return A[0]
    else:
        return lcm(A[0], LCM_2(A[1:])) 

def main():
    print(LCM_2([i for i in range(1,21)]))

if __name__ == '__main__':
    main()