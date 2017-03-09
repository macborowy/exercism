defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    sentence = String.replace(sentence, ~r/\W/u, "")

    sentence
    |> String.graphemes
    |> Enum.uniq
    |> Enum.count
    |> Kernel.==(String.length(sentence))
  end
end
