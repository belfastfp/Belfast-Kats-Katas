fun main(args: Array<String>) {
    (100 downTo 1).forEach{
        sing(lineFor(it))
    }
}

private fun sing(line: String) = println(line) // totally unnecessary, but makes the code read a little better

private fun lineFor(numberOfBottles: Int): String =
    if (numberOfBottles == 1) { "${bottleLine(1)}\n${noBottlesLine()}" }
    else { "${bottleLine(numberOfBottles)}\n${oneLessBottleLine(numberOfBottles - 1)}" }

private fun correctWordFor(numberOfBottles: Int): String = 
    if (numberOfBottles == 1) {"bottle"} else {"bottles"}

private fun bottleLine(numberOf: Int) =
    "${numberOf} ${correctWordFor(numberOf)} of beer on the wall. ${numberOf} ${correctWordFor(numberOf)} of beer."

private fun oneLessBottleLine(numberOf: Int) =
    "Take one down, pass it around. ${numberOf} ${correctWordFor(numberOf)} of beer on the wall."

private fun noBottlesLine() =
    "Take one down, pass it around. No more bottles of beer on the wall."
