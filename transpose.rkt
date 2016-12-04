(define (transpose matrix)
  (cond [(empty? (first matrix)) empty]
        [else (cons (map first matrix)
                    (transpose (map rest matrix)))]))
