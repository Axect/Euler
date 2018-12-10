defmodule Prob6 do
    def prob6 do
        (1 .. 100)
            |> compare
            |> IO.inspect
    end

    def compare(xs) do
        s1 = xs
            |> Enum.map(fn x -> x * x end)
            |> Enum.sum

        s2 = xs |> Enum.sum
        s2 = s2 * s2

        s2 - s1       
    end
end