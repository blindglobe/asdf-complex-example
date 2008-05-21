;;  -*- mode: lisp -*-
;;; Copyright (c) 2008, by AJ Rossini <blindglobe@gmail.com>
;;; ASDF packaging example
;;; License: BSD, 
;;; Time-stamp: <2008-05-21 08:11:08 tony>
;;; Created:    <2008-05-16 08:33:36 tony>

(in-package :cl-user)

(defpackage #:asdfexamplecase-system
    (:use :asdf :common-lisp))

(in-package :asdfexamplecase-system)

(defsystem asdfexamplecase
  :version #.(with-open-file
		 (vers (merge-pathnames "version.lisp-expr"
					*load-truename*)))
  :name "asdfexamplecase"
  :author "A.J. Rossini <blindglobe@gmail.com>"
  :license "BSD"
  :description "ASDF Examplecase of complex directory scheme."
  :serial t
  ;; :depends-on (:lift) ;;  :clem) not yet but soon!
  :components ((:file "test1")
	       (:file "test2" :depends-on ("test1"))

	       (:static-file "LICENSE")
	       (:static-file "README")
	       (:static-file "version" :pathname #p"version.lisp-expr")

	       ;; preparation for modulization...
	       (:module
		"src"
		:pathname "src/"
		:components ((:file "a")
			     (:file "b"
				    :depends-on ("a"))))
	       
	       (:module
		"first-level-prime"
		:pathname "src/"
		:components ((:file "c")
			     ;;(:file "c"
				;;    :depends-on ("a"))
			     ))
	       
	       (:module
		"second-level-one"
		:pathname "src/one/"
		:components ((:file "one")))
	       
	       (:module
		"second-level-two"
		:pathname "src/two/"
		:components ((:file "two")
			     (:file "three"
				    :depends-on ("two"))))))


