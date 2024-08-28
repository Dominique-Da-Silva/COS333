#lang sicp


(define (stripNegativesDuplicateEvens theList)

  (define (helper theList output)
    (cond ( (null? theList) output)                                                                                                                   ;checks whether the list is empty
          ((and (positive? (car theList)) (even? (car theList)) ) (helper (cdr theList) (cons (car theList) (cons (car theList) output) ) ) )        ;checks whether the value is both positive and even
          ((positive? (car theList)) (helper (cdr theList) (cons (car theList) output) )) ; if it is positive we just add it to the building process but do not duplicate
          (else (helper (cdr theList) output )) ; if the value is negative we just repeat the building process but leave out that value
      )
   )

  
  (define (reverseList theList)
    (define (reverseHelp theList output2)
      (if (null? theList)
          output2
          (reverseHelp (cdr theList) (cons (car theList) output2))
      )
     )
    
    (reverseHelp theList '())
   )

  (reverseList(helper theList '()) )
  
 )

(display (stripNegativesDuplicateEvens '()))
(newline)

(display (stripNegativesDuplicateEvens '(-6 -1)))
(newline)

(display (stripNegativesDuplicateEvens '(6 8)))
(newline)

(display (stripNegativesDuplicateEvens '(4 -1 9)))
(newline)