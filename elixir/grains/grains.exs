defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  def square(1), do: 1

  @spec square(pos_integer) :: pos_integer
  def square(number) do
    1..(number-1) |> Enum.reduce(1, fn (_, acc) -> acc * 2 end)
  end

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total, do: Enum.reduce(1..64, 0, &(square(&1) + &2))
end
