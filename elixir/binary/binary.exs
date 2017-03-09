defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    string
    |> to_char_list
    |> Enum.reverse
    |> convert(0, 0)
    |> round
  end

  def convert([], _, acc), do: acc
  def convert([?0 | t], iteration, acc), do: convert(t, iteration + 1, acc)
  def convert([?1 | t], iteration, acc), do: convert(t, iteration + 1, acc + :math.pow(2, iteration))
  def convert(_, _, _), do: 0
end
