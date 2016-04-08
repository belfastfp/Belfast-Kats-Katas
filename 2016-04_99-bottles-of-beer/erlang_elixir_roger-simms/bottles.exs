defmodule Bottles do
  def start, do: run(99)

  defp run(-1), do: :ok
  defp run(num) do
    line1(num)
    line2(num-1)
    run(num-1)
  end

  defp count_bottles(0), do: "no"
  defp count_bottles(num), do: Integer.to_string(num)

  defp pluralise(num), do: if num != 1, do: "s"

  defp line1(num), do: IO.puts "#{String.capitalize(count_bottles(num))} bottle#{pluralise(num)} of beer on the wall, #{count_bottles(num)} bottle#{pluralise(num)} of beer."
  defp line2(-1), do: IO.puts "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  defp line2(num), do: IO.puts "Take one down and pass it around, #{count_bottles(num)} bottle#{pluralise(num)} of beer on the wall.\n"
end

# Bottles.start()
