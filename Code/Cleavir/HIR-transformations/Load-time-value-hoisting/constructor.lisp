(cl:in-package #:cleavir-load-time-value-hoisting)

;;; A constructor is an object that describes how a load-time-value form or
;;; a literal object can be evaluated or reconstructed at load time.

(defclass constructor ()
  (;; There must not be circular references within creation forms.  We use
   ;; this boolean to detect such circularities.  Its value is NIL
   ;; initially and set to T once the creation thunk has been scanned.
   (%creation-form-finalized-p :initform nil :accessor creation-form-finalized-p)
   (%creation-form :initarg :creation-form :reader creation-form)
   (%creation-thunk :initarg :creation-thunk :reader creation-thunk)
   (%initialization-form :initarg :initialization-form :reader initialization-form)
   (%initialization-thunk :initarg :initialization-thunk :reader initialization-thunk)
   ;; This slot is used during hoisting to track the lexical location of
   ;; the constructor and to ensure that it is only hoisted once.
   (%lexical-location :initform nil :accessor lexical-location))
  (:default-initargs :creation-form nil
                     :initialization-form nil
                     :creation-thunk nil
                     :initialization-thunk nil))

(defun make-constructor (creation-form initialization-form system)
  (make-instance 'constructor
    :creation-form creation-form
    :creation-thunk (hir-from-form creation-form system)
    :initialization-form initialization-form
    :initialization-thunk
    (unless (not initialization-form)
      (hir-from-form initialization-form system))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Similarity
;;;
;;; Each of these tables maps from some key to the corresponding
;;; constructor.  The EQL table is used to ensure that each object is only
;;; scanned once.  This works because if two objects are EQL, they are also
;;; similar in the sense of CLHS 3.2.4.2.2.  The EQUALP table is used to
;;; coalesce literal objects where the rules of similarity are less
;;; restrictive.

(defvar *eql-table*)

(defvar *equal-table*)

(defvar *equalp-table*)

(defmacro with-constructor-tables (&body body)
  `(let ((*eql-table* (make-hash-table :test #'eql))
         (*equal-table* (make-hash-table :test #'equal))
         (*equalp-table* (make-hash-table :test #'equalp)))
     ,@body))

(defmacro constructor (key)
  `(gethash ,key *eql-table*))

;;; The next two functions ensure that after any two calls
;;; (coalesce-using-TEST o1 k1) and (coalesce-using-TEST o2 k2), the
;;; relation (TEST k1 k2) implies (eq (constructor o1) (constructor o2)).
(defun coalesce-using-equal (object equal-key)
  (coalesce object equal-key *equal-table*))

(defun coalesce-using-equalp (object equalp-key)
  (coalesce object equalp-key *equalp-table*))

(defun coalesce (object key table)
  (let ((similar-constructor (gethash key table)))
    (if similar-constructor
        (setf (constructor object)
              similar-constructor)
        (setf (gethash key table)
              (constructor object)))))

;;; We provide two helper functions for usage within SIMILARITY-KEYS.
;;; These can be used to obtain an appropriate key for objects that appear
;;; in the definition of OBJECT.

(defun equal-representation (object)
  (multiple-value-bind (value present-p)
      (constructor object)
      (if present-p
          value
          object)))

(defun equalp-representation (object)
  (multiple-value-bind (value present-p)
      (constructor object)
    (if present-p
        value
        (if (characterp object)
            ;; For characters, we have to inhibit the behavior of EQUALP to
            ;; compare them with CHAR-EQUAL.
            (cons (load-time-value (make-instance 'standard-object))
                  (sxhash object))
            ;; Otherwise, we just use OBJECT itself as the key.
            object))))
