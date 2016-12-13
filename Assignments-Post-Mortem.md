#Assignments Post Mortem

##A00

##A01
1. Test the boundaries!    
   For example, if we have three intervals (-∞,1] (1,2] (2,∞), then we should test three points from each interval and test the point of 1 and 2.

##A02
0. **Template should alway contains a contract.**
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
4. Try really hard to think smart.    
   Don't try every possibilities. Think in a more general level.
   ~~~~
   (define (diff-feature setcard1 setcard2)  
    (cond  
    [(or (and (symbol=? setcard1 'red) (symbol=? setcard2 'green))  
         (and (symbol=? setcard1 'green) (symbol=? setcard2 'red)))  
     'purple]  
    [(or (and (symbol=? setcard1 'red) (symbol=? setcard2 'purple))  
         (and (symbol=? setcard1 'purple) (symbol=? setcard2 'red)))  
     'green]  
    [(or (and (symbol=? setcard1 'purple) (symbol=? setcard2 'green))  
         (and (symbol=? setcard1 'green) (symbol=? setcard2 'purple)))  
     'red]  
    [(or (and (symbol=? setcard1 'oval) (symbol=? setcard2 'squiggle))  
         (and (symbol=? setcard1 'squiggle) (symbol=? setcard2 'oval)))  
     'diamond]  
    [(or (and (symbol=? setcard1 'oval) (symbol=? setcard2 'diamond))  
         (and (symbol=? setcard1 'diamond) (symbol=? setcard2 'oval)))  
     'squiggle]  
    [(or (and (symbol=? setcard1 'diamond) (symbol=? setcard2 'squiggle))  
         (and (symbol=? setcard1 'squiggle) (symbol=? setcard2 'diamond)))  
     'oval]  
    [(or (and (symbol=? setcard1 'open) (symbol=? setcard2 'solid))  
         (and (symbol=? setcard1 'solid) (symbol=? setcard2 'open)))  
     'striped]  
    [(or (and (symbol=? setcard1 'open) (symbol=? setcard2 'striped))  
         (and (symbol=? setcard1 'striped) (symbol=? setcard2 'open)))  
     'solid]  
    [(or (and (symbol=? setcard1 'striped) (symbol=? setcard2 'solid))  
         (and (symbol=? setcard1 'solid) (symbol=? setcard2 'striped)))  
     'open]))  
     
     ;; should have been
     
     (define (diff-feature have1 have2 want1 want2 want3)
      (cond [(and (or (equal? have1 want1) (equal? have2 want1)
                  (or (equal? have1 want2) (equal? have2 want2)) want3]
            [(and (or (equal? have1 want1) (equal? have2 want1)
                  (or (equal? have1 want3) (equal? have2 want3)) want2]
            [else want1]))
     ~~~~
5. Data types like **MedalCount** must be capatalized in contracts, but the structure definition should be lower case like `(define-struct medalcount ...)`.


##A04/05
1. For list functions, you need one example for the base case and one for the recursive case.


##A06
##A07

##A08
1. Be precise about the type in the contract.    
   * If op can only be '+ or '\*, then the type of op is `(anyof '+ '*)` but not a simple `Sym`.

##A09

