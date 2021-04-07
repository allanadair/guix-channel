(define-module (allanadair sqlitebrowser)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix download)
  #:use-module (guix build-system cmake)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages qt))

(define-public sqlitebrowser
  (package
    (name "sqlitebrowser")
    (version "3.12.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sqlitebrowser/sqlitebrowser")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0ray6cscx2qil1dfi7hmpijmq3kba49wn430ih1q4fkz9psjvrz1"))))
    (build-system cmake-build-system)
    (inputs
     `(("qtbase" ,qtbase)
       ("qttools" ,qttools)
       ("sqlite" ,sqlite)))
    (arguments
     '(#:phases (modify-phases %standard-phases
		  (delete 'check))))
    (home-page "https://sqlitebrowser.org/")
    (synopsis "DB Browser for SQLite (DB4S) is a high quality, visual, open source tool to create, design, and edit database files compatible with SQLite.")
    (description
     "DB4S is for users and developers who want to create, search, and edit databases. DB4S uses a familiar spreadsheet-like interface, and complicated SQL commands do not have to be learned.")
    (license license:gpl3+)))
