defmodule Prob9 do
  def prob9 do
    {x,y,z} = 
      triplet() 
      |> Enum.find(fn {x, y, z} -> x*x + y*y == z*z end)
    x*y*z |> IO.inspect
  end

  def triplet do
    tuples = for x <- 1 .. 333, y <- x .. 499 do
      z = 1000 - (x + y)
      {x, y, z}
    end
    tuples
  end
end
