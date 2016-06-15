(ns clojure-tim-cooke.core-test
  (:require [clojure.test :refer :all]
            [clojure-tim-cooke.core :refer :all]))

(deftest recurring-patterns
  (testing "Some patterns that do recur"
    (is (= {:pattern 7 :times 5} (concat-times 77777)))))
