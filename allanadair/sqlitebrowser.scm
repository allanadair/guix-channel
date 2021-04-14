(define-module (allanadair sqlitebrowser)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system qt)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages qt))

(define-public allanadair-sqlitebrowser
  (package
    (name "allanadair-sqlitebrowser")
    (version "3.12.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sqlitebrowser/sqlitebrowser")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0ray6cscx2qil1dfi7hmpijmq3kba49wn430ih1q4fkz9psjvrz1"))
    (build-system cmake-build-system)
    (native-inputs
     `(("qttools" ,qttools)))
    (inputs
     `(("qtbase" ,qtbase)
       ("qscintilla" ,qscintilla)
       ("sqlite" ,sqlite)))
    (arguments
     `(#:configure-flags '("-DENABLE_TESTING=ON"
			   "-DFORCE_INTERNAL_QSCINTILLA=OFF"
			   "-DFORCE_INTERNAL_QCUSTOMPLOT=ON"
			   "-DFORCE_INTERNAL_QHEXEDIT=ON")))
    (home-page "https://sqlitebrowser.org/")
    (synopsis "DB Browser for SQLite is a tool to create, design, and
edit database files compatible with SQLite")
    (description
     "DB4S is for users and developers who want to create, search, and
edit databases. DB4S uses a familiar spreadsheet-like interface, and
complicated SQL commands do not have to be learned.")
    (license (list license:gpl3+ license:mpl2.0))))
