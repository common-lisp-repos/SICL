(cl:in-package #:sicl-boot)

(defun boot ()
  (let ((boot (make-instance 'boot
                :e0 (make-instance 'environment)
                :e1 (make-instance 'environment)
                :e2 (make-instance 'environment)
                :e3 (make-instance 'environment)
                :e4 (make-instance 'environment)
                :e5 (make-instance 'environment)
                :e6 (make-instance 'environment))))
    (sicl-boot-phase-0:boot boot)
    (sicl-boot-phase-1:boot boot)
    (sicl-boot-phase-2:boot boot)
    (sicl-boot-phase-3:boot boot)
    (sicl-boot-phase-4:boot boot)
    (sicl-boot-phase-5:boot boot)
    boot))
