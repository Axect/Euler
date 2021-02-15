using BenchmarkTools, Combinatorics

function p004()
    max_num = 0
    for i = 100:999
        for j = i:999
            num = i*j
            num_s = "$num"
            num_r = reverse(num_s)
            if num_s == num_r && max_num < num
                max_num = num
            end
        end
    end
    return max_num
end

function ispalindrome(n)
    return string(n) == reverse(string(n))
end

@btime p004()
@btime maximum(filter(ispalindrome, map(prod, combinations(100:999, 2))))
