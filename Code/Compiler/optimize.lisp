(in-package #:sicl-optimize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; An instances of the CODE-OBJECT class represents a single code
;;; object.  An instruction is the INITIAL INSTRUCTION of a code
;;; object if and only if it is either the initial instruction of a
;;; PROGRAM (see below) or the INPUT of an ENCLOSE instruction.  The
;;; initial instruction of a code object does not have any
;;; predecessors.  A code object can be the input of at most one
;;; ENCLOSE instructions.  To preserve this property, inlining a code
;;; object must duplicate it, all the instructions in it, and all the
;;; lexical locations in it.
;;;
;;; The code objects of a program are nested, and the outermost code
;;; object is at NESTING DEPTH 0.  A code object B is IMMEDIATELY
;;; NESTED inside a code object A if and only if its initial
;;; instruction is the INPUT to an ENCLOSE instruction that belongs to
;;; code object A.  A code object B immediately nested inside a code
;;; object A has a nesting depth with is one greater than the nesting
;;; depth of A.
;;;
;;; An INSTRUCTION is said to be PRESENT in a code object A if it can
;;; be reached from the initial instruction of A by following
;;; successor arcs only.
;;; 
;;; An INSTRUCTION is said to BELONG to a code object A if it is
;;; present in A, but it is not present in any code object with a
;;; smaller nesting depth than that of A. 
;;; 
;;; An INSTRUCTION can be present in several code objects, but can
;;; belong to only one.  An instruction is present in more than one
;;; code objects when it belongs to some code object A, but it can
;;; also be reached from an instruction in a code object B nested
;;; inside A, so that B has a nesting depth that is greater than that
;;; of A. Such a situation is the result of a RETURN-FROM or a GO form
;;; that transfers control from one code object to an enclosing code
;;; object.
;;;
;;; A LOCATION is an explicit (present in source code) or implicit
;;; (allocated by the compiler) lexical "place" used to store local
;;; variables and temporaries.  Locations are not directly used as
;;; input or output by instructions.  Instead the are used through an
;;; intermediate object called a LEXICAL-LOCATION-INFO object.  Such
;;; an object contains the location, but also contains other
;;; information, in paricular the TYPE of the objects that the
;;; location may contain in a particular point in the program.  A
;;; location can be referred to by several different
;;; LEXICAL-LOCATION-INFO objects, which reflect the fact that a
;;; location can have different type restrictions at different points
;;; in the program, for instance as a result of a local declaration.
;;;
;;; An instruction I REFERS TO a location L if and only if a
;;; lexical-location-info object that contains L is either
;;; one of the inputs or one of the outputs of I.  
;;;
;;; A LOCATION can be referred to by several different instructions
;;; that belong to code objects at different nesting depths.  Because
;;; of the way locations are created, if a location is referred to by
;;; two different instructions belonging to two different code
;;; objects, A and B, and neither A is nested inside B nor B is nested
;;; inside A, then the location is also referred to by some code
;;; object C inside which both A and B are nested.
;;;
;;; A LOCATION L is said to be PRESENT in a code object A if and only
;;; if some instruction belonging to A refers to L.  A location L is
;;; said to BELONG to a code object A if L is present in A, and L is
;;; not present in a code object inside which A is nested.  Because of
;;; the restriction in the previous paragraph, every location belongs
;;; to some unique code object.
;;;
;;; The LEXICAL DEPTH of a code object is a quantity that is less than
;;; or equal to the NESTING depth of that code object.  We define it
;;; recursively as follows: The lexical depth of a code object A such
;;; that every location and instruction that is present in A also
;;; belongs to A is defined to be 0.  For a code object A with a
;;; location or an instruction present in it, but that belongs to a
;;; different code object B, let D be the greatest depth of any such
;;; code object B.  Then the lexical depth of A is D+1. 
;;;
;;; A SIMPLE INSTRUCTION CHAIN is a sequence of instructions, all
;;; belonging to the same code object such that every instruction in
;;; the sequence except the first is the unique successor in the
;;; instruction graph of its predecessor in the sequence, and every
;;; instruction in the sequence except the last is the unique
;;; predecessor in the instruction graph of its successor in the
;;; sequence.
;;;
;;; A BASIC BLOCK is a MAXIMAL SIMPLE INSTRUCTION CHAIN.  It is
;;; maximal in that if any predecessor in the instruction graph of the
;;; first instruction in the chain were to be included in the
;;; sequence, then the sequence is no longer a simple instruction
;;; chain, and if any successor in the instruction graph of the last
;;; instruction in the chain were to be included in the sequence, then
;;; the sequence is no longer a simple instruction chain. 
;;;
;;; Every instruction belongs to exactly one basic block.  In the
;;; degenerate case, the basic block to which an instruction belongs
;;; contains only that single instruction.

(defclass code-object ()
  ((%initial-instruction
    :initarg :initial-instruction :accessor initial-instruction)
   ;; Instructions that belong to this code object. 
   (%instructions :initform '() :accessor instructions)
   ;; Locations that  belong to this code object. 
   (%locations :initform '() :accessor locations)
   (%nesting-depth :initarg :nesting-depth :accessor nesting-depth)
   (%lexical-depth :initform nil :accessor lexical-depth)
   ;; The basic blocks that belong to this code object.
   (%basic-blocks :initform '() :accessor basic-blocks)))

(defun make-code-object (initial-instruction nesting-depth)
  (make-instance 'code-object
    :initial-instruction initial-instruction
    :nesting-depth nesting-depth))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; A PROGRAM represents a top-level form together with derived
;;; knowledge of that form.  To begin with, a instance of a program
;;; contains only the initial instruction of the graph of instructions
;;; that represent nested code objects.

(defclass program ()
  ((%initial-instruction
    :initarg :initial-instruction :accessor initial-instruction)
   ;; This table maps each instruction to a list of predecessor
   ;; instructions. 
   (%predecessors :initform nil :accessor predecessors)
   ;; This table maps each instruction of the program to
   ;; the code object to which the instruction belongs.
   (%instruction-code :initform nil :accessor instruction-code)
   ;; This table maps each location of the program to the code object
   ;; to which the location belongs.
   (%location-code :initform nil :accessor location-code)
   ;; For each instruction, give a set of locations together with
   ;; their use distance immediately before the instruction.
   (%pre-locations :initform nil :accessor pre-locations)
   ;; For each instruction, give a set of locations together with
   ;; their use distance immediately after the instruction.
   (%post-locations :initform nil :accessor post-locations)
   ;; All the code objects of this program.
   (%code-objects :initform '() :accessor code-objects)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; For each instruction in a complete instruction graph, determine
;;; all the nested code objects, and to which code object each
;;; instruction belongs.

(defun compute-instruction-ownership (program)
  (with-accessors ((initial-instruction initial-instruction)
		   (instruction-code instruction-code)
		   (code-objects code-objects))
      program
    (setf instruction-code (make-hash-table :test #'eq))
    (let* ((first (make-code-object initial-instruction 0))
	   (worklist (list first)))
      (push first code-objects)
      (flet
	  ((handle-single-code-object (code-object)
	     (labels
		 ((aux (instruction)
		    (when (null (gethash instruction instruction-code))
		      (setf (gethash instruction instruction-code)
			    code-object)
		      (when (typep instruction 'p2:enclose-instruction)
			(let ((new (make-code-object
				    (p2:code instruction)
				    (1+ (nesting-depth code-object)))))
			  (push new code-objects)
			  (setf worklist (append worklist (list new)))))
		      (mapc #'aux (p2:successors instruction)))))
	       (aux (initial-instruction code-object)))))
	(loop until (null worklist)
	      do (handle-single-code-object (pop worklist)))))
    (maphash (lambda (instruction code-object)
	       (push instruction (instructions code-object)))
	     instruction-code)))

(defun ensure-instruction-ownership (program)
  (when (null (instruction-code program))
    (compute-instruction-ownership program)))

(defun instruction-owner (instruction program)
  (ensure-instruction-ownership program)
  (gethash instruction (instruction-code program)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Determine the predecessors of every instruction in a program

(defun compute-predecessors (program)
  (ensure-instruction-ownership program)
  (with-accessors ((instruction-code instruction-code)
		   (predecessors predecessors))
      program
    (setf predecessors (make-hash-table :test #'eq))
    (maphash (lambda (instruction code)
	       (declare (ignore code))
	       (loop for successor in (p2:successors instruction)
		     do (push instruction (gethash successor predecessors))))
	      instruction-code)))

(defun ensure-predecessors (program)
  (when (null (predecessors program))
    (compute-predecessors program)))

(defun instruction-predecessors (instruction program)
  (ensure-predecessors program)
  (gethash instruction (predecessors program)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; For each location in a complete instruction graph, determine
;;; to which code object each location belongs.

(defun compute-location-ownership (program)
  (with-accessors ((location-code location-code)
		   (code-objects code-objects))
      program
    (ensure-instruction-ownership program)
    (setf location-code (make-hash-table :test #'eq))
    (let ((sorted-code
	    (sort (copy-list code-objects) #'< :key #'nesting-depth)))
      (loop for code-object in sorted-code
	    do (loop for instruction in (instructions code-object)
		     do (loop for info in (append (p2:inputs instruction)
						  (p2:outputs instruction))
			      for location = (sicl-env:location info)
			      do (when (null (gethash location location-code))
				   (setf (gethash location location-code)
					 code-object))))))
    (maphash (lambda (location code-object)
	       (push location (locations code-object)))
	     location-code)))

(defun ensure-location-ownership (program)
  (when (null (location-code program))
    (compute-location-ownership program)))

(defun location-owner (location program)
  (ensure-location-ownership program)
  (gethash location (location-code program)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Determine the LEXICAl DEPTH of each code object in a program.

(defun compute-lexical-depth (code-object program)
  (setf (lexical-depth code-object)
	(loop for location in (locations code-object)
	      maximize  (let ((owner (location-owner location program)))
			  (if (eq owner code-object)
			      0
			      (1+ (lexical-depth owner)))))))

(defun compute-lexical-depths (program)
  (with-accessors ((code-objects code-objects))
      program
    (let ((sorted-code
	    (sort (copy-list code-objects) #'< :key #'nesting-depth)))
      (loop for code-object in sorted-code
	    do (compute-lexical-depth code-object program)))))

(defun ensure-lexical-depths (program)
  (when (member nil (code-objects program) :key #'lexical-depth)
    (compute-lexical-depths program)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Determine pre-locations and post-locations for each instruction.
;;;
;;; In this context, a FUTURE SET is a list of CONS cells.  The CAR
;;; of each CONS cell is a location, and the CDR is a non-negative
;;; integer indicating the distance (in number of instructions) to the
;;; next use of the location.  Each location can be present at most
;;; once in the list.  

(defun future-sets-equal-p (set1 set2)
  (and (= (length set1) (length set2))
       (null (set-difference set1 set2 :test #'equal))
       (null (set-difference set2 set1 :test #'equal))))

(defun combine-future-sets (set1 set2)
  (let ((result '()))
    (loop for element in (append set1 set2)
	  do (let ((existing (find (car element) result :key #'car :test #'eq)))
	       (if (null existing)
		   (push element result)
		   (setf (cdr existing)
			 (min (cdr existing) (cdr element))))))
    result))

(defun pre-from-post (instruction program)
  (with-accessors ((pre-locations pre-locations)
		   (post-locations post-locations))
      program
    (let ((in-locations (mapcar #'sicl-env:location (p2:inputs instruction)))
	  (out-locations (mapcar #'sicl-env:location (p2:outputs instruction)))
	  (post (gethash instruction post-locations)))
      (let ((result post))
	;; Remove the locations that are created by this instruction.
	(loop for out in out-locations
	      do (setf result (remove out result :key #'car)))
	;; Increment the distance of the remaining ones.
	(loop for location in result
	      do (incf (cdr location)))
	;; Combine with inputs.
	(setf (gethash instruction pre-locations)
	      (combine-future-sets
	       result
	       (loop for in in in-locations
		     collect (cons in 0))))))))

(defun compute-pre-post-locations (program)
  (ensure-instruction-ownership program)
  (ensure-predecessors program)
  (with-accessors ((instruction-code instruction-code)
		   (predecessors predecessors)
		   (pre-locations pre-locations)
		   (post-locations post-locations))
      program
    (setf pre-locations (make-hash-table :test #'eq))
    (setf post-locations (make-hash-table :test #'eq))
    (let ((worklist '()))
      ;; Start by putting every instruction on the worklist.
      (maphash (lambda (instruction code)
		 (declare (ignore code))
		 (push instruction worklist))
	       instruction-code)
      (loop until (null worklist)
	    for instruction = (pop worklist)
	    do (pre-from-post instruction program)
	       (loop with pre = (gethash instruction pre-locations)
		     for pred in (gethash instruction predecessors)
		     for post = (gethash pred post-locations)
		     for combined = (combine-future-sets pre post)
		     do (unless (future-sets-equal-p post combined)
			  (setf (gethash pred post-locations)
				combined)
			  (unless (member pred worklist :test #'eq)
			    (if (= (length (p2:successors pred)) 1)
				(push pred worklist)
				(setf worklist
				      (append worklist (list pred)))))))))))
			  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;

(defclass assignment ()
  ((%free-regs :initarg :free-regs :reader free-regs)
   ;; A list of CONS cells (location . reg).
   (%in-regs :initarg :in-regs :reader in-regs)
   ;; A list of CONS cells (location . pos).
   (%on-stack :initarg :on-stack :reader on-stack)))

(defun make-assignment (free-regs in-regs on-stack)
  (make-instance 'assignment
    :free-regs free-regs
    :in-regs in-regs
    :on-stack on-stack))

;;; From a particular assignment and a future set, return two values:
;;; a new assignment which has at least one free register in it, and
;;; either a save instrution or nil if no saving is necessary.
(defun free-up-a-register (assignment future)
  (with-accessors ((free-regs free-regs)
		   (in-regs in-regs)
		   (on-stack on-stack))
      assignment
    (if (null free-regs)
	(let ((location-reg nil))
	  (loop with max = 0
		for loc in in-regs
		for time = (cdr (find (car loc) future :test #'eq :key #'car))
		do (when (> time max)
		     (setf max time)
		     (setf location-reg loc)))
	  ;; Check whether the location found is also on the stack
	  (if (member (car location-reg) on-stack :test #'eq :key #'car)
	      ;; If it is, then no saving is necessary.
	      (values 
	       (make-assignment (list (cdr location-reg))
				(remove location-reg in-regs :test #'eq)
				on-stack)
	       nil)
	      ;; If not, we need to save it.
	      (let ((pos (loop for pos from 0
			       unless (member pos on-stack :key #'cdr)
				 return pos)))
		(values
		 (make-assignment (list (cdr location-reg))
				  (remove location-reg in-regs :test #'eq)
				  (cons (cons (car location-reg) pos) on-stack))
		 `(save ,(cdr location-reg) ,pos)))))
	(values assignment nil))))
		 
;;; From a particular assignment, return two values: a new assignment
;;; in which all registers are free and a list of save instructions or
;;; nil if no saving is necessary.
(defun free-all-registers (assignment)
  (with-accessors ((free-regs free-regs)
		   (in-regs in-regs)
		   (on-stack on-stack))
      assignment
    (let ((instructions '())
	  (new-stack on-stack))
      (loop for loc in in-regs
	    do (unless (member (car loc) new-stack :test #'eq :key #'car)
		 (let ((pos (loop for pos from 0
				  unless (member pos new-stack :key #'cdr)
				    return pos)))
		   (push `(save ,(cdr loc) . ,pos) instructions)
		   (push `(,(car loc) . ,pos) new-stack))))
      (values
       (make-assignment (append (mapcar #'cdr in-regs) free-regs)
			'()
			new-stack)
       instructions))))
	  
;;; From a particular assignment and a future set, return a new
;;; assignment that is filtred so that only locations in the future
;;; set are on the stack or in registers.
(defun filter-assignment (assignment future)
  (with-accessors ((free-regs free-regs)
		   (in-regs in-regs)
		   (on-stack on-stack))
      assignment
    (let ((new-free-regs free-regs)
	  (new-in-regs '())
	  (new-stack '()))
      (loop for loc in in-regs
	    do (if (member (car loc) future :test #'eq :key #'car)
		   (push loc new-in-regs)
		   (push (cdr loc) new-free-regs)))
      (loop for loc in on-stack
	    do (when (member (car loc) future :test #'eq :key #'car)
		 (push loc new-stack)))
      (make-assignment new-free-regs
		       new-in-regs
		       new-stack))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Basic blocks.

(defclass basic-block ()
  ((%initial :initarg :initial :accessor initial)
   (%final :initarg :final :accessor final)))

(defun compute-basic-blocks-for-code-object (code-object program)
  (ensure-instruction-ownership program)
  (ensure-predecessors program)
  (with-accessors ((instructions instructions)
		   (basic-blocks basic-blocks))
      code-object
    (let ((remaining instructions))
      (flet ((one-block (instruction)
	       (let ((initial instruction)
		     (final instruction))
		 (loop for preds = (instruction-predecessors initial program)
		       while (= (length preds) 1)
		       for pred = (car preds)
		       while (eq (instruction-owner pred program) code-object)
		       for succs = (p2:successors pred)
		       while (= (length succs) 1)
		       do (setf initial pred)
			  (setf remaining (remove pred remaining :test #'eq)))
		 (loop for succs = (p2:successors final)
		       while (= (length succs) 1)
		       for succ = (car succs)
		       while (eq (instruction-owner succ program) code-object)
		       for preds = (instruction-predecessors succ program)
		       while (= (length preds) 1)
		       do (setf final succ)
			  (setf remaining (remove succ remaining :test #'eq)))
		 (make-instance 'basic-block
		   :initial initial
		   :final final))))
	(loop until (null remaining)
	      do (push (one-block (pop remaining)) basic-blocks))))))

(defun ensure-basic-block-for-code-object (code-object program)
  (when (null (basic-blocks code-object))
    (compute-basic-blocks-for-code-object code-object program)))

(defun compute-basic-blocks (program)
  (ensure-instruction-ownership program)
  (loop for code-object in (code-objects program)
	do (compute-basic-blocks-for-code-object code-object program)))
  
(defun ensure-basic-blocks (program)
  (ensure-instruction-ownership program)
  (loop for code-object in (code-objects program)
	do (ensure-basic-block-for-code-object code-object program)))