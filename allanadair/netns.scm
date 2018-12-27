(define-module (allanadair netns)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix download)
  #:use-module (guix build-system go)
  #:use-module (gnu packages base)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages version-control))

(define-public netns
  (package
    (name "netns")
    (version "0.5.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/genuinetools/netns")
             (commit (string-append "v" version))))
       (file-name (git-file-name "netns" version))
       (sha256
        (base32
         "0qrb0sq96inblqfandzdd3m9jnmw8gkjfv34vk36890r0sg721ml"))))
    (build-system go-build-system)
    (native-inputs
     `(("coreutils" ,coreutils)
       ("git" ,git)
       ("linux-libre-headers" ,linux-libre-headers)))
    (arguments
     '(#:unpack-path "github.com/genuinetools/netns"
       #:import-path "github.com/genuinetools/netns"
       #:phases
       (modify-phases
	%standard-phases
	(replace 'build
		 (lambda* (#:key unpack-path #:allow-other-keys)
		   (chdir (string-append "src/" unpack-path))
		   (invoke "make" "static")))
	(replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (invoke "make" "install"
                       (string-append "PREFIX=" out)))))
	)))
    (home-page "https://github.com/genuinetools/netns")
    (synopsis "Runc hook (OCI compatible) for setting up default bridge networking for containers.")
    (description "Runc hook (OCI compatible) for setting up default bridge networking for containers.")
    (license license:expat)))
