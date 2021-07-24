(load "vector.scm")
(load "rectangle.scm")
(load "graphics.scm")
(load "picture.scm")
(load "operation.scm")
(load "escher.scm")

;; Based on Functional Geometry by Peter Henderson
;; http://pmh-systems.co.uk/phAcademic/papers/funcgeo.pdf

(define f
  (list
   (make-segment (make-vect 0 1) (make-vect 1 1))
   (make-segment (make-vect 1 1) (make-vect 1 0))
   (make-segment (make-vect 1 0) (make-vect 0 0))
   (make-segment (make-vect 0 0) (make-vect 0 1))))

(define E (make-picture '()))
(define F (make-picture f))
(define P (make-picture p))
(define Q (make-picture q))
(define R (make-picture r))
(define S (make-picture s))

(define T  (quartet P Q R S))
(define U  (cycle (rotate Q)))
(define S1 (quartet E E (rotate T) T))
(define S2 (quartet S1 S1 (rotate T) T))
(define C1 (quartet E E E U))
(define C2 (quartet C1 S1 (rotate S1) U))
(define C3 (quartet C2 S2 (rotate S2) U))
(define PC (quartet C2 S2 (rotate S2) (rotate T)))
(define PL (cycle PC))
(define C  (nonet C2 S2 S2
            (rotate S2) U (rotate T)
            (rotate S2) (rotate T) (rotate Q)))
(define SL (cycle C))

(define (rect-size size)
  (cond ((eq? size 'sm) 250)
        ((eq? size 'md) 500)
        ((eq? size 'lg) 1000)
        (else 500)))

(define (draw pict name size)
  (define rectangle
    (make-rect
     (make-vect 0 0)
     (make-vect (rect-size size) 0)
     (make-vect 0 (rect-size size))))
  (make-viewport name
                 (rect-size size)
                 (rect-size size))
  ((overlay pict F) rectangle))

(draw P  "P" 'sm)
(draw Q  "Q" 'sm)
(draw R  "R" 'sm)
(draw S  "S" 'sm)
(draw T  "T = (quartet P Q R S)" 'md)
(draw U  "U = (cycle (rotate Q))" 'md)
(draw S1 "side1" 'md)
(draw S2 "side2" 'md)
(draw C1 "corner1" 'md)
(draw C2 "corner2" 'md)
(draw C3 "corner3" 'md)
(draw PC "pseudocorner" 'md)
(draw C  "corner" 'md)
(draw PL "pseudolimit" 'lg)
(draw SL "square limit" 'lg)
