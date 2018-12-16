defmodule Prob13 do
  def prob13 do
    {:ok, txt} = File.read("../Data/13.txt")
    txt
    |> String.split("\n")
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn x -> String.to_integer(x) end)
    |> Enum.sum
    |> IO.inspect
  end
end
