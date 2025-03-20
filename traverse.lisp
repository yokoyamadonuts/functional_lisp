 (defun traverse (tree fun)
    (if (null tree)
        nil
        (if (atom (car tree))
            (cons (funcall fun (car tree)) (traverse (cdr tree) fun))
            (cons (traverse (car tree) fun) (traverse (cdr tree) fun)) )))

(defun flat-traverse (tree fun)
    (reverse (flat-traverse2 tree fun nil)))

(defun flat-traverse2 (tree fun result)
    (if (null tree)
        result
        (if (atom (car tree))
            (flat-traverse2 (cdr tree) fun (cons (funcall fun (car tree)) result))
            (flat-traverse2 (cdr tree) fun (flat-traverse2 (car tree) fun result)) )))