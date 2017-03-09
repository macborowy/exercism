defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.filter(candidates, &(not is_duplicate?(base, &1))) |>
    Enum.filter(&(is_anagram?(base, &1)))
  end

  @spec is_duplicate?(String.t, String.t) :: Boolean
  defp is_duplicate?(str1, str2) do
    String.downcase(str1) == String.downcase(str2)
  end

  @spec is_anagram?(String.t, String.t) :: Boolean
  defp is_anagram?(base, candidate) do
    base_sorted = sort_letters(base)
    candidate_sorted = sort_letters(candidate)

    base_sorted == candidate_sorted
  end

  @doc """
  Sorts letters in string in ascending order (case insensitive)
  """
  @spec sort_letters(String.t) :: String.t
  defp sort_letters(string) do
    String.downcase(string) |>
    String.to_char_list |>
    Enum.sort
  end
end
