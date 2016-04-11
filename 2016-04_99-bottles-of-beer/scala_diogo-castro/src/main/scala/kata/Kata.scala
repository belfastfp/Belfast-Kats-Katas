package kata

import scalaz.Scalaz._
import scalaz.effect.IO

/**
  * Created by Diogo on 06/04/2016.
  */
object Kata extends App {

  case class Wall(beers: Int) {
    require(beers >= 0)

    def take = Wall(beers - 1)
  }

  def sing(w: Wall): String =
    w match {
      case Wall(0) => "No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more, 99 bottles of beer on the wall."
      case Wall(n) =>
        val bottlesOfBeer = bottlesToStr(n)
        s"$bottlesOfBeer of beer on the wall, $bottlesOfBeer of beer. " +
          s"Take one down and pass it around, ${bottlesToStr(n - 1)} of beer on the wall."
    }

  def bottlesToStr(i: Int) = i match {
    case 0 => "no more bottles"
    case 1 => "1 bottle"
    case _ => s"$i bottles"
  }

  def wallStates(bottles: Int): List[Wall] =
    List.iterate(Wall(bottles), bottles + 1)(_.take)

  val walls = wallStates(100)
  val lyrics = walls map sing

  val io: IO[List[Unit]] = (lyrics map IO.putStrLn).sequenceU

  // we've reached "the end of the universe"; perform all side-effects here
  io.unsafePerformIO
}
