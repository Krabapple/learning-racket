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

##A03
##A04
##A05
##A06
##A07

##A08
1. Be precise about the type in the contract.<br>
If op can only be '+ or '\*, then the type of op is (anrof '+ '\*) but not a simple Sym.

##A09

