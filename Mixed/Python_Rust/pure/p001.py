def answer():
    s = 0
    for number in range(1, 1000):
        if number % 3 == 0 or number % 5 == 0:
            s += number
    return s

if __name__=='__main__':
    print(answer())
