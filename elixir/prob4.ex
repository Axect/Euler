defmodule Prob4 do
    def prob4 do
        import Enum

        (100 .. 999)
            |> map(fn x -> {x, x .. 999} end)
            |> flat_map(fn {x, xs} -> map(xs, fn t -> x * t end) end)
            |> filter(fn v -> is_palindrome(v) end)
            |> max
            |> IO.inspect
    end

    def is_palindrome(n) do
        n_str = n |> Integer.to_string
        rev_n = n_str |> String.reverse 
        n_str == rev_n
    end
end