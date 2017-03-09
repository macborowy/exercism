defmodule Diamond do
  @doc """
  Given a letter, it prints a diamond starting with 'A',
  with the supplied letter at the widest point.
  """
  @spec build_shape(char) :: String.t
  def build_shape(?A), do: "A\n"
  def build_shape(letter) do
    top = for l <- ?A..(letter - 1), do: line(l, letter)
    mid = line(letter, letter)
    bottom = Enum.reverse(top)

    Enum.join(top ++ [mid] ++ bottom, "\n") <> "\n"
  end

  def line(?A, final_letter) do
    List.duplicate(" ", final_letter - ?A)
    |> List.insert_at(-1, ?A)
    |> List.to_string
  end
  def line(letter, final_letter) do
    List.duplicate(" ", final_letter - letter)
    |> List.insert_at(list, -1, letter)
    |> Kernel.++(List.duplicate(" ", 2 * (letter - ?A + 1) - 3))
    |> List.insert_at(list, -1, letter)
    |> List.to_string
  end
end
