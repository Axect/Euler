defmodule Prob8 do
  def prob8 do
    {:ok, txt} = File.read("../Data/8.txt")
    txt 
      |> String.graphemes
      |> Enum.map(fn x -> String.to_integer(x) end)
      |> product(13)
      |> IO.inspect
  end

  def product(ns, num) do
    l = length ns
    cond do
      l >= num ->
        p = ns 
            |> Enum.take(num)
            |> Enum.reduce(fn(x,y) -> x * y end)
        new_ns = ns |> Enum.drop(1)
        max(p, product(new_ns, num))
      true -> 0
    end
  end
end
