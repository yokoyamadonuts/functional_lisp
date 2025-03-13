; カリー化
(defun curry (fn)
  (lambda (x)
    (lambda (y)
      (funcall fn x y))))

(defun add (x y)
  (+ x y))

(setq curried-add (curry #'add))

(funcall (funcall curried-add 3) 4)  ;; => 7

; N引数の関数のカリー化
(defun curry-n (fn args-count)
  (labels ((inner (args)
             (if (= (length args) args-count)
                 (apply fn args)
                 (lambda (x)
                   (inner (append args (list x)))))))
    (inner '())))

(defun multiply (a b c)
  (* a b c))

(setq curried-multiply (curry-n #'multiply 3))

(funcall (funcall (funcall curried-multiply 2) 3) 4)  ;; => 24

