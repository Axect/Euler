defmodule Prob2 do
    def prob2 do
        fib(400_0000)
            |> Enum.filter(fn(x) -> is_even(x) end)
            |> Enum.reduce(fn(x,y) -> x + y end)
            |> IO.inspect
    end

    def is_even(x) do
        rem(x, 2) == 0
    end

    def fib(n) do
        [1 | fib({1, 2}, n)]
    end

    def fib(tup, n) do
        {x, y} = tup
        if y < n do
            [y | fib({y, x+y}, n)]
        else
            []
        end
    end
end