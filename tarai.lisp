(defun tarai (x y z)
    (if (<= x y)
        y
        (if (<= y z)
            z
            (tarai (tarai (- x 1) y z) (tarai (- y 1) z x) (tarai (- z 1) x y))
        )
    )
)

; [a] ベース項の評価になったときはzの評価を遅延させる
; (defun dtarai (x y z)
;     (let ((x (if (numberp x) x (funcall x)))
;           (y (if (numberp y) y (funcall y))) )
;       (if (<= x y)
;         y
;         (let ((z (if (numberp z) z (funcall z))))
;             (dtarai (dtarai (- x 1) y z) (dtarai (- y 1) z x) (dtarai (- z 1) x y))))) )

; [b] zの評価が必要ないので、評価しない
(defun dtarai (x y z)
    (let ((x (if (numberp x) x (funcall x)))
          (y (if (numberp y) y (funcall y))) )
      (if (<= x y)
        y
        (dtarai (dtarai (- x 1) y z) (dtarai (- y 1) z x) (dtarai (- z 1) x y)) )))