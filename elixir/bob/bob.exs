defmodule Bob do

  def hey(input) do
    cond do
      silence?(input) -> "Fine. Be that way!"
      question?(input) -> "Sure."
      yelling?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  @doc """
  Empty string means silence
  """
  def silence?(""), do: true

  @doc """
  Checks if input contain any other character than " " (whitespace)
  """
  def silence?(input) do
    Enum.filter(to_char_list(input), &(&1 != 32)) |>
    Enum.empty?
  end

  @doc """
  Checks if last character in String is "?"
  """
  def question?(input), do: String.ends_with?(input, "?")

  @doc """
  Checks if all letters in input are capitalized
  and if first character is letter (using regex)
  """
  def yelling?(input) do
    String.upcase(input) == input && String.match?(input, ~r/\p{L}/)
  end
end
