; 乱数の状態を引数と値に繰り込んだプログラム
(defun rand (number random-state)
    (let ((random-state (make-random-state random-state)))
        (list (random number random-state) random-state) ))

; (setf rand-values (rand 10 (make-random-state *random-state*)))
; => (3 . #<RANDOM-STATE #*1011...0101>)