defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    multiples(limit, factors)
    |> List.flatten
    |> Enum.uniq
    |> Enum.sum
  end

  defp multiples(limit, factors) do
    for f <- factors, do: Enum.filter(1..(limit - 1), &(rem(&1, f) == 0))
  end
end
