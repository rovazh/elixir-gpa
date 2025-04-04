defmodule GpaCalculator do
  def load_grades_from_csv(filename) do
    case File.read(filename) do
      {:ok, body} ->
        String.split(body, "\n")
        |> List.delete_at(0)
        |> Enum.map(fn row ->
          r = String.split(row, ",")
          {Enum.at(r, 1), Enum.at(r, 2)}
        end)

      {:error, _reason} ->
        raise("no file")
    end
  end

  def calculate_gpa(grades) do
    sum =
      grades
      |> Enum.reduce(0, fn g, acc ->
        acc + grade_to_points(elem(g, 0)) * String.to_integer(elem(g, 1))
      end)

    sumCred = grades |> Enum.reduce(0, fn g, acc -> acc + String.to_integer(elem(g, 1)) end)
    sum / sumCred
  end

  def grade_to_points(grade) do
    %{
      "A-" => 1,
      "A" => 2,
      "A+" => 3,
      "B-" => 4,
      "B" => 5,
      "B+" => 6,
      "C-" => 7,
      "C" => 8,
      "C+" => 9,
      "D" => 10,
      "D+" => 11,
      "F" => 12
    }[grade]
  end

  def test() do
    load_grades_from_csv("/home/roman/edu/gpa_calculator/examples/grades.csv")
    |> calculate_gpa()
  end
end
