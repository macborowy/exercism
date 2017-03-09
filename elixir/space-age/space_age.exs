defmodule SpaceAge do
  @earth_year_in_seconds 31557600

  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / (@earth_year_in_seconds * year_length_on(planet))
  end

  def year_length_on(planet) do
    case planet do
      :earth -> 1
      :mercury -> 0.2408467
      :venus -> 0.61519726
      :mars -> 1.8808158
      :jupiter -> 11.862615
      :saturn -> 29.447498
      :uranus -> 84.016846
      :neptune -> 164.79132
    end
  end
end
