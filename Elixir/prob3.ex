defmodule Prob3 do
    import :math, only: [sqrt: 1]

    def prob3 do
        prime_factor(600851475143)
            |> Enum.max
            |> IO.inspect
    end

    def prime_factor(n) do
        prime_factor(n, 2)
    end

    defp prime_factor(n, p) do
        unless is_prime(p) do
            cond do
                n < p -> []
                true -> prime_factor(n, p+1)
            end
        else
            cond do
                n < p -> []
                rem(n, p) == 0 -> [p | prime_factor(div(n, p), p)]
                true -> prime_factor(n, p+1)
            end
        end
    end

    def is_prime(n) do
        if n > 3 do
            ns = n |> sqrt |> round
            (2 .. ns)
                |> Enum.all?(fn(x) -> rem(n, x) != 0 end)
        else
            case n do
                2 -> true
                3 -> true
                _ -> false
            end
        end
    end
end