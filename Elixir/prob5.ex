defmodule Prob5 do
    import Integer, only: [gcd: 2]

    def prob5 do
        (1 .. 20)
            |> Enum.reduce(fn (x, y) -> lcm(x, y) end)
            |> IO.inspect
    end

    def lcm(x, y) do
        g = gcd(x, y)
        x * y |> div(g)
    end
end