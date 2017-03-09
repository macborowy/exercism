defmodule Roman do
  @conversions [
    %{arabic: 1000, roman: "M"},
    %{arabic: 900, roman: "CM"},
    %{arabic: 500, roman: "D"},
    %{arabic: 400, roman: "CD"},
    %{arabic: 100, roman: "C"},
    %{arabic: 90, roman: "XC"},
    %{arabic: 50, roman: "L"},
    %{arabic: 40, roman: "XL"},
    %{arabic: 10, roman: "X"},
    %{arabic: 9, roman: "IX"},
    %{arabic: 5, roman: "V"},
    %{arabic: 4, roman: "IV"},
    %{arabic: 1, roman: "I"},
    %{arabic: 0, roman: "nulla"},
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    number
    |> do_numerals
    |> List.to_string
  end

  def do_numerals(number, acc \\ [])
  def do_numerals(0, acc), do: Enum.reverse(acc)
  def do_numerals(number, acc) do
    %{arabic: arabic, roman: roman} =
      @conversions
      |> Enum.find(&(number >= &1.arabic))

    do_numerals(number - arabic, [roman | acc])
  end
end
