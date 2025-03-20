(defun enq(e queue)
    (if (null (car queue))
        (cons (cons e (car queue)) (cdr queue))
        (cons (car queue) (cons e (cdr queue))) ))

(defun deq (queue)
    (if (null (cdr (car queue)))
        (cons (reverse (cdr queue) nil)) ;フロントリストが空になると、バックリストを反転してフロントリストにする。
        (cons (cdr (car queue)) (cdr queue)) ))

(defun head (queue)
    (car (car queue)) )

; (setq q '(()))          ;; 空のキュー
; (setq q (enq 1 q))      ;; キューに 1 を追加 → ((1))
; (setq q (enq 2 q))      ;; キューに 2 を追加 → ((1) 2)
; (setq q (enq 3 q))      ;; キューに 3 を追加 → ((1) 3 2)

; (setq q (deq q))        ;; → ((3 2)) (1 を削除)
; (setq q (deq q))        ;; → ((2)) (3 を削除)
; (setq q (deq q))        ;; → (()) (2 を削除し空に)