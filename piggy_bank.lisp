(defun deposit (money piggy-bank)
    (+ money piggy-bank) )

(defun withdraw (money piggy-bank)
    (if (<= money piggy-bank)
        (cons money (- piggy-bank money))
        (cons 0 piggy-bank) ))

;; (setf pbank (deposit 100 0))
;; => 100
;; (setf pbank-value (withdraw 50 pbank))
;; => (50 . 50)
