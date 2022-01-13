(define-module (allanadair gopls)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix download)
  #:use-module (guix build-system go)
  #:use-module (gnu packages golang))

(define-public gopls
  (package
    (inherit go-golang-org-x-tools)
    (name "gopls")
    (inputs `(("go-golang.org-x-sync-errgroup" ,go-golang.org-x-sync-errgroup)))
    (arguments
     '(#:unpack-path "golang.org/x/tools"
       #:import-path "golang.org/x/tools/gopls"))
    (synopsis "gopls, the Go language server")
    (description
     "gopls is the official Go language server developed by the Go
team. It provides IDE features to any LSP-compatible editor")
    (license license:bsd-3)))
