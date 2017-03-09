defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    response =
      with pling <- check(:three, number),
         plang <- check(:five, number),
         plong <- check(:seven, number),
      do: "#{pling}#{plang}#{plong}"

    if byte_size(response) == 0, do: "#{number}", else: response
  end

  defp check(:three, number) when rem(number, 3) == 0, do: "Pling"
  defp check(:five, number) when rem(number, 5) == 0, do: "Plang"
  defp check(:seven, number) when rem(number, 7) == 0, do: "Plong"
  defp check(_, number), do: ""
end
