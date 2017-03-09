defmodule Hexadecimal do
  use Bitwise
  @doc """
    Accept a string representing a hexadecimal value and returns the
    corresponding decimal value.
    It returns the integer 0 if the hexadecimal is invalid.
    Otherwise returns an integer representing the decimal value.

    ## Examples

      iex> Hexadecimal.to_decimal("invalid")
      0

      iex> Hexadecimal.to_decimal("af")
      175

  """
  @hex %{48 => 0, 49 => 1, 50 => 2, 51 => 3, 52 => 4, 53 => 5, 54 => 6, 55 => 7,
          56 => 8, 57 => 9, ?a => 10, ?A => 10, ?b => 11, ?B => 11, ?c => 12,
          ?C => 12, ?d => 13, ?D => 13, ?e => 14, ?E => 14, ?f => 15, ?F => 15}

  @spec to_decimal(binary) :: integer
  def to_decimal(hex) do
    hex
    |> to_char_list
    |> to_decimal(0)
  end

  def to_decimal([], acc), do: acc
  def to_decimal([head | tail], acc) when head in ?0..?9 or head in ?a..?f or head in ?A..?F do
    to_decimal(tail, (acc <<< 4) ||| @hex[head])
  end
  def to_decimal(_, _), do: 0
end
