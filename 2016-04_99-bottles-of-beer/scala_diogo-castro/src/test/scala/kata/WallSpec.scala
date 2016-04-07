package kata

import kata.Kata._
import org.scalacheck._
import org.scalacheck.Gen._
import org.scalatest._
import org.scalatest.prop.PropertyChecks

/**
  * Created by Diogo on 06/04/2016.
  */
class WallSpec extends PropSpec with PropertyChecks with Matchers {
  val nonNegInt = Gen.choose(0, Int.MaxValue)
  val walls = nonNegInt map Wall.apply

  property("taking one bottle from a non-empty wall leaves it with one less bottle") {
    forAll(walls) { (wall: Wall) =>
      whenever(wall.beers > 0) {
        wall.take.beers shouldEqual wall.beers - 1
      }
    }
  }

  property("wall cannot have a negative number of bottles") {
    forAll(negNum[Int]) { i =>
      a [Exception] should be thrownBy Wall(i)
    }
  }

  /** unit tests **/
  property("bottles cannot be taken from an empty wall") {
    a [Exception] should be thrownBy Wall(0).take
  }
}
