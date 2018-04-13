function main()
    m0 = []
    m1 = []
    m2 = []
    m3 = []
    a = readcsv("11.csv")
    b = readcsv("11.csv")
    c = readcsv("11.csv")
    c = hcat(hcat(c[:,2], c[:,1]), c[:,3:end])
    for i = 1:20
        append!(m0,maxMultiple(diag(b)))
        append!(m1,maxMultiple(diag(c)))
        append!(m2,maxMultiple(a[i,:]))
        append!(m3,maxMultiple(a[:,i]))
        b = hcat(b[:,2:end], b[:,1])
        c = hcat(c[:,2:end], c[:,1])
    end
    println(maximum(m0))
    println(maximum(m1))
    println(maximum(m2))
    println(maximum(m3))
end

function maxMultiple(A::Array{Float64,1})
    m = []
    for j = 1:17
        s = 1
        for k = j:j+3
            s *= A[k]
        end
        append!(m,s)
    end
    return maximum(m)
end