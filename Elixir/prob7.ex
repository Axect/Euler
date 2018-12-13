defmodule Prob7 do
    import Stream

    def prob7 do
        primes()
            |> Enum.at(10000)
            |> IO.inspect
    end


    def is_prime(n) do
        import :math, only: [sqrt: 1]

        n_sq = n |> sqrt |> round

        cond do
            n_sq < 2 -> n == 2 || n == 3
            rem(n, 2) == 0 -> false
            true -> 
                iterate(3, &(&1 + 2))
                    |> take_while(fn x -> x <= n_sq end)
                    |> Enum.all?(fn x -> rem(n, x) > 0 end)
        end
    end

    def primes do
        concat([2], filter(iterate(3, &(&1 + 2)), fn x -> is_prime(x) end))
    end
end