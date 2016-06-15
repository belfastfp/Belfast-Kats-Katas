(ns clojure-tim-cooke.core
  (:gen-class))

(defn concat-times-iter [in-val mod-val]
  (let [pattern (mod in-val mod-val)
        repeated-pattern (read-string (reduce str (repeat pattern pattern)))]
    (cond
     (> (* pattern (count (str pattern))) (count (str in-val))) :none
     (= in-val repeated-pattern) pattern
     :else (concat-times-iter in-val (* mod-val 10)))))

(defn concat-times [in-val]
  (concat-times-iter in-val 10))

(defn -main
  "Runs some console output for inspection"
  [& args]
  (println (str "Input: 7777777, Output: " (concat-times 7777777)))
  (println (str "Input: 121212121212121212121212, Output: " (concat-times 121212121212121212121212)))
  (println (str "Input: 123, Output: " (concat-times 123))))
