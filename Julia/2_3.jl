function fibTuple(t::Tuple{BigInt, BigInt, BigInt})::Tuple{BigInt,BigInt,BigInt}
  (x,y,z) = t
  if z == 0
    return t
  else
    return fibTuple((y, x+y, z-1))
  end
end

function fibResult(t::Tuple{BigInt,BigInt,BigInt})::BigInt
  return t[1]
end

function fib(n::BigInt)::BigInt
  a = BigInt(1)
  return fibResult(fibTuple((a,a,n)))
end
