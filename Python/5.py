def main():
    print(wholeLCM([i for i in range(1,21)]))

def wholeLCM(A):
    if len(A)==1:
        return A[0]
    else:
        return lcm(A[0], wholeLCM(A[1:]))

def gcd(a,b):
    """Compute the greatest common divisor of a and b"""
    while b > 0:
        a, b = b, a % b
    return a
    
def lcm(a, b):
    """Compute the lowest common multiple of a and b"""
    return a * b / gcd(a, b)


if __name__=="__main__":
    main()
