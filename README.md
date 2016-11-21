# learning-racket
Some notes while using DrRacket.


## Week 9
* Stepping built-in functions: go straight to the end in __one step__.
* Always focus on what you want to produce. If you want to produce a function that consumes something and produces a two-argument function, then the code should be
~~~~~
(define (my-fn x)
  (lambda (x y) ...)      ;; here (x y) says the function it produces will consume two arguments, which meets our need.
~~~~~
* The first argument of `foldr` is a function that consumes two arguments (x and y, where x is the first item and y is the result of the rest).
