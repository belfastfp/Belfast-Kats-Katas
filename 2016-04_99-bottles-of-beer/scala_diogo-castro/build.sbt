name := "BeersKata"

version := "1.0"

scalaVersion := "2.11.8"


libraryDependencies ++= Seq(
  "org.scalaz" %% "scalaz-core" % "7.1.3",
  "org.scalaz" %% "scalaz-effect" % "7.1.3",

  "org.scalatest" %% "scalatest" % "2.2.4" % "test",
  "org.scalacheck" %% "scalacheck" % "1.12.5" % "test"
)


