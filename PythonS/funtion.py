# filter : 걸러주는 함수
# a = list(filter(lambda x : x <3,[4,2,3,5,1]))
# print(a)

def primes(x): # 소수인지 아닌지 확인하는 함수
    for i in range(2,x//2):
        if x % i == 0:
            return False
    return True

print(list(filter(primes,range(1,101))))

# map :구조적 재귀 회피 타입을 변환가능 ,고정 도르래의 역활, 전체 타입을 바꿀때
list(map(lambda x : x**2 ,range(1,101)))

mat = [[1,3,2,4],[5,1,3,1],[6,8,-1,9],[10,11,5,8]]
print(list(map(lambda x : list(filter(lambda t : t%2==0,x)),mat)))
print(list(map(lambda x : list(map(lambda t : t**2,x)),mat)))
print(list(map(lambda x : list(map(lambda t : str(t),x)),mat)))

# from functools import reduse
# reduse : 리스트를 접어서 값으로 만들어 드립니다 
from functools import reduce
print(reduce(lambda a,b : a+b, map(lambda x : x**2,range(1,101))))
print(reduce(lambda a,b : a+b, filter(lambda x : x%3==0 or x%5==0 ,range(1,1000))))

#  from ietrtools import takewhile 
# takewhile : filter 상위 버전

print((reduce(lambda a,b : a+b, range(1,101)))**2 - reduce(lambda a,b : a+b, map(lambda x : x**2,range(1,101))))
