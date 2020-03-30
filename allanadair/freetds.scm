(define-module (allanadair freetds)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module (guix packages))


(define-public freetds
  (package
   (name "freetds")
   (version "1.1.26")
   (source (origin
            (method url-fetch)
            (uri
             (string-append
              "ftp://ftp.freetds.org/pub/freetds/stable/freetds-"
              version ".tar.gz"))
            (sha256
             (base32 "18bxzwx9hlr69nw54hm1qf3z4gr389w5zgc2xnpc00r0hpqly4x2"))))
   (build-system gnu-build-system)
   (arguments
    '(#:phases (modify-phases %standard-phases
		(delete 'check))))
   (synopsis "FreeTDS is a set of libraries for Unix and Linux that allows your programs to natively talk to Microsoft SQL Server and Sybase databases.")
   (description "FreeTDS is a set of libraries for Unix and Linux that allows your programs to natively talk to Microsoft SQL Server and Sybase databases.")
   (license license:gpl2)
   (home-page "http://www.freetds.org/")))
