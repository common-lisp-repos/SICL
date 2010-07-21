(in-package #:sicl-cons-high-test)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the caar function 

(define-test caar.1
  (assert-equal 'a (caar '((a)))))

(define-test caar.error.1
  (assert-error 'type-error (caar 'a)))

(define-test caar.error.2
  (assert-error 'type-error (caar '(a))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the cadr function

(define-test cdar.1
  (assert-equal 'b (cdar '((a . b)))))

(define-test cdar.error.1
  (assert-error 'type-error (cdar 'a)))

(define-test cdar.error.2
  (assert-error 'type-error (cdar '(a . b))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the cadr function

(define-test cadr.1
  (assert-equal 'b (cadr '(a b))))

(define-test cadr.error.1
  (assert-error 'type-error (cadr 'a)))

(define-test cadr.error.2
  (assert-error 'type-error (cadr '(a . b))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the cddr function

(define-test cddr.1
  (assert-equal 'c (cddr '(a b . c))))

(define-test cddr.error.1
  (assert-error 'type-error (cddr 'a)))

(define-test cddr.error.2
  (assert-error 'type-error (cddr '(a . b))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the caaar function

(define-test caaar.1
  (assert-equal 'a (caaar '(((a))))))

(define-test caaar.error.1
  (assert-error 'type-error (caaar 'a)))

(define-test caaar.error.2
  (assert-error 'type-error (caaar '(a))))

(define-test caaar.error.3
  (assert-error 'type-error (caaar '((a)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the cdaar function

(define-test cdaar.1
  (assert-equal 'b (cdaar '(((a . b))))))

(define-test cdaar.error.1
  (assert-error 'type-error (cdaar 'a)))

(define-test cdaar.error.2
  (assert-error 'type-error (cdaar '(a))))

(define-test cdaar.error.3
  (assert-error 'type-error (cdaar '((a . b)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the cadar function

(define-test cadar.1
  (assert-equal 'b (cadar (cons (cons 'a (cons 'b 'c)) 'd))))

(define-test cadar.error.1
  (assert-error 'type-error (cadar 'a)))

(define-test cadar.error.2
  (assert-error 'type-error (cadar '(a . b))))

(define-test cadar.error.3
  (assert-error 'type-error (cadar '((a . c) . b))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the cddar function

(define-test cddar.1
  (assert-equal 'c (cddar (cons (cons 'a (cons 'b 'c)) 'd))))

(define-test cddar.error.1
  (assert-error 'type-error (cddar 'a)))

(define-test cddar.error.2
  (assert-error 'type-error (cddar '(a . b))))

(define-test cddar.error.3
  (assert-error 'type-error (cddar '((a . b) . b))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the caadr function

(define-test caadr.1
  (assert-equal 'b (caadr (cons 'a (cons (cons 'b 'c) 'd)))))

(define-test caadr.error.1
  (assert-error 'type-error (caadr 'a)))

(define-test caadr.error.2
  (assert-error 'type-error (caadr '(a . b))))

(define-test caadr.error.3
  (assert-error 'type-error (caadr '(a . (b)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the caddr function

(define-test caddr.1
  (assert-equal 'c (caddr (cons 'a (cons 'b (cons 'c 'd))))))

(define-test caddr.error.1
  (assert-error 'type-error (caddr 'a)))

(define-test caddr.error.2
  (assert-error 'type-error (caddr '(a . b))))

(define-test caddr.error.3
  (assert-error 'type-error (caddr '(a c . b))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the cdadr function

(define-test cdadr.1
  (assert-equal 'c (cdadr (cons 'a (cons (cons 'b 'c) 'd)))))

(define-test cdadr.error.1
  (assert-error 'type-error (cdadr 'a)))

(define-test cdadr.error.2
  (assert-error 'type-error (cdadr '(a . b))))

(define-test cdadr.error.3
  (assert-error 'type-error (cdadr '(a b . c))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the cdddr function

(define-test cdddr.1
  (assert-equal 'd (cdddr (cons 'a (cons 'b (cons 'c 'd))))))

(define-test cdddr.error.1
  (assert-error 'type-error (cdddr 'a)))

(define-test cdddr.error.2
  (assert-error 'type-error (cdddr '(a . b))))

(define-test cdddr.error.3
  (assert-error 'type-error (cdddr '(a c . b))))

;;; Tree to be used for testing some c*r functions.

(defvar *cons-test-4*
  (cons (cons (cons (cons 'a 'b)
		    (cons 'c 'd))
	      (cons (cons 'e 'f)
		    (cons 'g 'h)))
	(cons (cons (cons 'i 'j)
		    (cons 'k 'l))
	      (cons (cons 'm 'n)
		    (cons 'o 'p)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the caaaar function

(define-test caaaar.1
  (assert-equal 'a (caaaar *cons-test-4*)))

(define-test caaaar.error.1
  (assert-error 'type-error (caaaar 'a)))

(define-test caaaar.error.2
  (assert-error 'type-error (caaaar '(a))))

(define-test caaaar.error.3
  (assert-error 'type-error (caaaar '((a)))))

(define-test caaaar.error.4
  (assert-error 'type-error (caaaar '(((a))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the caaadr function

(define-test caaadr.1
  (assert-equal 'i (caaadr *cons-test-4*)))

(define-test caaadr.error.1
  (assert-error 'type-error (caaadr 'a)))

(define-test caaadr.error.2
  (assert-error 'type-error (caaadr '(a . b))))

(define-test caaadr.error.3
  (assert-error 'type-error (caaadr '(a . (b)))))

(define-test caaadr.error.4
  (assert-error 'type-error (caaadr '(a . ((b))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the caadar function

(define-test caadar.1
  (assert-equal 'e (caadar *cons-test-4*)))

(define-test caadar.error.1
  (assert-error 'type-error (caadar 'a)))

(define-test caadar.error.2
  (assert-error 'type-error (caadar '(a . b))))

(define-test caadar.error.3
  (assert-error 'type-error (caadar '((a . c) . b))))

(define-test caadar.error.4
  (assert-error 'type-error (caadar '((a . (c)) . b))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the caaddr function

(define-test caaddr.1
  (assert-equal 'm (caaddr *cons-test-4*)))

(define-test caaddr.error.1
  (assert-error 'type-error (caaddr 'a)))

(define-test caaddr.error.2
  (assert-error 'type-error (caaddr '(a . b))))

(define-test caaddr.error.3
  (assert-error 'type-error (caaddr '(a c . b))))

(define-test caaddr.error.4
  (assert-error 'type-error (caaddr '(a c . (b)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the cadaar function

(define-test cadaar.1
  (assert-equal 'c (cadaar *cons-test-4*)))

(define-test cadaar.error.1
  (assert-error 'type-error (cadaar 'a)))

(define-test cadaar.error.2
  (assert-error 'type-error (cadaar '(a))))

(define-test cadaar.error.3
  (assert-error 'type-error (cadaar '((a . b)))))

(define-test cadaar.error.4
  (assert-error 'type-error (cadaar '((a . (b))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the cadadr function

(define-test cadadr.1
  (assert-equal 'k (cadadr *cons-test-4*)))

(define-test cadadr.error.1
  (assert-error 'type-error (cadadr 'a)))

(define-test cadadr.error.2
  (assert-error 'type-error (cadadr '(a . b))))

(define-test cadadr.error.3
  (assert-error 'type-error (cadadr '(a b . c))))

(define-test cadadr.error.4
  (assert-error 'type-error (cadadr '(a (b . e) . c))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the caddar function

(define-test caddar.1
  (assert-equal 'g (caddar *cons-test-4*)))

(define-test caddar.error.1
  (assert-error 'type-error (caddar 'a)))

(define-test caddar.error.2
  (assert-error 'type-error (caddar '(a . b))))

(define-test caddar.error.3
  (assert-error 'type-error (caddar '((a . b) . b))))

(define-test caddar.error.4
  (assert-error 'type-error (caddar '((a  b . c) . b))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the cadddr function

(define-test cadddr.1
  (assert-equal 'o (cadddr *cons-test-4*)))

(define-test cadddr.error.1
  (assert-error 'type-error (cadddr 'a)))

(define-test cadddr.error.2
  (assert-error 'type-error (cadddr '(a . b))))

(define-test cadddr.error.3
  (assert-error 'type-error (cadddr '(a c . b))))

(define-test cadddr.error.4
  (assert-error 'type-error (cadddr '(a c e . b))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the cdaaar function

(define-test cdaaar.1
  (assert-equal 'b (cdaaar *cons-test-4*)))

(define-test cdaaar.error.1
  (assert-error 'type-error (cdaaar 'a)))

(define-test cdaaar.error.2
  (assert-error 'type-error (cdaaar '(a))))

(define-test cdaaar.error.3
  (assert-error 'type-error (cdaaar '((a)))))

(define-test cdaaar.error.4
  (assert-error 'type-error (cdaaar '(((a . b))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the cdaadr function

(define-test cdaadr.1
  (assert-equal 'j (cdaadr *cons-test-4*)))

(define-test cdaadr.error.1
  (assert-error 'type-error (cdaadr 'a)))

(define-test cdaadr.error.2
  (assert-error 'type-error (cdaadr '(a . b))))

(define-test cdaadr.error.3
  (assert-error 'type-error (cdaadr '(a . (b)))))

(define-test cdaadr.error.4
  (assert-error 'type-error (cdaadr '(a . ((b . c))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the cdadar function

(define-test cdadar.1
  (assert-equal 'f (cdadar *cons-test-4*)))

(define-test cdadar.error.1
  (assert-error 'type-error (cdadar 'a)))

(define-test cdadar.error.2
  (assert-error 'type-error (cdadar '(a . b))))

(define-test cdadar.error.3
  (assert-error 'type-error (cdadar '((a . c) . b))))

(define-test cdadar.error.4
  (assert-error 'type-error (cdadar '((a . (c . d)) . b))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the cdaddr function

(define-test cdaddr.1
  (assert-equal 'n (cdaddr *cons-test-4*)))

(define-test cdaddr.error.1
  (assert-error 'type-error (cdaddr 'a)))

(define-test cdaddr.error.2
  (assert-error 'type-error (cdaddr '(a . b))))

(define-test cdaddr.error.3
  (assert-error 'type-error (cdaddr '(a c . b))))

(define-test cdaddr.error.4
  (assert-error 'type-error (cdaddr '(a c b . d))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the cddaar function

(define-test cddaar.1
  (assert-equal 'd (cddaar *cons-test-4*)))

(define-test cddaar.error.1
  (assert-error 'type-error (cddaar 'a)))

(define-test cddaar.error.2
  (assert-error 'type-error (cddaar '(a))))

(define-test cddaar.error.3
  (assert-error 'type-error (cddaar '((a . b)))))

(define-test cddaar.error.4
  (assert-error 'type-error (cddaar '((a . (b))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the cddadr function

(define-test cddadr.1
  (assert-equal 'l (cddadr *cons-test-4*)))

(define-test cddadr.error.1
  (assert-error 'type-error (cddadr 'a)))

(define-test cddadr.error.2
  (assert-error 'type-error (cddadr '(a . b))))

(define-test cddadr.error.3
  (assert-error 'type-error (cddadr '(a b . c))))

(define-test cddadr.error.4
  (assert-error 'type-error (cddadr '(a (b . e) . c))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the cdddar function

(define-test cdddar.1
  (assert-equal 'h (cdddar *cons-test-4*)))

(define-test cdddar.error.1
  (assert-error 'type-error (cdddar 'a)))

(define-test cdddar.error.2
  (assert-error 'type-error (cdddar '(a . b))))

(define-test cdddar.error.3
  (assert-error 'type-error (cdddar '((a . b) . b))))

(define-test cdddar.error.4
  (assert-error 'type-error (cdddar '((a  b . c) . b))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the cddddr function

(define-test cddddr.1
  (assert-equal 'p (cddddr *cons-test-4*)))

(define-test cddddr.error.1
  (assert-error 'type-error (cddddr 'a)))

(define-test cddddr.error.2
  (assert-error 'type-error (cddddr '(a . b))))

(define-test cddddr.error.3
  (assert-error 'type-error (cddddr '(a c . b))))

(define-test cddddr.error.4
  (assert-error 'type-error (cddddr '(a c e . b))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the list function

(define-test list.1
  (assert-equal '() (list)))

(define-test list.2
  (assert-equal '(1) (list 1)))

(define-test list.3
  (assert-equal '(1 2) (list 1 2)))

(define-test list.4
  (assert-equal '(1 2 3) (list 1 2 3)))

(define-test list.5
  (assert-equal '((a) (b) 1 2) (list '(a) '(b) 1 2)))

(define-test list.apply.1a
  (assert-equal '() (apply (cadr (list 1 #'list)) '())))

(define-test list.apply.2a
  (assert-equal '(1) (apply (cadr (list 1 #'list)) (list 1))))

(define-test list.apply.3a
  (assert-equal '(1 2) (apply (cadr (list 1 #'list)) (list 1 2))))

(define-test list.apply.4a
  (assert-equal '(1 2 3) (apply (cadr (list 1 #'list)) (list 1 2 3))))

(define-test list.apply.5a
  (assert-equal '((a) (b) 1 2)
                (apply (cadr (list 1 #'list)) (list '(a) '(b) 1 2))))

(define-test list.apply.1b
  (assert-equal '() (apply (cadr (list 1 'list)) '())))

(define-test list.apply.2b
  (assert-equal '(1) (apply (cadr (list 1 'list)) (list 1))))

(define-test list.apply.3b
  (assert-equal '(1 2) (apply (cadr (list 1 'list)) (list 1 2))))

(define-test list.apply.4b
  (assert-equal '(1 2 3) (apply (cadr (list 1 'list)) (list 1 2 3))))

(define-test list.apply.5b
  (assert-equal '((a) (b) 1 2)
                (apply (cadr (list 1 'list)) (list '(a) '(b) 1 2))))

(define-test list.order.1
  (let ((i 0))
    (assert-equal '(1 2 3) (list (incf i) (incf i) (incf i)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the list* function

(define-test list*.1
  (assert-equal '(1 2 3) (list* 1 '(2 3))))

(define-test list*.2
  (assert-equal '(1 2 3) (list* 1 2 '(3))))

(define-test list*.3
  (assert-equal '(1 2 3) (list* 1 2 3 '())))

(define-test list*.4
  (assert-equal 'a (list* 'a)))

(define-test list*.5
  (assert-equal '(1 2 . 3) (list* 1 2 3)))

(define-test list*.apply.1
  (assert-equal '(1 2 3)
                (apply (cadr (list 1 #'list*)) (list 1 '(2 3)))))

(define-test list*.apply.2
  (assert-equal '(1 2 3)
                (apply (cadr (list 1 #'list*)) (list 1 2 '(3)))))

(define-test list*.apply.3
  (assert-equal '(1 2 3)
                (apply (cadr (list 1 #'list*)) (list 1 2 3 '()))))

(define-test list*.apply.4
  (assert-equal 'a
                (apply (cadr (list 1 #'list*)) (list 'a))))

(define-test list*.apply.5
  (assert-equal '(1 2 . 3)
                (apply (cadr (list 1 #'list*)) (list 1 2 3))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the copy-tree function

(define-test copy-tree.1
  (assert-equal 'x (copy-tree 'x)))

(define-test copy-tree.2
  (assert-equal '(a . b) (copy-tree '(a . b))))

(define-test copy-tree.3
  (let ((tree '(((((a b . c) d (e (f g)) . h))) (i j (k)))))
    (assert-equal tree (copy-tree tree))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the tree-equal function

(define-test tree-equal.1
  (assert-true (tree-equal nil nil)))

(define-test tree-equal.2
  (assert-true (tree-equal 1 1)))

(define-test tree-equal.3
  (assert-true (tree-equal '(1) '(1))))

(define-test tree-equal.4
  (assert-true (tree-equal '(1 . 2) '(1 . 2))))

(define-test tree-equal.5
  (assert-false (tree-equal 1 2)))

(define-test tree-equal.6
  (assert-false (tree-equal '(1) '(2))))

(define-test tree-equal.7
  (assert-true (tree-equal '(1) '(2)
                           :test (lambda (x y)
                                   (or (eql x y)
                                       (and (numberp x)
                                            (numberp y)
                                            (<= (abs (- x y)) 1)))))))

(define-test tree-equal.8
  (assert-false (tree-equal '(1) '(2) :test-not #'eql)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the endp function

(define-test endp.1
  (assert-true (endp '())))

(define-test endp.2
  (assert-false (endp '(1 . 2))))

(define-test endp.3
  (assert-error 'type-error (endp 1)))

(define-test endp.4
  (assert-error 'type-error (endp #\a)))

(define-test endp.5
  (assert-error 'type-error (endp "a")))

(define-test endp.6
  (assert-error 'type-error (endp 'a)))

(define-test endp.7
  (assert-error 'type-error (endp 1.0)))

(define-test endp.8
  (assert-error 'type-error (endp #(a))))

(define-test endp.9
  (assert-error 'type-error (endp *standard-input*)))

(define-test endp.10
  (assert-error 'type-error (endp *package*)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the mapcar function

(define-test mapcar.1
  (assert-equal '() (mapcar #'1+ '())))

(define-test mapcar.2
  (assert-equal '(1) (mapcar #'1+ '(0))))

(define-test mapcar.3
  (assert-equal '(-1 -2 -3) (mapcar #'- '(1 2 3))))

(define-test mapcar.4
  (assert-equal '(2 4 6) (mapcar #'+ '(1 2 3) '(1 2 3))))

(define-test mapcar.5
  (assert-equal '(3 6 9) (mapcar #'+ '(1 2 3) '(1 2 3) '(1 2 3))))

(define-test mapcar.6
  (assert-equal '(2 4) (mapcar #'+ '(1 2 3 4 5) '(1 2))))

(define-test mapcar.7
  (assert-equal '(2 4) (mapcar #'+ '(1 2) '(1 2 3 4 5))))

(define-test mapcar.error.1
  (assert-error 'type-error (mapcar #'1+ 1)))

(define-test mapcar.error.2
  (assert-error 'type-error (mapcar #'1+ #(1 2 3))))

(define-test mapcar.error.3
  (assert-error 'type-error (mapcar #'1+ '(1 2 . 3))))

(define-test mapcar.error.4
  (assert-error 'type-error (mapcar #'1+ "1")))

(define-test mapcar.order.1
  (let ((i 0)
        (funs (vector #'1+ #'1-))
        (lists '((1 2) (3 4) (5 6))))
    (assert-equal '(4 5) (mapcar (aref funs (incf i)) (nth (incf i) lists)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the mapc function

(define-test mapc.1
  (assert-equal '() (mapcar #'1+ '())))

(define-test mapc.2
  (let ((i 0))
    (assert-equal '(1 2 3 6)
                  (append (mapc (lambda (x) (incf i x)) '(1 2 3))
                          (list i)))))

(define-test mapc.3
  (let ((i 0))
    (assert-equal '(1 2 3 12)
                  (append (mapc (lambda (x y) (incf i (+ x y)))
                                '(1 2 3)
                                '(1 2 3))
                          (list i)))))

(define-test mapc.error.1
  (assert-error 'type-error (mapc #'1+ 1)))

(define-test mapc.error.2
  (assert-error 'type-error (mapc #'1+ #(1 2 3))))

(define-test mapc.error.3
  (assert-error 'type-error (mapc #'1+ '(1 2 . 3))))

(define-test mapc.error.4
  (assert-error 'type-error (mapc #'1+ "1")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the maplist function

(define-test maplist.1
  (assert-equal '() (maplist #'car '())))

(define-test maplist.1
  (assert-equal '(1 2 3) (maplist #'car '(1 2 3))))

(define-test maplist.error.1
  (assert-error 'type-error (maplist #'car 1)))

(define-test maplist.error.2
  (assert-error 'type-error (maplist #'car #(1 2 3))))

(define-test maplist.error.3
  (assert-error 'type-error (maplist #'car '(1 2 . 3))))

(define-test maplist.error.4
  (assert-error 'type-error (maplist #'car "1")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the mapl function

(define-test mapl.1
  (assert-equal '() (mapl #'car '())))

(define-test mapl.2
  (assert-equal '(1) (mapl #'car '(1))))

(define-test mapl.3
  (let ((i 0))
    (assert-equal 6
                  (progn (mapl (lambda (sublist) (incf i (car sublist)))
                               '(1 2 3))
                         i))))

(define-test mapl.error.1
  (assert-error 'type-error (mapl #'car 1)))

(define-test mapl.error.2
  (assert-error 'type-error (mapl #'car #(1 2 3))))

(define-test mapl.error.3
  (assert-error 'type-error (mapl #'car '(1 2 . 3))))

(define-test mapl.error.4
  (assert-error 'type-error (mapl #'car "1")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the mapcan function

(define-test mapcan.1
  (assert-equal '(a b c)
		(mapcan #'list '(a b c))))

(define-test mapcan.2
  (assert-equal '(a d b e c f)
		(mapcan #'list '(a b c) '(d e f))))

(define-test mapcan.3
  (assert-equal '(a b c . f)
		(mapcan #'cons '(a b c) '(d e f))))

(define-test mapcan.4
  (let ((a (list 'a))
	(b (list 'b))
	(c (list 'c)))
    (assert-eq c
	       (cddr (mapcan #'identity (list a b c))))))

(define-test mapcan.5
  (assert-equal '()
		(mapcan #'identity '())))

(define-test mapcan.error.1
  (assert-error 'type-error (mapcan #'car 1)))

(define-test mapcan.error.2
  (assert-error 'type-error (mapcan #'car #(1 2 3))))

(define-test mapcan.error.3
  (assert-error 'type-error (mapcan #'car '(1 2 . 3))))

(define-test mapcan.error.4
  (assert-error 'type-error (mapcan #'car "1")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the append function

(define-test append.1
  (assert-equal nil (append)))

(define-test append.2
  (assert-equal 'x (append 'x)))

(define-test append.4
  (assert-equal
   '(a b c d e f g . h)
   (append (list 'a) (list 'b) (list 'c)
           (list 'd) (list 'e) (list 'f)
           (list 'g) 'h)))

(define-test append.5
  (assert-equal 'a (append nil nil nil nil nil nil nil nil 'a)))

;;; Test suggested by Peter Graves
(define-test append.7
  (assert-equal
   nil
   (let ((x (list 'a 'b 'c 'd)))
     (eq (append x nil) x))))

;;; Order of evaluation tests

(define-test append.order.1
  (assert-equal
   '((a b c d e f g h i) 3 1 2 3)
   (let ((i 0) x y z)
     (list
       (append (progn (setf x (incf i)) (copy-list '(a b c)))
               (progn (setf y (incf i)) (copy-list '(d e f)))
               (progn (setf z (incf i)) (copy-list '(g h i))))
       i x y z))))

(define-test append.order.2
  (assert-equal '(1 1) (let ((i 0)) (append (list (incf i)) (list i)))))

;;; Error tests

(define-test append.error.1
  (assert-error 'type-error (append '(a . b) '(z))))

(define-test append.error.2
  (assert-error 'type-error (append '(x y z) '(a . b) '(z))))

;;; This test verifies that append preserves the structure of
;;; the last list.

(define-test append.sharing.1
  (let ((list1 '(1 2))
        (list2 '(3 4)))
    (assert-eq (cddr (append list1 list2)) list2)))

(define-test append.apply.1
  (let ((list1 '(1 2))
        (list2 '(3 4)))
    (assert-equal '(1 2 3 4)
                  (apply (cadr (list 'a #'append)) (list list1 list2)))
    (assert-equal '(1 2 3 4)
                  (apply (cadr (list 'a 'append)) (list list1 list2)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the nconc function

(define-test nconc.1
  (assert-eq '() (nconc)))

(define-test nconc.2
  (let ((list (copy-tree '(a b c))))
    (assert-eq list (nconc list))))

(define-test nconc.3
  (let ((list (copy-tree '(a b c))))
    (assert-eq list (nconc '() list))))

(define-test nconc.4
  (let ((list1 (copy-tree '(a b c)))
        (list2 (copy-tree '(d e f))))
    (assert-eq list1 (nconc list1 list2))
    (assert-eq list2 (cdddr list1))))

(define-test nconc.5
  (assert-equal '(a z)
		(nconc (copy-tree '(a . b))
		       (copy-tree '(z)))))

(define-test nconc.6
  (assert-equal '(x y z a z)
		(nconc (copy-tree '(x y z))
		       (copy-tree '(a . b))
		       (copy-tree '(z)))))

(define-test nconc.order.1
  (assert-equal
   '((a b c d e f g h i) 3 1 2 3)
   (let ((i 0) x y z)
     (list
       (nconc (progn (setf x (incf i)) (copy-list '(a b c)))
              (progn (setf y (incf i)) (copy-list '(d e f)))
              (progn (setf z (incf i)) (copy-list '(g h i))))
       i x y z))))

(define-test nconc.apply.1
  (let ((list1 '(1 2))
        (list2 '(3 4)))
    (assert-equal '(1 2 3 4)
                  (apply (cadr (list 'a #'nconc))
                         (copy-tree (list list1 list2))))
    (assert-equal '(1 2 3 4)
                  (apply (cadr (list 'a 'nconc))
                         (copy-tree (list list1 list2))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the revappend function

(define-test revappend.1
  (assert-equal '()
		(revappend '() '())))

(define-test revappend.2
  (assert-equal '(a)
		(revappend '(a) '())))

(define-test revappend.3
  (assert-equal '(b a)
		(revappend '(a b) '())))

(define-test revappend.4
  (assert-equal '(b a c)
		(revappend '(a b) '(c))))

(define-test revappend.5
  (assert-equal '(b a . c)
		(revappend '(a b) 'c)))

(define-test revappend.6
  (assert-equal 'c
		(revappend '() 'c)))

(define-test revappend.7
  (let ((l '(x)))
    (assert-equal l
		  (cdr (revappend '(a) l)))))

(define-test revappend.error.1
  (assert-error 'type-error
		(revappend 'a '())))

(define-test revappend.error.2
  (assert-error 'type-error
		(revappend '(a . b) '())))

(define-test revappend.error.3
  (assert-error 'type-error
		(revappend 1 '())))

(define-test revappend.error.4
  (assert-error 'type-error
		(revappend #(a b) '())))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the nreconc function

(define-test nreconc.1
  (assert-equal '()
		(nreconc '() '())))

(define-test nreconc.2
  (assert-equal '(a)
		(nreconc (copy-list '(a)) '())))

(define-test nreconc.3
  (assert-equal '(b a)
		(nreconc (copy-list '(a b)) '())))

(define-test nreconc.4
  (assert-equal '(b a c)
		(nreconc (copy-list '(a b)) '(c))))

(define-test nreconc.5
  (assert-equal '(b a . c)
		(nreconc (copy-list '(a b)) 'c)))

(define-test nreconc.6
  (assert-equal 'c
		(nreconc '() 'c)))

(define-test nreconc.7
  (let ((l '(x)))
    (assert-equal l
		  (cdr (nreconc (copy-list '(a)) l)))))

(define-test nreconc.error.1
  (assert-error 'type-error
		(nreconc 'a '())))

(define-test nreconc.error.2
  (assert-error 'type-error
		(nreconc (copy-tree '(a . b)) '())))

(define-test nreconc.error.3
  (assert-error 'type-error
		(nreconc 1 '())))

(define-test nreconc.error.4
  (assert-error 'type-error
		(nreconc #(a b) '())))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the null function

(define-test null.1
  (assert-equal t
		(null '())))

(define-test null.2
  (assert-equal nil
		(null 1)))

(define-test null.3
  (assert-equal nil
		(null #\a)))

(define-test null.4
  (assert-equal nil
		(null #())))

(define-test null.5
  (assert-equal nil
		(null "")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the acons function

(define-test acons.1
  (assert-equal '((a . b))
		(acons 'a 'b '())))

(define-test acons.2
  (assert-equal '((a . b) c)
		(acons 'a 'b '(c))))

(define-test acons.3
  (assert-equal '((a . b) . c)
		(acons 'a 'b 'c)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the member function

(define-test member.1
  (assert-equal nil
		(member 234 '())))

(define-test member.2
  (assert-equal '(123 b c)
		(member 123 '(a b 123 b c))))

(define-test member.3
  (assert-equal '((123) b c)
		(member '(123) '(a b (123) b c)
			:test #'equal)))

(define-test member.4
  (assert-equal nil
		(member 123 '(a b c d e))))

(define-test member.error.1
  (assert-error 'type-error
		(member 123 '(a b . 123))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the member-if function

(define-test member-if.1
  (assert-equal nil
		(member-if #'oddp '(2 4 6))))

(define-test member-if.2
  (assert-equal '(3 4)
		(member-if #'oddp '(2 6 3 4))))

(define-test member-if.error.1
  (assert-error 'type-error
		(member-if #'oddp '(2 4 6 . 7))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the member-if-not function

(define-test member-if-not.1
  (assert-equal nil
		(member-if-not #'evenp '(2 4 6))))

(define-test member-if-not.2
  (assert-equal '(3 4)
		(member-if-not #'evenp '(2 6 3 4))))

(define-test member-if-not.error.1
  (assert-error 'type-error
		(member-if-not #'evenp '(2 4 6 . 7))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the assoc function

(define-test assoc.1
  (assert-equal '(a . b)
		(assoc 'a '((b) nil (a . b) (a . c)))))

(define-test assoc.2
  (assert-equal nil
		(assoc 'c '((b) nil (a . b) (a . c)))))

(define-test assoc.3
  (assert-equal '(nil . c)
		(assoc 'nil '((b) nil (a . b) (nil . c)))))

(define-test assoc.4
  (assert-equal '(123 . b)
		(assoc 123 '((b) nil (123 . b) (nil . c)))))

(define-test assoc.5
  (assert-equal '(#\a . b)
		(assoc #\a '((b) nil (#\a . b) (nil . c)))))

(define-test assoc.6
  (assert-equal '((a b) c)
		(assoc '(a b) '((a . b) nil ((a b) c) (d e))
		       :test #'equal)))

(define-test assoc.7
  (assert-equal '((a b) c)
		(assoc '(a b) '((a . b) nil ((a b) c) (d e))
		       :test-not (complement #'equal))))

(define-test assoc.8
  (assert-equal '((a b) c)
		(assoc 'a '(((b a) . b) nil ((a b) c) ((d) e))
		       :key #'car)))

(define-test assoc.error.1
  (assert-error 'type-error
		(assoc 'a '((b . c) nil d (a b)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the assoc-if function

(define-test assoc-if.1
  (assert-equal '(a . b)
		(assoc-if (lambda (x) (eq x 'a))
			  '((b) nil (a . b) (a . c)))))

(define-test assoc-if.2
  (assert-equal nil
		(assoc-if (lambda (x) (eq x 'c))
			  '((b) nil (a . b) (a . c)))))

(define-test assoc-if.3
  (assert-equal '(nil . c)
		(assoc-if #'null
			  '((b) nil (a . b) (nil . c)))))

(define-test assoc-if.4
  (assert-equal '(123 . b)
		(assoc-if (lambda (x) (eql x 123))
			  '((b) nil (123 . b) (nil . c)))))

(define-test assoc-if.5
  (assert-equal '(#\a . b)
		(assoc-if (lambda (x) (eql x #\a))
			  '((b) nil (#\a . b) (nil . c)))))

(define-test assoc-if.6
  (assert-equal '((a b) c)
		(assoc-if (lambda (x) (eq x 'a))
			  '(((b a) . b) nil ((a b) c) ((d) e))
			  :key #'car)))

(define-test assoc-if.error.1
  (assert-error 'type-error
		(assoc-if (lambda (x) (eq x 'a))
			  '((b . c) nil d (a b)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the assoc-if-not function

(define-test assoc-if-not.1
  (assert-equal '(a . b)
		(assoc-if-not (complement (lambda (x) (eq x 'a)))
			      '((b) nil (a . b) (a . c)))))

(define-test assoc-if-not.2
  (assert-equal nil
		(assoc-if-not (complement (lambda (x) (eq x 'c)))
			      '((b) nil (a . b) (a . c)))))

(define-test assoc-if-not.3
  (assert-equal '(nil . c)
		(assoc-if-not (complement #'null)
			      '((b) nil (a . b) (nil . c)))))

(define-test assoc-if-not.4
  (assert-equal '(123 . b)
		(assoc-if-not (complement (lambda (x) (eql x 123)))
			      '((b) nil (123 . b) (nil . c)))))

(define-test assoc-if-not.5
  (assert-equal '(#\a . b)
		(assoc-if-not (complement (lambda (x) (eql x #\a)))
			      '((b) nil (#\a . b) (nil . c)))))

(define-test assoc-if-not.6
  (assert-equal '((a b) c)
		(assoc-if-not (complement (lambda (x) (eq x 'a)))
			      '(((b a) . b) nil ((a b) c) ((d) e))
			      :key #'car)))

(define-test assoc-if-not.error.1
  (assert-error 'type-error
		(assoc-if-not (complement (lambda (x) (eq x 'a)))
			      '((b . c) nil d (a b)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the rassoc function

(define-test rassoc.1
  (assert-equal '(a . b)
		(rassoc 'b '((b) nil (a . b) (a . c)))))

(define-test rassoc.2
  (assert-equal nil
		(rassoc 'd '((b) nil (a . b) (a . c)))))

(define-test rassoc.3
  (assert-equal '(b)
		(rassoc 'nil '((b) nil (a . b) (nil . c)))))

(define-test rassoc.4
  (assert-equal '(b . 123)
		(rassoc 123 '((b) nil (b . 123) (nil . c)))))

(define-test rassoc.5
  (assert-equal '(b . #\a)
		(rassoc #\a '((b) nil (b . #\a) (nil . c)))))

(define-test rassoc.6
  (assert-equal '((a b) c)
		(rassoc '(c) '((a . b) nil ((a b) c) (d e))
			:test #'equal)))

(define-test rassoc.7
  (assert-equal '((a b) c)
		(rassoc '(c) '((a . b) nil ((a b) c) (d e))
		       :test-not (complement #'equal))))

(define-test rassoc.8
  (assert-equal '((a b) c)
		(rassoc 'c '(((b a) b) nil ((a b) c) ((d) e))
		       :key #'car)))

(define-test rassoc.error.1
  (assert-error 'type-error
		(rassoc 'a '((b . c) nil d (a b)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the rassoc-if function

(define-test rassoc-if.1
  (assert-equal '(a . b)
		(rassoc-if (lambda (x) (eq x 'b))
			  '((b) nil (a . b) (a . c)))))

(define-test rassoc-if.2
  (assert-equal nil
		(rassoc-if (lambda (x) (eq x 'd))
			  '((b) nil (a . b) (a . c)))))

(define-test rassoc-if.3
  (assert-equal '(b)
		(rassoc-if #'null
			  '((b) nil (a . b) (nil . c)))))

(define-test rassoc-if.4
  (assert-equal '(b . 123)
		(rassoc-if (lambda (x) (eql x 123))
			  '((b) nil (b . 123) (nil . c)))))

(define-test rassoc-if.5
  (assert-equal '(b . #\a)
		(rassoc-if (lambda (x) (eql x #\a))
			  '((b) nil (b . #\a) (nil . c)))))

(define-test rassoc-if.6
  (assert-equal '((a b) c)
		(rassoc-if (lambda (x) (eq x 'c))
			  '(((b a) b) nil ((a b) c) ((d) e))
			  :key #'car)))

(define-test rassoc-if.error.1
  (assert-error 'type-error
		(rassoc-if (lambda (x) (eq x 'a))
			  '((b . c) nil d (a b)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the rassoc-if-not function

(define-test rassoc-if-not.1
  (assert-equal '(a . b)
		(rassoc-if-not (complement (lambda (x) (eq x 'b)))
			      '((b) nil (a . b) (a . c)))))

(define-test rassoc-if-not.2
  (assert-equal nil
		(rassoc-if-not (complement (lambda (x) (eq x 'd)))
			      '((b) nil (a . b) (a . c)))))

(define-test rassoc-if-not.3
  (assert-equal '(b)
		(rassoc-if-not (complement #'null)
			      '((b) nil (a . b) (nil . c)))))

(define-test rassoc-if-not.4
  (assert-equal '(b . 123)
		(rassoc-if-not (complement (lambda (x) (eql x 123)))
			      '((b) nil (b . 123) (nil . c)))))

(define-test rassoc-if-not.5
  (assert-equal '(b . #\a)
		(rassoc-if-not (complement (lambda (x) (eql x #\a)))
			      '((b) nil (b . #\a) (nil . c)))))

(define-test rassoc-if-not.6
  (assert-equal '((a b) c)
		(rassoc-if-not (complement (lambda (x) (eq x 'c)))
			      '(((b a) b) nil ((a b) c) ((d) e))
			      :key #'car)))

(define-test rassoc-if-not.error.1
  (assert-error 'type-error
		(rassoc-if-not (complement (lambda (x) (eq x 'a)))
			      '((b . c) nil d (a b)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the sublis function

(define-test sublis.1
  (assert-equal '((1 x) (((2 y z))) ((c)))
		(sublis '((a . 1) (b . 2))
			(copy-tree '((a x) (((b y z))) ((c)))))))

(define-test sublis.2
  (assert-equal '(1 ((2)) (1))
		(sublis '((a . 1) (b . 2))
			(copy-tree '((a x) (((b y z))) ((a))))
			:key #'car :test #'equal)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the nsublis function

(define-test nsublis.1
  (assert-equal '((1 x) (((2 y z))) ((c)))
		(sublis '((a . 1) (b . 2))
			(copy-tree '((a x) (((b y z))) ((c)))))))

(define-test nsublis.2
  (assert-equal '(1 ((2)) (1))
		(sublis '((a . 1) (b . 2))
			(copy-tree '((a x) (((b y z))) ((a))))
			:key #'car :test #'equal)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the pairlis function

(define-test pairlis.1
  (assert-equal '()
		(pairlis '() '())))

(define-test pairlis.2
  (let ((tail '((a b) (c d))))
    (assert-eq tail
	       (cddr (pairlis '(1 2) '(2 3) tail)))))

(define-test pairlis.3
  (assert-equal '((c . d) (a . b) (e f))
		(pairlis '(a c) '(b d) '((e f)))))

(define-test parilis.error.1
  (assert-error 'type-error
		(pairlis '(a . b) '(c d) '((e f)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the copy-alist function

(define-test copy-alist.1
  (assert-equal '()
		(copy-alist '())))

(define-test copy-alist.2
  (assert-equal '((a) (b))
		(copy-alist '((a) (b)))))

(define-test copy-alist.3
  (assert-false (let ((alist '((a) (b))))
		  (eq (car alist)
		      (car (copy-alist alist))))))

(define-test copy-alist.error.1
  (assert-error 'type-error
		(copy-alist '(a))))

(define-test copy-alist.error.2
  (assert-error 'type-error
		(copy-alist '((a) .b))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the tailp function

(define-test tailp.1
  (assert-false (tailp 123 '())))

(define-test tailp.2
  (assert-false (tailp 123 '(123))))

(define-test tailp.3
  (assert-true (tailp 123 123)))

(define-test tailp.4
  (assert-true (tailp 123 '(a . 123))))

(define-test tailp.5
  (let ((tail '(a b)))
    (assert-true (tailp tail (list* 1 2 tail)))))

(define-test tailp.5
  (let ((tail '(a b)))
    (assert-false (tailp tail (list* 1 2 (copy-list tail))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the ldiff function

(define-test ldiff.1
  (let ((list '(a b c . d)))
    (assert-equal nil (ldiff list list))))

(define-test ldiff.2
  (let ((list '(a b c . d)))
    (assert-equal '(a) (ldiff list (cdr list)))))

(define-test ldiff.3
  (let ((list '(a b c . d)))
    (assert-equal '(a b c) (ldiff list 'd))))

(define-test ldiff.4
  (let ((list '(a b c . d)))
    (assert-equal '(a b c . d) (ldiff list (cons 'c 'd)))))

(define-test ldiff.5
  (let ((list '(a b c . d)))
    (assert-equal '(a b c . d) (ldiff list 234))))

(define-test ldiff.6
  (let ((list '(a b c . d)))
    (assert-equal '(a b c . d) (ldiff list nil))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the union function

(define-test union.1
  (assert-equal '()
		(union '() '())))

(define-test union.2
  (assert-equal '()
		(union '() '() :test #'eq)))

(define-test union.3
  (assert-equal '()
		(union '() '() :test #'eql)))

(define-test union.4
  (assert-equal '()
		(union '() '() :test #'equal)))

(define-test union.5
  (assert-equal '()
		(union '() '() :test #'equalp)))

(define-test union.6
  (assert-equal '()
		(union '() '() :test #'<)))

(define-test union.7
  (assert-equal '()
		(set-difference (union '(1 2 3) '(3 4 5))
				'(1 2 3 4 5))))

(define-test union.8
  (assert-equal '()
		(set-difference (union '(abc def) '(abc ghi)
				       :test #'eq)
				'(abc def ghi)
				:test #'eq)))
(define-test union.9
  (assert-equal '()
		(set-difference (union '("abc" "def") '("abc" "ghi")
				       :test #'equal)
				'("abc" "def" "ghi")
				:test #'equal)))

(define-test union.10
  (assert-equal 1
                (length (union '(1) '(3) :key #'oddp))))

(define-test union.11
  (assert-equal 2
                (length (union '(4 1) '(3) :key #'oddp))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the nunion function

(define-test nunion.1
  (assert-equal '()
		(nunion '() '())))

(define-test nunion.2
  (assert-equal '()
		(nunion '() '() :test #'eq)))

(define-test nunion.3
  (assert-equal '()
		(nunion '() '() :test #'eql)))

(define-test nunion.4
  (assert-equal '()
		(nunion '() '() :test #'equal)))

(define-test nunion.5
  (assert-equal '()
		(nunion '() '() :test #'equalp)))

(define-test nunion.6
  (assert-equal '()
		(nunion '() '() :test #'<)))

(define-test nunion.7
  (assert-equal '()
		(set-difference (nunion (list 1 2 3) (list 3 4 5))
				'(1 2 3 4 5))))

(define-test nunion.8
  (assert-equal '()
		(set-difference (nunion (list 'abc 'def) (list 'abc 'ghi)
					:test #'eq)
				'(abc def ghi)
				:test #'eq)))
(define-test nunion.9
  (assert-equal '()
		(set-difference (nunion (list "abc" "def") (list "abc" "ghi")
					:test #'equal)
				'("abc" "def" "ghi")
				:test #'equal)))

(define-test nunion.10
  (assert-equal 1
                (length (nunion (list 1) (list 3) :key #'oddp))))

(define-test nunion.11
  (assert-equal 2
                (length (nunion (list 4 1) (list 3) :key #'oddp))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the intersection function

(define-test intersection.1
  (assert-equal '()
                (intersection '() '())))

(define-test intersection.2
  (assert-equal '()
                (intersection '() '() :test #'eq)))

(define-test intersection.3
  (assert-equal '()
                (intersection '() '() :test #'equal)))

(define-test intersection.4
  (assert-equal '()
                (intersection '() '() :test #'equalp)))

(define-test intersection.5
  (assert-equal '()
                (intersection '(a b) '())))

(define-test intersection.6
  (assert-equal '()
                (intersection '(a b) '() :test #'eq)))

(define-test intersection.7
  (assert-equal '()
                (intersection '(a b) '() :test #'equal)))

(define-test intersection.8
  (assert-equal '()
                (intersection '(a b) '() :test #'equalp)))

(define-test intersection.9
  (assert-equal '()
                (intersection '() '(a b))))

(define-test intersection.10
  (assert-equal '()
                (intersection '() '(a b) :test #'eq)))

(define-test intersection.11
  (assert-equal '()
                (intersection '() '(a b) :test #'equal)))

(define-test intersection.12
  (assert-equal '()
                (intersection '() '(a b) :test #'equalp)))

(define-test intersection.13
  (assert-equal 1
                (length (intersection '(1) '(3) :key #'oddp))))

(define-test intersection.14
  (assert-equal 0
                (length (intersection '(1) '(4) :key #'oddp))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the nintersection function

(define-test nintersection.1
  (assert-equal '()
                (nintersection '() '())))

(define-test nintersection.2
  (assert-equal '()
                (nintersection '() '() :test #'eq)))

(define-test nintersection.3
  (assert-equal '()
                (nintersection '() '() :test #'equal)))

(define-test nintersection.4
  (assert-equal '()
                (nintersection '() '() :test #'equalp)))

(define-test nintersection.5
  (assert-equal '()
                (nintersection (list 'a 'b) '())))

(define-test nintersection.6
  (assert-equal '()
                (nintersection (list 'a 'b) '() :test #'eq)))

(define-test nintersection.7
  (assert-equal '()
                (nintersection (list 'a 'b) '() :test #'equal)))

(define-test nintersection.8
  (assert-equal '()
                (nintersection (list 'a 'b) '() :test #'equalp)))

(define-test nintersection.9
  (assert-equal '()
                (nintersection '() (list 'a 'b))))

(define-test nintersection.10
  (assert-equal '()
                (nintersection '() (list 'a 'b) :test #'eq)))

(define-test nintersection.11
  (assert-equal '()
                (nintersection '() (list 'a 'b) :test #'equal)))

(define-test nintersection.12
  (assert-equal '()
                (nintersection '() (list 'a 'b) :test #'equalp)))

(define-test nintersection.13
  (assert-equal 1
                (length (nintersection (list 1) (list 3) :key #'oddp))))

(define-test nintersection.14
  (assert-equal 0
                (length (nintersection (list 1) (list 4) :key #'oddp))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the adjoin function

(define-test adjoin.1
  (assert-equal '(1)
		(adjoin 1 '())))

(define-test adjoin.2
  (assert-equal '(1 2)
		(adjoin 1 '(2))))

(define-test adjoin.3
  (assert-equal '(2 1)
		(adjoin 1 '(2 1))))

(define-test adjoin.4
  (assert-equal '(1)
		(adjoin 1 '() :test #'eql)))

(define-test adjoin.5
  (assert-equal '(1 2)
		(adjoin 1 '(2) :test #'eql)))

(define-test adjoin.6
  (assert-equal '(2 1)
		(adjoin 1 '(2 1) :test #'eql)))

(define-test adjoin.7
  (assert-equal '(1)
		(adjoin 1 '() :test 'eql)))

(define-test adjoin.8
  (assert-equal '(1 2)
		(adjoin 1 '(2) :test 'eql)))

(define-test adjoin.9
  (assert-equal '(2 1)
		(adjoin 1 '(2 1) :test 'eql)))

(define-test adjoin.10
  (assert-equal '(a)
		(adjoin 'a '() :test #'eq)))

(define-test adjoin.11
  (assert-equal '(a b)
		(adjoin 'a '(b) :test #'eq)))

(define-test adjoin.12
  (assert-equal '(b a)
		(adjoin 'a '(b a) :test #'eq)))

(define-test adjoin.13
  (assert-equal '(a)
		(adjoin 'a '() :test 'eq)))

(define-test adjoin.14
  (assert-equal '(a b)
		(adjoin 'a '(b) :test 'eq)))

(define-test adjoin.15
  (assert-equal '(b a)
		(adjoin 'a '(b a) :test 'eq)))

(define-test adjoin.16
  (assert-equal '(1)
		(adjoin 1 '() :test-not #'eql)))

(define-test adjoin.17
  (assert-equal '(2)
		(adjoin 1 '(2) :test-not #'eql)))

(define-test adjoin.18
  (assert-equal '(1 1)
		(adjoin 1 '(1) :test-not #'eql)))

(define-test adjoin.19
  (assert-equal '(1)
		(adjoin 1 '() :test-not 'eql)))

(define-test adjoin.20
  (assert-equal '(2)
		(adjoin 1 '(2) :test-not 'eql)))

(define-test adjoin.21
  (assert-equal '(1 1)
		(adjoin 1 '(1) :test-not 'eql)))

(define-test adjoin.22
  (assert-equal '((1 2) (3 4))
		(adjoin '(1 2) '((3 4)) :test #'equal)))

(define-test adjoin.22
  (assert-equal '((3 4) (1 2))
		(adjoin '(1 2) '((3 4) (1 2)) :test #'equal)))

(define-test adjoin.23
  (assert-equal '((3 4))
		(adjoin '(1 2) '((3 4)) :test-not #'equal)))

(define-test adjoin.24
  (assert-equal '((1 2) (1 2))
		(adjoin '(1 2) '((1 2)) :test-not #'equal)))

(define-test adjoin.25
  (assert-equal '((3 4) (1 2))
		(adjoin '(1 2) '((3 4) (1 2)) :key #'car)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests for the pushnew macro

(define-test pushnew.1
  (let ((list '()))
    (assert-equal '(1)
		  (pushnew 1 list))
    (assert-equal '(1)
		  list)))

(define-test pushnew.2
  (let ((list '(1)))
    (assert-equal '(1)
		  (pushnew 1 list))
    (assert-equal '(1)
		  list)))

(define-test pushnew.3
  (let ((list '(2)))
    (assert-equal '(1 2)
		  (pushnew 1 list))
    (assert-equal '(1 2)
		  list)))

(define-test pushnew.4
  (let ((list '(2 1)))
    (assert-equal '(2 1)
		  (pushnew 1 list))
    (assert-equal '(2 1)
		  list)))

(define-test pushnew-test.eql.1
  (let ((list '()))
    (assert-equal '(1)
		  (pushnew 1 list :test #'eql))
    (assert-equal '(1)
		  list)))

(define-test pushnew-test.eql.2
  (let ((list '(1)))
    (assert-equal '(1)
		  (pushnew 1 list :test #'eql))
    (assert-equal '(1)
		  list)))

(define-test pushnew-test.eql.3
  (let ((list '(2)))
    (assert-equal '(1 2)
		  (pushnew 1 list :test #'eql))
    (assert-equal '(1 2)
		  list)))

(define-test pushnew-test.eql.4
  (let ((list '(2 1)))
    (assert-equal '(2 1)
		  (pushnew 1 list :test #'eql))
    (assert-equal '(2 1)
		  list)))

(define-test pushnew-test-eq.1
  (let ((list '()))
    (assert-equal '(a)
		  (pushnew 'a list :test #'eq))
    (assert-equal '(a)
		  list)))

(define-test pushnew-test-eq.2
  (let ((list '(a)))
    (assert-equal '(a)
		  (pushnew 'a list :test #'eq))
    (assert-equal '(a)
		  list)))

(define-test pushnew-test-eq.3
  (let ((list '(b)))
    (assert-equal '(a b)
		  (pushnew 'a list :test #'eq))
    (assert-equal '(a b)
		  list)))

(define-test pushnew-test-eq.4
  (let ((list '(b a)))
    (assert-equal '(b a)
		  (pushnew 'a list :test #'eq))
    (assert-equal '(b a)
		  list)))

(define-test pushnew-test-equal.1
  (let ((list '()))
    (assert-equal '((a))
		  (pushnew '(a) list :test #'equal))
    (assert-equal '((a))
		  list)))

(define-test pushnew-test-equal.2
  (let ((list '((a))))
    (assert-equal '((a))
		  (pushnew '(a) list :test #'equal))
    (assert-equal '((a))
		  list)))

(define-test pushnew-test-equal.3
  (let ((list '((b))))
    (assert-equal '((a) (b))
		  (pushnew '(a) list :test #'equal))
    (assert-equal '((a) (b))
		  list)))

(define-test pushnew-test-equal.4
  (let ((list '((b) (a))))
    (assert-equal '((b) (a))
		  (pushnew '(a) list :test #'equal))
    (assert-equal '((b) (a))
		  list)))

(define-test pushnew-key-nil.1
  (let ((list '()))
    (assert-equal '(1)
		  (pushnew 1 list :key nil))
    (assert-equal '(1)
		  list)))

(define-test pushnew-key-nil.2
  (let ((list '(1)))
    (assert-equal '(1)
		  (pushnew 1 list :key nil))
    (assert-equal '(1)
		  list)))

(define-test pushnew-key-nil.3
  (let ((list '(2)))
    (assert-equal '(1 2)
		  (pushnew 1 list :key nil))
    (assert-equal '(1 2)
		  list)))

(define-test pushnew-key-nil.4
  (let ((list '(2 1)))
    (assert-equal '(2 1)
		  (pushnew 1 list :key nil))
    (assert-equal '(2 1)
		  list)))

(define-test pushnew-test-eql-key-nil.1
  (let ((list '()))
    (assert-equal '(1)
		  (pushnew 1 list :test #'eql :key nil))
    (assert-equal '(1)
		  list)))

(define-test pushnew-test-eql-key-nil.2
  (let ((list '(1)))
    (assert-equal '(1)
		  (pushnew 1 list :test #'eql :key nil))
    (assert-equal '(1)
		  list)))

(define-test pushnew-test-eql-key-nil.3
  (let ((list '(2)))
    (assert-equal '(1 2)
		  (pushnew 1 list :test #'eql :key nil))
    (assert-equal '(1 2)
		  list)))

(define-test pushnew-test-eql-key-nil.4
  (let ((list '(2 1)))
    (assert-equal '(2 1)
		  (pushnew 1 list :test #'eql :key nil))
    (assert-equal '(2 1)
		  list)))

(define-test pushnew-test-eq-key-nil.1
  (let ((list '()))
    (assert-equal '(a)
		  (pushnew 'a list :test #'eq :key nil))
    (assert-equal '(a)
		  list)))

(define-test pushnew-test-eq-key-nil.2
  (let ((list '(a)))
    (assert-equal '(a)
		  (pushnew 'a list :test #'eq :key nil))
    (assert-equal '(a)
		  list)))

(define-test pushnew-test-eq-key-nil.3
  (let ((list '(b)))
    (assert-equal '(a b)
		  (pushnew 'a list :test #'eq :key nil))
    (assert-equal '(a b)
		  list)))

(define-test pushnew-test-eq-key-nil.4
  (let ((list '(b a)))
    (assert-equal '(b a)
		  (pushnew 'a list :test #'eq :key nil))
    (assert-equal '(b a)
		  list)))

(define-test pushnew-test-equal-key-nil.1
  (let ((list '()))
    (assert-equal '((a))
		  (pushnew '(a) list :test #'equal :key nil))
    (assert-equal '((a))
		  list)))

(define-test pushnew-test-equal-key-nil.2
  (let ((list '((a))))
    (assert-equal '((a))
		  (pushnew '(a) list :test #'equal :key nil))
    (assert-equal '((a))
		  list)))

(define-test pushnew-test-equal-key-nil.3
  (let ((list '((b))))
    (assert-equal '((a) (b))
		  (pushnew '(a) list :test #'equal :key nil))
    (assert-equal '((a) (b))
		  list)))

(define-test pushnew-test-equal-key-nil.4
  (let ((list '((b) (a))))
    (assert-equal '((b) (a))
		  (pushnew '(a) list :test #'equal :key nil))
    (assert-equal '((b) (a))
		  list)))

(define-test pushnew-key-car.1
  (let ((list '()))
    (assert-equal '((1))
		  (pushnew '(1) list :key #'car))
    (assert-equal '((1))
		  list)))

(define-test pushnew-key-car.2
  (let ((list '((1))))
    (assert-equal '((1))
		  (pushnew '(1) list :key #'car))
    (assert-equal '((1))
		  list)))

(define-test pushnew-key-car.3
  (let ((list '((2))))
    (assert-equal '((1) (2))
		  (pushnew '(1) list :key #'car))
    (assert-equal '((1) (2))
		  list)))

(define-test pushnew-key-car.4
  (let ((list '((2) (1))))
    (assert-equal '((2) (1))
		  (pushnew '(1) list :key #'car))
    (assert-equal '((2) (1))
		  list)))

