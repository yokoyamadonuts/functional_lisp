(defmacro delay-cons (x y)
    `(cons ,x (lambda () ,y)) )

(defun delay-car (x)
    (car x))

(defun delay-cdr (x)
    (let ((ret (funcall (cdr x))))
        (setf (cdr x) ret) ))

(defun inifinite-n (n)
    (delay-cons n (infinite-n (+ n 1))) )

(defmacro infinite-n (n)
    `(delay-cons ,n (infinite-n ,(+ n 1))) )

; (setf list0 (infinite-n 1))
; (1 .#<FUNCTION :LAMBDA NIL (INFINITE-N (+ N 1))>)