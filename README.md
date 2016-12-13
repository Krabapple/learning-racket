# learning-racket
Some notes while using DrRacket.

## Week 6
1. M06P33    
   When writing the function `insert`, you don't have to re-sort the consumed list, since the list given to the function `insert` is already a sorted list. See the code below.
   ~~~~
   (define (sort lon)
     (cond [(empty? lon) empty]
           [else (insert (first lon) (sort (rest lon)))]))
   
   (define (insert n slon)                                      ;; Note that "slon" stands for sorted list of num
    (cond [(empty? slon) (cons n empty)]
          [(<= n (first slon)) (cons n slon)]
          [else (cons (first slon) (insert n (rest slon)))]))
   ~~~~    

## Week 9
* Stepping built-in functions: go straight to the end in __one step__.
* Always focus on what you want to produce. If you want to produce a function that consumes something and produces a two-argument function, then the code should be
~~~~~
(define (my-fn x)
  (lambda (x y) ...)      ;; here (x y) says the function it produces
                          ;; will consume two arguments, which meets our need.
~~~~~
* The first argument of `foldr` is a function that consumes two arguments (x and y, where x is the first item and y is the result of the rest).

## Week 10
* `(identity n)` just produces the number/char/symbol itself.  
  (identity 78) -> 78  
  (identity 'a) -> 'a  
  (identity "abc") -> "abc"
