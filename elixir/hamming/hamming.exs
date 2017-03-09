defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) when length(strand1) == length(strand2) do
    # differences =
    #   Enum.zip(strand1, strand2)
    #   |> Enum.filter(fn {v1, v2} -> v1 !== v2 end)
    #   |> length
    #
    # {:ok, differences}
    {:ok, compare(strand1, strand2)}
  end
  def hamming_distance(_, _), do: {:error, "Lists must be the same length."}

  defp compare(strand1, strand2, differences \\ 0)
  defp compare([h | tail_1], [h | tail_2], differences) do
    compare(tail_1, tail_2, differences)
  end
  defp compare([_ | tail_1], [_ | tail_2], differences) do
    compare(tail_1, tail_2, differences + 1)
  end

  defp compare([], [], differences), do: differences
end
