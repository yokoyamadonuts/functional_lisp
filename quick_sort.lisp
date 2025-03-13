(defun qsort (fun list)
    (if (null list)
        list
        (qsort2 fun (car list) (cdr list) nil nil)
    )
)

(defun qsort2 (fun p list left right)
    (if (null list)
        (append (qsort fun left) (cons p (qsort fun right))) ; leftとrightをqsortで並べ替え
        ; ピボットpよりも小さなものをleftに、そうでないきなものをrightに振り分ける
        (funcall fun ((car list) p)
            (qsort2 fun p (cdr list) (cons (car list) left) right)
            (qsort2 fun p (cdr list) left (cons (car list) right))
        )
    )
)