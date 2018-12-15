defmodule Prob10 do
  import Stream

  def prob10 do
    primes
    |> Enum.take_while(fn x -> x < 200_0000 end)
    |> Enum.sum
    |> IO.inspect
  end

  def is_prime(n) do
    import :math, only: [sqrt: 1]
    n_sq = n |> sqrt |> round

    if rem(n, 2) == 0 do
      false
    else
      iterate(3, &(&1 + 2))
      |> take_while(fn x -> x <= n_sq end)
      |> Enum.all?(fn x -> rem(n, x) > 0 end)
    end
  end

  def primes do
    ps = iterate(3, &(&1 + 2)) |> filter(fn x -> is_prime(x) end)
    [2] |> concat(ps)
  end
end
