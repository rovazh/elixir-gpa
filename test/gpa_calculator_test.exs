defmodule GpaCalculatorTest do
  use ExUnit.Case
  doctest GpaCalculator

  test "grade_to_points maps A to 2" do
    assert GpaCalculator.grade_to_points("A") === 2
  end
end
