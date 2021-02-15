using BenchmarkTools

const num = 600851475143
const sqrtn = sqrt(num)

function p003()
    c = 3
    v_num = num
    max = num
    while c <= sqrtn
        while v_num % c == 0
            v_num /= c
            max = c
        end
        c += 2
    end
    return max
end

@btime p003()
