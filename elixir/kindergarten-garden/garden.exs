defmodule Garden do
  @plants %{"R" => :radishes, "C" => :clover, "G" => :grass, "V" => :violets}
  @default_students [:alice, :bob, :charlie, :david, :eve, :fred, :ginny, :harriet, :ileana, :joseph, :kincaid, :larry]

  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """
  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @default_students) do
    info_string
    |> chunk_plants
    |> to_students_plants(student_names)
  end

  @doc ~S"""
  Maps plants string into four element tuples of plant atoms.

  ## Examples

      iex> Garden.chunk_plants("RCCC\nGVGV")
      [{:radishes, :clover, :grass, :violets}, {:clover, :clover, :grass, :violets}]
  """
  def chunk_plants(string) do
    string
    |> String.split("\n")
    |> Enum.map(&String.graphemes/1)
    |> (fn [row1, row2] -> Enum.zip(row1, row2) end).()
    |> Enum.chunk(2)
    |> Enum.map(
      fn [{p1, p2}, {p3, p4}]
      -> {@plants[p1], @plants[p3], @plants[p2], @plants[p4]} end)
  end

  @doc """
  Combine student names (in alphabetical order) with plant tuples into map.

  ## Examples

      iex> Garden.to_students_plants([{:grass, :grass, :grass, :grass}], [:alice])
      %{:alice => {:grass, :grass, :grass, :grass}}
  """
  def to_students_plants(plants, students) do
    students_map = initialize_students_map(students)

    students
    |> Enum.sort
    |> Enum.zip(plants)
    |> Enum.into(students_map)
  end

  defp initialize_students_map(student_names) do
    student_names
    |> Enum.map(fn name -> {name, {}} end)
    |> Enum.into(%{})
  end
end
