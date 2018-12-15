defmodule Prob10_2 do
  def prob10 do
    primes()
    |> Enum.sum
    |> IO.inspect
  end

  def is_prime(n) do
    import :math, only: [sqrt: 1]
    n_sq = n |> sqrt |> round

    if rem(n, 2) == 0 do
      false
    else
      Stream.iterate(3, &(&1 + 2))
      |> Stream.take_while(fn x -> x <= n_sq end)
      |> Enum.all?(fn x -> rem(n, x) > 0 end)
    end
  end

  def primes do
    xs = for x <- (2 .. 100_0000) do
      t = 2*x - 1
      if is_prime(t) do 
        t
      else
        0
      end
    end
    [2] |> Enum.concat(xs)
  end
end
