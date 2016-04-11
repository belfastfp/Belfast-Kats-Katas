package kata

import kata.Kata._
import org.scalacheck.Gen._
import org.scalatest._
import org.scalatest.prop._

/**
  * Created by Diogo on 06/04/2016.
  */
class SingSpec extends PropSpec with PropertyChecks with Matchers {

  property("a bottle is passed around as long as the wall is not empty") {
    forAll(posNum[Int]) { n =>
      sing(Wall(n)) should include ("Take one down and pass it around")
    }
  }

  property("n bottles of beer") {
    forAll { (n: Int) =>
      whenever(n > 2) {
        sing(Wall(n)) shouldBe s"$n bottles of beer on the wall, $n bottles of beer. Take one down and pass it around, ${n - 1} bottles of beer on the wall."
      }
    }
  }

  /** unit tests **/
  property("1 bottle") {
    sing(Wall(1)) shouldBe "1 bottle of beer on the wall, 1 bottle of beer. Take one down and pass it around, no more bottles of beer on the wall."
  }

  property("2 bottles") {
    sing(Wall(2)) shouldBe "2 bottles of beer on the wall, 2 bottles of beer. Take one down and pass it around, 1 bottle of beer on the wall."
  }

  property("no more bottles of beer") {
    sing(Wall(0)) shouldBe "No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more, 99 bottles of beer on the wall."
  }
}
