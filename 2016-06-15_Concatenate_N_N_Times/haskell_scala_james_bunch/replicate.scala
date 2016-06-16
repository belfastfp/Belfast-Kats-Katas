object scratch {

  def repl(n: Int): String = {
		val s=n.toString
  	List.fill(n)(s).mkString("")
  	}                                         //> repl: (n: Int)String

  // PossibleApproaches
  // 1) regex?
  // 2) find factors, eliminate them? always smallest factor?
  // 3) start with first digit - test and then move on if not long enough?
  def unrepl(s: String): Option[Int] = {
    def ok(check: String) = (check.length * check.toInt) == s.length

		val maxDigits= Math.log10(s.length+1).ceil.toInt
    val candidates = s.take(maxDigits).inits.toList.reverse.tail
    candidates.find { ok(_) } map { _.toInt }
  }                                               //> unrepl: (s: String)Option[Int]
  
  unrepl(repl(392))                               //> res0: Option[Int] = Some(392)
  unrepl(repl(39))                                //> res1: Option[Int] = Some(39)
  unrepl(repl(999999))                            //> res2: Option[Int] = Some(999999)
  
  1.to(1000).map(i => unrepl(repl(i)).get == i).reduceLeft(_ && _)
                                                  //> res3: Boolean = true
  
 

}