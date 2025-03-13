(defun find (fun key list)
    (if (null list)
        nil
        (append
            (if (funcall fun key (car list))
                (list (car list)))
            (find fun key (cdr list))
        )
    )
)