(cl:in-package #:common-lisp-user)

(asdf:defsystem :sicl-boot-phase2
  :depends-on (:sicl-code-utilities
	       :sicl-additional-conditions
	       :sicl-boot-phase1)
  :serial t
  :components
  ((:file "packages")
   (:file "rename-package-1")
   (:file "list-utilities")
   (:file "functionp")
   (:file "defclass-support")
   (:file "defclass-defmacro")
   (:file "define-built-in-class-defmacro")
   (:file "defgeneric-defmacro")
   (:file "defmethod-support")
   (:file "defmethod-defmacro")
   (:file "make-method-lambda-support")
   (:file "make-method-lambda-defuns")
   (:file "mop-class-hierarchy")
   (:file "define-variables")
   (:file "finalize-all-bridge-classes")
   (:file "add-remove-direct-method-support")
   (:file "add-remove-direct-method-defuns")
   (:file "classp")
   (:file "compute-applicable-methods-support")
   (:file "compute-applicable-methods-defuns")
   (:file "compute-effective-method-support")
   (:file "compute-effective-method-support-a")
   (:file "method-combination-compute-effective-method-support")
   (:file "method-combination-compute-effective-method-defuns")
   (:file "compute-effective-method-defuns")
   (:file "discriminating-automaton")
   (:file "discriminating-tagbody")
   (:file "compile")
   (:file "compute-discriminating-function-support")
   (:file "compute-discriminating-function-support-a")
   (:file "compute-discriminating-function-defuns")
   ;; Although we do not use the dependent maintenance facility, we
   ;; define the specified functions as ordinary functions that do
   ;; nothing, so that we can safely call them from other code.
   (:file "dependent-maintenance-support")
   (:file "dependent-maintenance-defuns")
   (:file "set-funcallable-instance-function")
   (:file "add-remove-method-support")
   (:file "add-remove-method-defuns")
   (:file "slot-value-etc-defgenerics")
   (:file "slot-value-etc-support")
   (:file "slot-value-etc-defmethods")
   (:file "slot-value-etc-specified-defuns")
   (:file "initialize-instance-defgenerics")
   (:file "reinitialize-instance-defgenerics")
   (:file "shared-initialize-defgenerics")
   (:file "initialize-instance-support")
   (:file "reinitialize-instance-support")
   (:file "initialize-instance-defmethods")
   (:file "reinitialize-instance-defmethods")   
   (:file "shared-initialize-defmethods")
   (:file "initialize-built-in-instance-defgenerics")
   (:file "initialize-built-in-instance-defmethods")
   (:file "specializerp")
   (:file "reader-writer-method-class-support")
   (:file "reader-writer-method-class-defgenerics")
   (:file "reader-writer-method-class-defmethods")
   (:file "make-instance")
   (:file "make-built-in-instance")
   (:file "ensure-accessor-function")
   (:file "add-accessor-method")
   (:file "slot-definition-class-support")
   (:file "slot-definition-class-defgenerics")
   (:file "slot-definition-class-defmethods")
   (:file "validate-superclass")
   (:file "class-initialization-support")
   (:file "class-initialization-defmethods")
   (:file "generic-function-initialization-support")
   (:file "generic-function-initialization-defmethods")
   (:file "direct-slot-definition-p")
   (:file "method-initialization-support")
   (:file "method-initialization-defmethods")
   (:file "class-database")
   (:file "generic-function-database")
   (:file "class-finalization-defgenerics")
   (:file "class-finalization-support")
   (:file "class-finalization-defmethods")
   (:file "built-in-class-finalization")
   (:file "finalize-target-classes")
   (:file "patch-target-objects")
   (:file "print-object")
   (:file "satiate-all-generic-functions")
   (:file "xensure-class")
   (:file "xensure-built-in-class")
   (:file "xensure-generic-function")
   (:file "xensure-method")
   (:file "allocate-instance-support")
   (:file "allocate-instance-defuns")
   (:file "rename-package-2")))
