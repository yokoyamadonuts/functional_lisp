;; bank - (残高 口座番号 氏名)
(defun deposit (money bank)
    (cons (+ money (car bank)) (cdr bank)) )

(defun withdraw (money bank)
    (if (<= money (car bank))
        (cons money (cons (- (car bank) money) (cdr bank)))
        (cons 0 bank) ))

;; (setf bank '(100 12345 "Taro"))
;; (serf bank (deposit 100 bank))
;; => (200 12345 "Taro")
;; (serf bank (withdraw 50 bank))
;; => (50 (150 12345 "Taro"))
