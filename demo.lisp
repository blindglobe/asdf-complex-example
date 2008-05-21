
;; for running SBCL out of this directory, to use this as an example.
(pushnew #+sbcl *default-pathname-defaults* 
	 asdf:*central-registry*)

(asdf:oos 'asdf:compile-op 'asdfexamplecase :force t)
(asdf:oos 'asdf:load-op 'asdfexamplecase)
