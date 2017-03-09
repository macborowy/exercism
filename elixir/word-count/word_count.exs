defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """

  @doc """
  All known separators
  """
  @separators [" ", ",", ":", "_", "!", "&", "@", "$", "%", "^", "&"]

  @spec count(String.t) :: map
  def count(sentence) do
    separators_pattern = :binary.compile_pattern(@separators)

    # words are compared case-insensitively.
    String.downcase(sentence) |>
    # separating
    String.split(separators_pattern) |>
    # group_by words {word => [all occurences of that word]}
    Enum.group_by(&(&1)) |>
    # k is single word (key); v is list with all occurrences of that word
    # first filter all elements that are empty string
    # then map list to number of occurrences (length(v))
    Enum.filter_map(fn({k, v}) -> k != "" end, fn({k, v}) -> {k, length(v)} end) |>
    # mapping list into dict
    Enum.into(%{})
  end
end
