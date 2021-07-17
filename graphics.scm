(define (open-viewport name w h)
  (js-call (js-eval "openViewport") name w h))

(define (draw-line viewport x0 y0 x1 y1)
  (js-call (js-eval "drawLine") viewport x0 y0 x1 y1))

(define (draw-string viewport text x y)
  (js-call (js-eval "drawString") viewport text x y))
