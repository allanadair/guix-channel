(define-module (allanadair kubectl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix download)
  #:use-module (guix build-system go)
  #:use-module (gnu packages golang))

(define-public kubectl
  (package
    (name "kubectl")
    (version "1.14.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kubernetes/kubernetes")
             (commit (string-append "v" version))))
       (file-name (git-file-name "kubernetes" version))
       (sha256
        (base32
         "0sidh30srqhwf947wfv54lkrai6qhpdjjc1cnw424zfarj33yign"))))
    (build-system go-build-system)
    (arguments
     '(#:unpack-path "k8s.io/kubernetes"
       #:import-path "k8s.io/kubernetes/cmd/kubectl"
       #:install-source? #f
       #:phases (modify-phases %standard-phases
		  (add-before 'build 'build-what
		    (lambda _
		      (setenv "WHAT" "cmd/kubectl") #t)))))
    (home-page "https://kubernetes.io")
    (synopsis "Production-Grade Container Scheduling and Management")
    (description "Production-Grade Container Scheduling and Management")
    (license license:asl2.0)))
