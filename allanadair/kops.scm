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
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages version-control))

(define-public kops
  (package
    (name "kops")
    (version "1.18.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kubernetes/kops")
             (commit "84495481e4e1f8adb7774c3101ee5a5740479518")))
       (file-name (git-file-name "kops" version))
       (sha256
        (base32
         "1g260q73cwd1av8zn7xj8h2hb9hxil0y4irmdpjnxsd6bskp12h4"))))
    (build-system go-build-system)
    (native-inputs
     `(("git" ,git)
       ("gawk" ,gawk)
       ("sed" ,sed)))
    (inputs
      `(("python" ,python)
	("perl" ,perl)
	("ruby" ,ruby)
	("node" ,node)))
    (arguments
     '(#:import-path "k8s.io/kops"
       #:unpack-path "k8s.io/kops"
       #:install-source? #f))
    (home-page "https://kops.sigs.k8s.io/")
    (synopsis "The easiest way to get a production grade Kubernetes cluster up and running")
    (description "kops helps you create, destroy, upgrade and maintain production-grade, highly available, Kubernetes clusters from the command line. AWS (Amazon Web Services) is currently officially supported, with GCE and OpenStack in beta support, and VMware vSphere in alpha, and other platforms planned")
    (license license:asl2.0)))
