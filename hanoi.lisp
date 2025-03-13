(defun hanoi (n &optional (from 'from) (to 'to) (other 'other))
    (if (= n 1)
        (cons (cons from to) nil)
        (append
            (hanoi (- n 1) from other to) ;; fromからotherへn-1個移動
            (hanoi 1 from to other) ;; 円盤1個をfromからtoへ移動
            (hanoi (- n 1) other to from) ;; otherからtoへn-1個移動
        )
    )
)

(defun hanoi4 (n from to other1 other2)
    (if (< n 3)
        (hanoi n from to other1)
        (if (= n 3)
            ; 3枚の時は最初の１枚をother1に移動し、後は円盤2枚の3本ハノイと同じ
            ; にして、最後に最初の1枚をother1からtoに移動する
            (append
                (list (cons from other1))
                (hannoi 2 from to other2)
                (list (cons other1 to))
            )
            ; 4枚以上ある時
            (append
                (hanoi4 (- n 3) from other1 other2 to)
                (hanoi 3 from to other2)
                (hanoi4 (- n 3) other1 to other2 from)
            )
        )
    )
)