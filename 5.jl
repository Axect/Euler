function wholeLCM(A)
  if length(A) == 1
    return A[1]
  else
    return lcm(A[1], wholeLCM(A[2:end]))
  end
end
