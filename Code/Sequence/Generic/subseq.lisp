(cl:in-package #:sicl-sequence)

(defmethod subseq ((list list) start &optional end)
  (sicl-utilities:with-collectors ((result collect))
    (let ((read (make-sequence-reader
                 list start end nil
                 (lambda (sequence n)
                   (declare (ignore sequence n))
                   (return-from subseq (result))))))
      (loop (collect (funcall read))))))

(replicate-for-each-relevant-vectoroid #1=#:vectoroid
  (defmethod subseq ((vector #1#) start &optional end)
    (multiple-value-bind (start end)
        (canonicalize-start-and-end vector (length vector) start end)
      (replace
       (make-sequence-like vector (- end start))
       vector :start2 start :end2 end))))

(defsetf subseq (sequence start &optional end) (value)
  `(progn (replace ,sequence ,value :start1 ,start :end1 ,end) ,value))

