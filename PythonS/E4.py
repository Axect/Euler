def main():
    palindromes = [] 
    for i in range(100,1000): 
        for j in range(i,1000): 
            n = str(i * j) 
            for k in range(len(n)): 
                if n[k] != n[-(k+1)]:
                    break 
            else: 
                palindromes.append(i * j)

    print(max(palindromes)) 


if __name__ == '__main__':
    main()