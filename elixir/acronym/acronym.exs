defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    String.split(string, [" ", "-"]) |>
    Enum.map(&acronym_list/1) |>
    Enum.join
  end

  def acronym_list(string) do
    [head|tail] = String.codepoints(string)
    [String.upcase(head) | Enum.filter(tail, &upper?/1)]
  end

  def upper?(letter), do: String.match?(letter, ~r/\p{Lu}/u)
end
