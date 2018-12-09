defmodule Prob1 do
    def prob1 do
        (1 .. 999)
            |> Enum.filter(fn(x) -> rem(x, 3) == 0 || rem(x, 5) == 0 end)
            |> Enum.reduce(fn(x, y) -> x + y end)
            |> IO.inspect
    end
end