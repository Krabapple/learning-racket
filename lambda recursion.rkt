;; A function that consumes a natural number and produces its factorial
;;   using lambda recursion.

((lambda (x) (x x))
 (lambda (fact-gen)
   (lambda (n)
     (if (zero? n)
         1
         (* n ((fact-gen fact-gen) (sub1 n)))))))
        
;; Pretty fun.
;; For more details, check the following pages:
;; http://stackoverflow.com/questions/7719004/in-scheme-how-do-you-use-lambda-to-create-a-recursive-function
;; http://zzp.me/2013-09-05/y-combinator/ (Focus on the deduplication part.)
;; https://trow.cc/board/showtopic=16485
