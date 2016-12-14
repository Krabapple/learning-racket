## Basic
1. `(first (make-node "A" 100))` doesn't make sense because `make-node` is a structure, not a list.
2. Substitution rules

   ~~~~
  (cond [false exp] ... ) => (cond ... )
  (cond [true exp] ... ) => exp
  (cond [else exp]) => exp
  (and false ... ) => false
  (and true ... ) => (and ... )
  (and) => true
  (or true ... ) => true
  (or false ... ) => (or ... )
  (or) => false
   ~~~~


## Local
1. Pull what inside `local` to the top level and rename them.

  ~~~~
  (define (f x)
    (local [(define a (* 2 x))] a))
  (+ (f 1) (f 2))
  => (+ (local [(define a (* 2 x))] a) (f 2))
  => (define a_0 (* 1 2))
     (+ a_0 (f 2))
  => (define a_0 2)       ;; Eliminate the simpliest form. (This line never shows up below)
     (+ a_0 (f 2))
  => (+ 2 (f 2))
  => ...
  ~~~~


## Abstract List Functions
1. ALFs are all simplified in **ONE** step.
