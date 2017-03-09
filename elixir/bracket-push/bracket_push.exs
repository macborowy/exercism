defmodule BracketPush do

  @non_bracket_characters_pattern ~r/[^\{\}\[\]\(\)]/
  @bracket_pairs_pattern ~r/(\{\}|\[\]|\(\))/

  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    trimmed = str
      |> remove_non_bracket_characters
      |> remove_all_bracket_pairs

    byte_size(trimmed) == 0
  end

  def remove_non_bracket_characters(str) do
    String.replace(str, @non_bracket_characters_pattern, "")
  end

  def remove_all_bracket_pairs(str) do
    result = String.replace(str, @bracket_pairs_pattern, "")

    if String.contains?(result, ["{}", "[]", "()"]) do
      remove_all_bracket_pairs(result)
    else
      result
    end
  end
end
