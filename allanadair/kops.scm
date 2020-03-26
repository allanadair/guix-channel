(define-module (allanadair kops)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix download)
  #:use-module (guix build-system go)
  #:use-module (gnu packages base)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages node)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python)
  #:use-module (gnu packages version-control))

(define-public kops
  (package
    (name "kops")
    (version "1.16.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kubernetes/kops")
             (commit (string-append "v" version))))
       (file-name (git-file-name "kops" version))
       (sha256
        (base32
         "1jc3p8f44dxmi73z1c2ji4xsch597pmlkfbaglpc720vs4c59qmn"))))
    (build-system go-build-system)
    (native-inputs
     `(("git" ,git)
       ("gawk" ,gawk)
       ("sed" ,sed)))
    (inputs
      `(("python" ,python)
	("perl" ,perl)
	("node" ,node)))
    (arguments
     '(#:unpack-path "k8s.io/kops"
       #:import-path "k8s.io/kops/cmd/kops"
       #:install-source? #f
       #:phases (modify-phases %standard-phases
		  (replace 'build
		    (lambda _
		      (setenv "VERSION" "1.16.0")
		      (invoke "make" "-f" "src/k8s.io/kops/Makefile")))
		  (delete 'check))))
    (home-page "https://kops.sigs.k8s.io/")
    (synopsis "The easiest way to get a production grade Kubernetes cluster up and running")
    (description "kops helps you create, destroy, upgrade and maintain production-grade, highly available, Kubernetes clusters from the command line. AWS (Amazon Web Services) is currently officially supported, with GCE and OpenStack in beta support, and VMware vSphere in alpha, and other platforms planned")
    (license license:asl2.0)))
