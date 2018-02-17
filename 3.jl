function factor(n::Int)::Array{Int}
  m = Int(floor(n/2))
  a = []
  for i = 1:m
    if mod(n,i)==0
      append!(a,i)
    end
  end
  return a
end
