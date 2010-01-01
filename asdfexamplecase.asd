;;  -*- mode: lisp -*-
;;; Copyright (c) 2008, by AJ Rossini <blindglobe@gmail.com>
;;; ASDF packaging example
;;; License: BSD, 
;;; Time-stamp: <2008-07-11 17:24:50 tony>
;;; Created:    <2008-05-16 08:33:36 tony>

(in-package :cl-user)

(defpackage #:asdfexamplecase-system
    (:use :asdf :common-lisp))

(in-package :asdfexamplecase-system)

(defsystem asdfexamplecase
  :version #.(with-open-file
		 (vers (merge-pathnames "version.lisp-expr"
					*load-truename*)))
  :name "ASDF Example"
  :author "A.J. Rossini <blindglobe@gmail.com>"
  :license "BSD"
  :description "ASDF example of a complex system definition using a complex directory scheme."
  :serial t
  ;; :depends-on (:lift) ; non-real example of how ASDF dependencies...
  :components (
	       ;; FILES that exist, but are not part of the Lisp
	       ;; program code.
	       (:static-file "LICENSE")
	       (:static-file "README")
	       (:static-file "version" :pathname #p"version.lisp-expr")

	       ;; Start of common lisp program 
	       (:file "test1")
	       (:file "test2" :depends-on ("test1"))

	       ;; preparation for modulization...
	       (:module
		"src"
		:pathname "src/"
		:components ((:file "a")
			     (:file "b" :depends-on ("a"))))
	       
	       (:module
		"first-level-prime"
		:pathname "src/"
		:components ((:file "a")
			     (:file "c" :depends-on ("a"))))
	       
	       (:module	"second-level-one"
			:pathname "src/one/"
			:components ((:file "one")))
	       
	       (:module	"second-level-two"
			:pathname "src/two/"
			:components ((:file "two")
				     (:file "three" :depends-on ("two"))))))
