defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0), do: raise ArgumentError
  def nth(count) do
    count
    |> bound
    |> primes_to
    |> Enum.at(count - 1)
  end

  defp bound(count) when count <= 6, do: 13
  defp bound(count) do
    count*:math.log(count) + count*:math.log(:math.log(count))
    |> round
  end

  defp primes_to(limit), do: 2..limit |> Enum.to_list |> select_primes(limit)

  defp select_primes(list, limit, acc \\ [])
  defp select_primes(list = [h | _], limit, acc) when h * h > limit,
    do: Enum.reverse(acc, list)
  defp select_primes([h | t], limit, acc) do
    Enum.filter(t, &(rem(&1, h) != 0))
    |> select_primes(limit, [h | acc])
  end
end
