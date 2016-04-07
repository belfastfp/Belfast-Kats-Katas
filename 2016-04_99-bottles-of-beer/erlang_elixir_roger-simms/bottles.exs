defmodule Bottles do
  def run, do: run(99)

  defp run(num) do
    line1(num)
    line2(num-1)

    if num > 0, do: run(num-1)
  end

  defp count_bottles(num) do
    case num do
      0 -> "no"
      _ -> Integer.to_string(num)
    end
  end

  defp pluralise(num), do: if num != 1, do: "s"

  defp line1(num), do: IO.puts "#{String.capitalize(count_bottles(num))} bottle#{pluralise(num)} of beer on the wall, #{count_bottles(num)} bottle#{pluralise(num)} of beer."

  defp line2(num) do
    case num do
      -1 -> IO.puts "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      _ -> IO.puts "Take one down and pass it around, #{count_bottles(num)} bottle#{pluralise(num)} of beer on the wall.\n"
    end
  end
end

# Bottles.run()
