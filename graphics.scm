(define (draw-string str)
  (js-call (js-eval "drawString") str))
