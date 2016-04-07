package kata

import kata.Kata._
import org.scalacheck.Gen._
import org.scalatest._
import org.scalatest.matchers._
import org.scalatest.prop.PropertyChecks

/**
  * Created by Diogo on 06/04/2016.
  */
class WallStatesSpec extends PropSpec with PropertyChecks with Matchers with LoneElement {

  val initialBottlesCount = choose(0, 300)

  property("each step takes 1 bottle of beer from the wall") {
    forAll(initialBottlesCount) { n =>
      val walls = wallStates(n)
      val pairs = walls.sliding(2).toSeq.collect { case Seq(a, b) => (a, b) }

      all (pairs) shouldBe OneBeerApart
    }
  }

  property("the first wall state contains n bottles of beer") {
    forAll(initialBottlesCount) { n =>
      wallStates(n).head.beers shouldEqual n
    }
  }

  property("the last wall state contains 0 bottles of beer") {
    forAll(initialBottlesCount) { n =>
      wallStates(n).last.beers shouldEqual 0
    }
  }

  property("cannot start with a negative number of bottles") {
    forAll(negNum[Int]) { n =>
      a [Exception] should be thrownBy Wall(n)
    }
  }

  /** unit tests **/
  property("starting with 0 bottles yields one empty wall") {
    wallStates(0).toSet.loneElement shouldBe Wall(0)
  }

  object OneBeerApart extends BeMatcher[(Wall, Wall)] {
    def apply(left: (Wall, Wall)) = left match {
      case (Wall(a), Wall(b)) => MatchResult(
        a - b == 1,
        s"Walls with $a beers and $b beers were not 1 beer apart",
        s"Walls with $a beers and $b beers were 1 beer apart")
    }
  }
}
