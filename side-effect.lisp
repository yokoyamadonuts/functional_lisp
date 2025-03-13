; 副作用あり
(defclass stack () ((list :initform ())))
(defmethod opush ((s stack) (e T))
    (setf (slot-value s 'list) (cons e (slot-value s 'list))) s)
(defmethod opop ((s stack))
    (let ((top (car (slot-value s 'list))))
        (setf (slot-value s 'list) (cdr (slot-value s 'list)))
        top ))

; 副作用なし
(defclass stack () ())
(defmethod opush ((s stack) (e T) (l list))
    (cons e l))
(defmethod opop ((s stack) (l list))
    (car l))
(defmethod otop ((s stack) (l list))
    (car l))