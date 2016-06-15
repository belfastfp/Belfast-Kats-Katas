(ns clojure-tim-cooke.core
  (:gen-class))

(defn concat-times [val]
  {:pattern 7 :times 5})

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println "Tests:")
  (println (str "77777" " " (concat-times 77777))))
