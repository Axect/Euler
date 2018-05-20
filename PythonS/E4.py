def main():
    palindromes = [] # 대칭수 모음
    for i in range(100,1000): # 세자리 수
        for j in range(i,1000): # 세자리 수
            n = str(i * j) # 문자열로 봐야해서 string으로 바꿔줌
            for k in range(len(n)): # 대칭수 확인
                if n[k] != n[-(k+1)]:
                    break # 대칭수가 아니다
            else: # 대칭수
                palindromes.append(i * j)

    print(max(palindromes)) # 커지는순대로, 최대값


if __name__ == '__main__':
    main()