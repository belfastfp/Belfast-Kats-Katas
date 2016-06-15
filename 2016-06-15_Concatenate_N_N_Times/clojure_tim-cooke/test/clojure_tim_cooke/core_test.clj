(ns clojure-tim-cooke.core-test
  (:require [clojure.test :refer :all]
            [clojure-tim-cooke.core :refer :all]))

(deftest recurring-patterns
  (testing "Some patterns that do recur"
    (is (= 7 (concat-times 7777777)))
    (is (= 12 (concat-times 121212121212121212121212)))))

(deftest non-recurring-patterns
  (testing "Some patterns that do not recur"
    (is (= :none (concat-times 123)))
    (is (= :none (concat-times 2)))))
