import scala.io.Source

object Test extends App {

  def bottlesOfBeerLyrics(n: Int): String = {

    def qty(idx: Int) = idx match {
      case -1 => s"$n bottles of beer"
      case 0  => "no more bottles of beer"
      case 1  => "1 bottle of beer"
      case x  => s"$x bottles of beer"
    }

    def action(n: Int) = n match {
      case 0 => "Go to the store and buy some more"
      case _ => s"Take one down and pass it around"
    }

    n.to(0, -1).flatMap(idx =>
      s"${qty(idx).capitalize} on the wall, ${qty(idx)}.\r\n"
        + s"${action(idx)}, ${qty(idx - 1)} on the wall.\r\n").dropRight(2).mkString
  }

  def recursiveBottlesOfBeerLyrics(n: Int) = {
    def go(idx: Int): String = idx match {
      case 0 => "No more bottles of beer on the wall, no more bottles of beer.\r\n" +
        s"Go to the store and buy some more, $n bottles of beer on the wall."

      case 1 => "1 bottle of beer on the wall, 1 bottle of beer.\r\n" +
        s"Take one down and pass it around, no more bottles of beer on the wall.\r\n" +
        go(idx - 1)

      case 2 => s"2 bottles of beer on the wall, 2 bottles of beer.\r\n" +
        s"Take one down and pass it around, 1 bottle of beer on the wall.\r\n" +
        go(idx - 1)

      case x => s"$x bottles of beer on the wall, $x bottles of beer.\r\n" +
        s"Take one down and pass it around, ${x - 1} bottles of beer on the wall.\r\n" +
        go(idx - 1)
    }

    go(n)
  }

  val canon = Source.fromFile("C:\\streams\\spikes\\Scratch\\src\\lyrics.txt").mkString

  val generated = bottlesOfBeerLyrics(99)
  assert(generated == canon)

  val generatedRecursively = recursiveBottlesOfBeerLyrics(99)
  assert(generatedRecursively == canon)
}