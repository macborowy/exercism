defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    meetup(year, month, 1, weekday, schedule)
  end

  def meetup(year, month, day, weekday, schedule) do
    test = get_weekday(year, month, day)

    cond do
      test == weekday and is_valid_week?(year, month, day, schedule)
        -> {year, month, day}
      true -> meetup(year, month, day + 1, weekday, schedule)
    end
  end

  def is_valid_week?(year, month, day, schedule) do
    last_the_of_the_month = :calendar.last_day_of_the_month(year, month)

    cond do
      day >= 1  and day <= 7  and schedule == :first -> true
      day >= 8  and day <= 14 and schedule == :second -> true
      day >= 15 and day <= 21 and schedule == :third -> true
      day >= 22 and day <= 28 and schedule == :fourth -> true
      day >= 13 and day <= 19 and schedule == :teenth -> true
      day >=  last_the_of_the_month - 6
          and day <= last_the_of_the_month
          and schedule == :last -> true
      true -> false
    end
  end

  @spec get_weekday(Int, Int, Int) :: Int
  def get_weekday(year, month, day) do
    :calendar.day_of_the_week({year, month, day})
    |> integer_to_weekday
  end

  @spec integer_to_weekday(Int) :: weekday
  def integer_to_weekday(value) do
    case value do
      1 -> :monday
      2 -> :tuesday
      3 -> :wednesday
      4 -> :thursday
      5 -> :friday
      6 -> :saturday
      7 -> :sunday
    end
  end
end
