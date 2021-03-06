(cl:in-package #:sicl-sequence)

(defmethod length ((list list))
  (labels ((len (rest counter)
             (if (atom rest)
                 (if (null rest)
                     counter
                     (error 'must-be-proper-list
                            :datum list))
                 (len (cdr rest) (1+ counter)))))
    (len list 0)))

(replicate-for-each-relevant-vectoroid #1=#:vector
  (defmethod length ((vector #1#))
    (cl:length vector)))

(seal-domain #'length '(sequence))
