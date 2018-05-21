def main():
    for b in range(1,1000):
        for a in range(b,1000):
            if a**2 + b**2 == (1000-a-b)**2:
                print(a*b*(1000-a-b))

if __name__ == '__main__':
    main()