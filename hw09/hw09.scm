(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car (cdr (cdr s)))
)

(define (sign x)
  (cond 
    ((< x 0) -1)
    ((> x 0) 1)
    ((= 0 0) 0)
  )
)

(define (square x) (* x x))

(define (pow b n)

  (cond
    ((equal? n 0) 1)
    ((equal? n 1) b)
    ((even? n) (pow (square b) (/ n 2)))
    ((odd? n) (* b (pow (square b) (/ (- n 1) 2))))
  )

)

(define (ordered? s)
  (cond
    ((null? (cdr s)) #t) 
    ((> (car s) (car (cdr s))) #f ) 
    (else (ordered? (cdr s)))
  )
)


(define (dots? s) 
  (and (pair? s) (not (or (pair? (cdr s)) (null? (cdr s)))))
)

(define (nodots s)
  (cond 
    ((null? s) s)
    ((dots? s) (list (nodots (car s)) (cdr s)))
    ((pair? s) (cons (nodots (car s)) (nodots (cdr s))))
    (else s)
  )
)


; Sets as sorted lists

(define (empty? s) (null? s))

(define (contains? s v)
  (cond 
    ((empty? s) false)
    ((> (car s) v) false)
    ((eq? (car s) v) true)
    (else 
        (if (not (null? (cdr s))) (contains? (cdr s) v) false)
    )
  )
)

; Equivalent Python code, for your reference:
;
; def empty(s):
;     return s is Link.empty
;
; def contains(s, v):
;     if empty(s):
;         return False
;     elif s.first > v:
;         return False
;     elif s.first == v:
;         return True
;     else:
;         return contains(s.rest, v)


(define (add s v)
  (cond 
    ((empty? s) (list v))
    ((contains? s v) s)
    (else 
      (cond 
        ((> (car s) v) (cons v s))
        ((< (car s) v) (cons (car s) (add (cdr s) v)))
      )
    )
  )
)



(define (intersect s t)
  (cond ((or (empty? s) (empty? t)) nil)
    (else 
      (cond
        ((eq? (car s) (car t)) (cons (car s) (intersect (cdr s) (cdr t))))
        ((< (car s) (car t)) (intersect (cdr s) t))
        ((> (car s) (car t)) (intersect s (cdr t)))
      )
    )
  )
)

; Equivalent Python code, for your reference:
;
; def intersect(set1, set2):
;     if empty(set1) or empty(set2):
;         return Link.empty
;     else:
;         e1, e2 = set1.first, set2.first
;         if e1 == e2:
;             return Link(e1, intersect(set1.rest, set2.rest))
;         elif e1 < e2:
;             return intersect(set1.rest, set2)
;         elif e2 < e1:
;             return intersect(set1, set2.rest)

(define (union s t)
    (cond ((or (empty? t) (empty? s)) 
            (if (empty? s) t s))
        (else 
            (cond 
                ((< (car s) (car t)) (cons (car s) (union (cdr s) t)))
                ((> (car s) (car t)) (cons (car t) (union s (cdr t))))
                ((eq? (car s) (car t)) (cons (car s) (union (cdr s) (cdr t))))
            
            )
        )
    )
)

        
          

; Q9 - Survey
(define (survey)
    ; Midsemester Survey: https://goo.gl/forms/a3NTVfZWFjWReu0x1
    'procedure
)