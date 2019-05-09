(cl:in-package #:sicl-hir-to-cl)

(defun make-case-clauses (catch-instruction)
  (loop for successor in (cleavir-ir:successors catch-instruction)
        for i from 0
        for basic-block = (basic-block-of-leader successor)
        for tag = (tag-of-basic-block basic-block)
        collect `(,i (go ,tag))))

(defmethod translate-final-instruction (client (instruction cleavir-ir:catch-instruction) context)
  (let* ((dynamic-environment-output-location
           (first (cleavir-ir:outputs instruction)))
         (basic-blocks (basic-blocks-in-dynamic-environment
                        dynamic-environment-output-location))
         (*dynamic-environment-stack*
           (cons dynamic-environment-output-location *dynamic-environment-stack*)))
    `((push (make-instance 'block/tagbody-entry) *dynamic-environment*)
      (tagbody
         ,@(loop for basic-block in basic-blocks
                 for tag = (tag-of-basic-block basic-block)
                 collect `(,tag
                           (case (catch 'foo
                                   ,@(translate-basic-block
                                      client
                                      basic-block
                                      context))
                             ,@(make-case-clauses instruction))))))))


