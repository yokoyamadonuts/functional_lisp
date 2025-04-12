; [a]
(defun rand3 (number random-state)
    (let ((r1-values (rand number random-state)))
        (let ((r2-values (rand number (cadr r1-values))))
            (let ((r3-values (rand number (cadr r2-values))))
                (list (car r1-values) (car r2-values) (car r3-values) (cdr r3-values)) ))))

(setf hits
    `((0 0 0 2) (1 1 1 2) (2 2 2 2) (3 3 3 2) (4 4 4 2) (5 5 5 2) (6 6 6 2) (7 7 7 10) (8 8 8 2) (9 9 9 2)) )

(defun check (x y z hits)
    (if (null hits)
        0
        (if (match x y z (car hits))
            (cadddr (car hits)) )))

(defun match (x y z hit)
    (and (= x (car hit)) (= y (cadr hit)) (= z (caddr hit)) ))

; [b]
; (setf hits (lambda (x y z) (if (= x y z 7) 10 ( if (= x y z) 2 0 ))))

; (defun check (x y z hits) (funcall hits x y z))

(defun slot (bet ramdom-state hits)
    (let ((rand3 (rand3 10 random-state)))
        (let ((ratio (check (car rand3) (cadr rand3) (caddr rand3) hits)))
            (cons (* bet ratio) rand3) )))

; (setf slot (slot 10 *random-state hits))
; => (0 5 9 6 #S(RANDOM-STATE #*1011...0101))