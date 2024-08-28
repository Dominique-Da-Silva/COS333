; Dominique Da Silva
; u21629944

#lang sicp

; --------------------------------------------------------------------------------------
(newline)
;TASK 1
(define (circleArea radius)
  (if (> radius 0)
      ( let ((pi (/ 22.0 7)))                                                          ;this was the code to bind the name pi to the value of 22/7
         (* pi (* radius radius))                                                      ;calculating the area of the circle
       )                                                                               ; this is the then statement
      0                                                                                ;this is the else statement
   )                                                                                   ;end of if statement
)                                                                                      ;end of function

(display "Area of circle: ")
(display (circleArea 3.2))                                                             ; Should output approximately 32.182857142857145 as per the practical spec
(newline)


(display "Example 2 TASK 1: ")
(display (circleArea 0))
(newline)

(display "Example 3 TASK 1: ")
(display (circleArea -5))
(newline)


; --------------------------------------------------------------------------------------
(newline)
;TASK 2
(define (countDivisors value divisors)                                                                   ;the function name:countDivisors and then the parameters value and the list divisors
  
  (define (helper value divisors counter)                                                                  ;build a secondary function to be able to help count the number of divisors for the number from the list
                                                                                                         ;use conditional statement, since we have to check whether the list is empty, the remainder is 0, or the remainder is not 0
    (cond
          ((null? divisors) counter)                                                                       ;condition 1: should the list of divisors be empty, return the calculated count
          ((= (car divisors) 0) (helper value (cdr divisors) counter))                                     ;condition 2:  car (takes the first element of the list), should it be 0, then we skip
          ((= (remainder value (car divisors)) 0) (helper value (cdr divisors) (+ counter 1)))             ;condition 3: increment and call again to traverse the list, cdr (removes the first element and gives new list)
          (else (helper value (cdr divisors) counter))                                                     ;else statement
     )                                                                                                   ;end of conditional statement

   )                                                                                                     ;end of helper function

  (helper value divisors 0)                                                                              ; start the intial call to be able to traverse the list and count the number of divisors

 )                                                                                                       ;end of count function


(display "Example 1 TASK 2: ")
(display (countDivisors 10 '() ))
(newline)

(display "Example 2 TASK 2: ")
(display (countDivisors 10 '(20 50 60) ))
(newline)

(display "Example 3 TASK 2: ")
(display (countDivisors 10 '(1 20 30 2 5 40 10 60) ))
(newline)




; --------------------------------------------------------------------------------------
(newline)
;TASK 3
(define (getEveryEvenElement valuesList)
                                                                                                          ;first we would need to traverse the list
  (define (getResult elements)
    (if (null? elements)
        '()                                                                                               ;if the list is empty then there are no elements to build a new list with
        (cons (car elements) (getResult (cdr elements) ) )
     )
   )
                                                                                                          ;then we would need to find and "copy" the element on a given even position
  (define (getEvenElement valuesList index)
    (if (null? valuesList)
        '()
        (if (= (remainder index 2) 0 )                                                                    ;checks whether the current index is even if the remainder of /2 is 0
            (cons (car valuesList) (getEvenElement (cdr valuesList) (+ index 1) ))                        ; cons (construct a new list) first element of the valuesList and recursive call (remove uneven element "move one space to the right theoretically")
            (getEvenElement (cdr valuesList) (+ index 1) )
         )
     )
   )

  (define (trav valuesList)
    (if (null? valuesList)
        '()                                                                                               ;if the list is empty then return an empty list: example 1 output
        (getResult(getEvenElement valuesList 1))                                                          ;else start looking to make output list by searching for even indexed elements, starting at the first element
    )
   )
                                                                                                          ;and then we would need a function to build a new list to print out once we have been done traversing
  (trav valuesList)                                                                                       ;initial call to kickstart recursive calls
  
 )



(display "Example 1 TASK 3: ")
(display (getEveryEvenElement '() ))
(newline)

(display "Example 2 TASK 3: ")
(display (getEveryEvenElement '(a) ))
(newline)

(display "Example 3 TASK 3: ")
(display (getEveryEvenElement '(a b c d) ))
(newline)

(display "Example 3 TASK 3: ")
(display (getEveryEvenElement '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20) ))
(newline)


; --------------------------------------------------------------------------------------
(newline)