defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @separators [" ", ",", ":", "_", "!", "&", "@", "$", "%", "^", "&"]

  @spec count(String.t) :: map
  def count(sentence) do
    # dlaczego uwazam, ze pattern jest dobry?
    # O: ponieważ, pomyślmy tak, co jeśli ":" w następnej iteracji problemu
    # ma nie być separatorem (możliwa jest taka reguła biznesowa)
    # i co wtedy? mam znowu dokładać kolejne String.replace()?
    # moim zdaniem NIE, powinienem po prostu USUNĄĆ go z listy separatorów
    separators_pattern = :binary.compile_pattern(@separators)

    String.downcase(sentence) |>
    # String.replace("_", " ") |>
    # String.split(~r/[^\w-]/) |>
    String.split(separators_pattern) |>
    Enum.filter(&(&1 != "")) |>
    Enum.group_by(&(&1)) |>
    Enum.map(fn({k, v}) -> {k, length(v)} end) |>
    Enum.into(%{})
  end
end
