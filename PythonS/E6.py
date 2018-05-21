from functools import reduce

print((reduce(lambda a,b : a+b, range(1,101)))**2 - reduce(lambda a,b : a+b, map(lambda x : x**2,range(1,101))))