(cl:in-package #:asdf-user)

(defsystem sicl-hir-transformations
  :depends-on (#:cleavir2-hir
               #:cleavir2-ast-to-hir
               #:sicl-compiler-base
               #:sicl-run-time)
  :serial t
  :components
  ((:file "packages")
   (:file "preprocess-unwind")
   (:file "preprocess-catch")
   (:file "preprocess-bind")
   (:file "convert-symbol-value")
   (:file "hoist-fdefinitions")
   (:file "eliminate-create-cell")
   (:file "eliminate-fetch")
   (:file "eliminate-cell-access")
   (:file "hoist-constant-inputs")
   (:file "eliminate-fixed-to-multiple")
   (:file "eliminate-multiple-to-fixed")))
