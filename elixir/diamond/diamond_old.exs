defmodule Diamond do
  @doc """
  Given a letter, it prints a diamond starting with 'A',
  with the supplied letter at the widest point.
  """
  @spec build_shape(char) :: String.t
  def build_shape(letter) do
    letter
    |> get_letters
    |> set_letters_positions
    |> create_lines(letter)
    |> form_shape
    |> to_str
  end

  @spec get_letters(integer) :: [integer]
  def get_letters(letter) when letter in ?A..?Z do
    ?A..letter |> Enum.to_list
  end

  @spec set_letters_positions([integer]) :: [{integer, {integer, integer}}]
  def set_letters_positions(letters) do
    number_of_letters = letters |> length

    letters
    |> Enum.with_index
    |> Enum.map(&(get_positions(&1, number_of_letters)))
  end

  @spec get_positions(integer, integer) :: {integer, {integer, integer}}
  def get_positions({letter, index}, number_of_letters) do
    letter_index = index + 1

    first = number_of_letters - letter_index
    second = case letter do
      ?A -> first
      _ -> first + ((2 * letter_index) - 3) + 1
    end

    {letter, {first, second}}
  end

  def create_lines(list, letter) do
    template =
      letter
      |> line_length
      |> (fn length -> List.duplicate(" ", length) end).()

    list
    |> Enum.map(&put_letters(&1, template))
  end

  def line_length(letter) do
    2 * (letter - ?A) + 1
  end

  def put_letters({letter, {first_position, second_position}}, template) do
    template
    |> List.replace_at(first_position, letter)
    |> List.replace_at(second_position, letter)
  end

  def form_shape(lines) do
    lines = Enum.reverse(lines)
    [_ | tail] = lines

    form_shape(tail, lines)
  end
  def form_shape([], acc), do: acc
  def form_shape([head | tail], acc) do
    form_shape(tail, [head | acc])
  end

  def to_str(lines) do
    lines
    |> Enum.map(fn line -> List.to_string(line) |> String.trim_trailing end)
    |> Enum.join("\n")
    |> Kernel.<>("\n")
  end
end
