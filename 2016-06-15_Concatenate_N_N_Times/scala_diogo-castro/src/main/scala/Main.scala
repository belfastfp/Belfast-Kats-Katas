import org.scalacheck.Gen
import org.scalatest.{Matchers, PropSpec}
import org.scalatest.prop.PropertyChecks
import org.scalacheck.Gen._

object Main extends App {
  def solve(s: String): Option[Int] =         // let s = "121212121212121212121212"
    s.toStream                                // 1. convert to a stream (a lazy list) of characters, to avoid unnecessary computations
      .scanLeft("")(_ + _)                    // 2. fold over the stream, collecting intermediate results,
                                              //    yielding Stream("", "1", "12", "121", ..., "121212121212121212121212") - these are our candidates
      .tail                                   // 3. drop the empty string at the head of the list
      .dropWhile(isTooSmall(_, s))            // 4. drop all candidates that are too small to be the solution
      .headOption                             // 5. the next candidate (if there are any left) should be either the solution,
                                              //    or too big (in which case there's no solution)
      .filter(isMatch(_, s))                  // 6. check if the candidate is the solution
      .map(_.toInt)

  def isTooSmall(candidate: String, input: String) = candidate.toInt * candidate.length < input.length

  def isMatch(candidate: String, input: String): Boolean = {
    val n = candidate.toInt
    List.fill(n)(candidate).mkString == input
  }

  SolveSpec.execute
}

object SolveSpec extends PropSpec with PropertyChecks with Matchers {

  import Main.solve

  val ns: Gen[Int] = chooseNum(1, 1000)

  property("finds the correct solution") {
    forAll(ns) { n: Int =>
      val input = List.fill(n)(n).mkString
      solve(input) shouldBe Some(n)
    }
  }

  val invalidInputs = Table(
    "7777778",
    "777777",
    "77777777",
    "121212121212121212121219",
    "12121212121212121212121",
    "12121212121212121212121212"
  )

  property("returns `None` when there is no solution") {
    forAll(invalidInputs) { input =>
      solve(input) shouldBe None
    }
  }
}

/*
  // naive solution presented at the meetup
object Main extends App {
  val result = input.inits.toList.reverse.toStream
    .filter(isNumber)
    .takeWhile(isLengthAcceptable(_, input))
    .find(isMatch(_, input))

  result match {
    case Some(x) => println(s"N = $x")
    case _       => println("The input format is invalid.")
  }

  def isNumber(s: String) = s.nonEmpty && s.forall(_.isDigit)

  def isLengthAcceptable(sub: String, input: String) = sub.length * sub.toInt <= input.length

  def isMatch(subStr: String, input: String): Boolean = {
    val n = subStr.toInt
    List.fill(n)(subStr).mkString == input
  }
}
*/

