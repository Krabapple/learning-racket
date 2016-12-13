#Assignments Post Mortem

##A00

##A01

##A02
1. Remember to define constant. 
    * Readability.
    * When the number changes, only need to update the definition.

2. Purposes should contain parameters' names.
    * For example,
   ~~~~
   ;; Good one:
   ;; (doubled-penalty undertricks vulnerable) produces the penalty points given the number
   ;; of undertricks and knowing if the contract is vulnerable, assuming it has been doubled.

   ;; Bad one:
   ;; (doubled-penalty undertricks vulnerable) produces the penalty points if the bid is down
   ~~~~    

3. Be precise:    
   * If the number is a positive integer, use `Nat` instead of `Num`.    
   * If the function produces a number or a false, use `(anyof Num false)` instead of  `(anyof Num Bool)`.    

4. `[else (cond` should never be inside your code. Just delete it and it will be fine.
5. Use helper functions - several small functions are much clearer than a long function.


##A03
1. When you see duplicated pieces in your code, consider using helper functions to generalize them.
2. Function A is a wrapper for function B, so we only need tests for function A. We don't need tests for function B.
3. When do testing, define some constants that can be reused:    
   `(define setcard-3pss (make-setcard 3 'purple 'squiggle 'striped))`
   Then later on you can use setcard-3pss rather than the long line (make-setcard ...) to test your code.

##A04
##A05
##A06
##A07

##A08
1. Be precise about the type in the contract.    
   * If op can only be '+ or '\*, then the type of op is `(anyof '+ '*)` but not a simple `Sym`.

##A09

