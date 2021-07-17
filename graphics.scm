(define viewport 'viewport)

(define (open-viewport name w h)
  (set! viewport (js-call (js-eval "openViewport") name w h))
  viewport)

(define (draw-line vp x0 y0 x1 y1)
  (js-call (js-eval "drawLine") vp x0 y0 x1 y1))

(define (draw-string vp text x y)
  (js-call (js-eval "drawString") vp text x y))
