defmodule Luhn do
  @doc """
  Calculates the total checksum of a number
  """
  @spec checksum(String.t()) :: integer
  def checksum(number) do
    number
    |> String.graphemes
    |> Enum.map(&String.to_integer/1)
    |> Enum.reverse
    |> Enum.with_index
    |> Enum.reduce(0, fn (x, acc) -> acc + map_digit(x) end)
  end

  @spec map_digit({integer, integer}) :: integer
  def map_digit({number, index}) when rem(index, 2) == 0, do: number
  def map_digit({number, _}) when number * 2 >= 10, do: number * 2 - 9
  def map_digit({number, _}), do: number * 2

  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
    is_valid? = fn checksum -> rem(checksum, 10) == 0 end

    number
    |> checksum
    |> is_valid?.()
  end

  @doc """
  Creates a valid number by adding the correct
  checksum digit to the end of the number
  """
  @spec create(String.t()) :: String.t()
  def create(number) do
    if valid?(number) do
      number
    else
      Enum.map(0..9, fn digit -> "#{number}#{digit}" end)
      |> Enum.find(fn new_number -> valid?(new_number) end)
    end
  end
end
