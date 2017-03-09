defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    Regex.scan(~r/(\p{L})\1*/, string) |>
    Enum.map_join("", &encode_element/1)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/\p{N}+\p{L}/, string) |>
    List.flatten |>
    Enum.reduce("", fn (x, acc) -> acc <> decode_element(x) end)
  end

  @spec encode_element([]) :: String.t
  defp encode_element(list = [occurences|letter]) do
    count = String.length(occurences)
    "#{count}#{letter}"
  end

  @spec encode_element(String.t) :: String.t
  defp decode_element(string) do
    {number, letter} = Integer.parse(string)
    String.duplicate(letter, number)
  end
end
