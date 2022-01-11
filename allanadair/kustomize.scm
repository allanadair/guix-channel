(define-module (allanadair kustomize)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix download)
  #:use-module (guix build-system go)
  #:use-module (gnu packages base)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages node)
  #:use-module (gnu packages python)
  #:use-module (gnu packages syncthing)
  #:use-module (gnu packages version-control))

(define-public go-github-com-monochromegane-go-gitignore
  (package
    (name "go-github-com-monochromegane-go-gitignore")
    (version "0.0.0-20200626010858-205db1a8cc00")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/monochromegane/go-gitignore")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1rawqsxi6n0nwl34nc4jda7drnwfli9v4zkhf60qhl6lcipj0lwg"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/monochromegane/go-gitignore"))
    (home-page "https://github.com/monochromegane/go-gitignore")
    (synopsis "go-gitignore")
    (description
      "This package provides a fast gitignore matching library for Go.")
    (license license:expat)))

(define-public go-github-com-pkg-errors
  (package
    (name "go-github-com-pkg-errors")
    (version "0.9.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/pkg/errors")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1761pybhc2kqr6v5fm8faj08x9bql8427yqg6vnfv6nhrasx1mwq"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/pkg/errors"))
    (home-page "https://github.com/pkg/errors")
    (synopsis "errors")
    (description "Package errors provides simple error handling primitives.")
    (license license:bsd-2)))

(define-public go-github-com-evanphx-json-patch
  (package
    (name "go-github-com-evanphx-json-patch")
    (version "4.12.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/evanphx/json-patch")
             (commit (string-append "v" version))))
       (file-name (git-file-name "json-patch" version))
       (sha256
        (base32
         "1z0bmsvzm4nchfbi7h9pdvkfgrnf0fvhn39pgb0q2az8cql58q56"))))
    (build-system go-build-system)
    (inputs
     `(("go-github.com-jessevdk-go-flags" ,go-github.com-jessevdk-go-flags)
       ("go-github-com-pkg-errors" ,go-github-com-pkg-errors)))
    (arguments
     '(#:import-path "github.com/evanphx/json-patch"
       #:unpack-path "github.com/evanphx/json-patch"))
    (home-page "https://github.com/evanphx/json-patch")
    (synopsis "Go jsonpatch library")
    (description "jsonpatch is a library which provides functionality for both applying RFC6902 JSON patches against documents, as well as for calculating & applying RFC7396 JSON merge patches.")
    (license license:bsd-3)))

(define-public go-github-com-go-errors-errors
  (package
    (name "go-github-com-go-errors-errors")
    (version "1.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/go-errors/errors")
             (commit (string-append "v" version))))
       (file-name (git-file-name "errors" version))
       (sha256
        (base32
         "1g9wwirsdddkxlqj6ymmy3dkh7xavkh3ybsvsnvyy4jyf0fw9fw8"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/go-errors/errors"
       #:unpack-path "github.com/go-errors/errors"))
    (home-page "https://github.com/go-errors/errors")
    (synopsis "Package errors adds stacktrace support to errors in go")
    (description "Package errors adds stacktrace support to errors in go. This is particularly useful when you want to understand the state of execution when an error was returned unexpectedly. It provides the type *Error which implements the standard golang error interface, so you can use this library interchangably with code that is expecting a normal error return.")
    (license license:expat)))

;;https://github.com/google/shlex
(define-public go-github-com-google-shlex
  (package
    (name "go-github-com-google-shlex")
    (version "e7afc7fbc51079733e9468cdfd1efcd7d196cd1d")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/google/shlex")
             (commit version)))
       (file-name (git-file-name "shlex" version))
       (sha256
        (base32
         "14z8hqyik910wk2qwnzgz8mjsmiamxa0pj55ahbv0jx6j3dgvzfm"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/google/shlex"
       #:unpack-path "github.com/google/shlex"))
    (home-page "https://github.com/go-errors/errors")
    (synopsis "go-shlex is a simple lexer for go that supports shell-style quoting,
commenting, and escaping")
    (description "go-shlex is a simple lexer for go that supports shell-style quoting,
commenting, and escaping.")
    (license license:asl2.0)))

(define-public go-github-com-xlab-treeprint
  (package
    (name "go-github-com-xlab-treeprint")
    (version "1.1.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/xlab/treeprint")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "172hcg6316ghvin9cqgidg7kdf960mzbqlrg0gk759pkbqsi3bcy"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/xlab/treeprint"))
    (propagated-inputs
      `(("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)))
    (home-page "https://github.com/xlab/treeprint")
    (synopsis "treeprint")
    (description
      "Package treeprint provides a simple ASCII tree composing tool.")
    (license license:expat)))

(define-public go-github-com-chzyer-logex
  (package
    (name "go-github-com-chzyer-logex")
    (version "1.2.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/chzyer/logex")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "07ksz43a8kvx0hm8qji6kb1xm7fbwmwapcvcq9zpc8v337jggs4g"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/chzyer/logex"
		 #:tests? #f))
    (home-page "https://github.com/chzyer/logex")
    (synopsis "Logex")
    (description
      "An golang log lib, supports tracing and level, wrap by standard log lib")
    (license license:expat)))

(define-public go-github-com-chzyer-readline
  (package
    (name "go-github-com-chzyer-readline")
    (version "0.0.0-20180603132655-2972be24d48e")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/chzyer/readline")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "104q8dazj8yf6b089jjr82fy9h1g80zyyzvp3g8b44a7d8ngjj6r"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/chzyer/readline"
		 #:tests? #f))
    (home-page "https://github.com/chzyer/readline")
    (synopsis "Guide")
    (description
      "Readline is a pure go implementation for GNU-Readline kind library.")
    (license license:expat)))

(define-public go-github-com-chzyer-test
  (package
    (name "go-github-com-chzyer-test")
    (version "0.0.0-20210722231415-061457976a23")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/chzyer/test")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1jjskijacwzz0qxzrbwsglpg5vil7v4xaq8l40r2fhd2icl9hz7a"))))
    (build-system go-build-system)
     (inputs
     `(("go-github-com-chzyer-logex" ,go-github-com-chzyer-logex)))
     (arguments '(#:import-path "github.com/chzyer/test"
		  #:phases (modify-phases %standard-phases (delete 'check))))
    (home-page "https://github.com/chzyer/test")
    (synopsis "test")
    (description #f)
    (license license:expat)))

(define-public go-github-com-google-starlark-go
  (package
    (name "go-github-com-google-starlark-go")
    (version "0.0.0-20211203141949-70c0e40ae128")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/google/starlark-go")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0fjafn5hh09l5bbw1rhjf93q5znrr2dlm545867cgjjipvd0c4mv"))))
    (build-system go-build-system)
    (arguments '(#:unpack-path "go.starlark.net"
		 #:import-path "go.starlark.net/starlark"))
    (propagated-inputs
     `(("go-github-com-golang-protobuf-proto" ,go-github-com-golang-protobuf-proto)
        ("go-golang-org-x-xerrors" ,go-golang-org-x-xerrors)
        ("go-golang-org-x-sys" ,go-golang-org-x-sys)
	("go-github-com-google-go-cmp-cmp" ,go-github-com-google-go-cmp-cmp)
        ("go-github-com-chzyer-test" ,go-github-com-chzyer-test)
        ("go-github-com-chzyer-readline" ,go-github-com-chzyer-readline)
        ("go-github-com-chzyer-logex" ,go-github-com-chzyer-logex)))
    (home-page "https://github.com/google/starlark-go")
    (synopsis "Starlark in Go")
    (description
      "This is the home of the  project.  Starlark in Go is an interpreter for
Starlark, implemented in Go.  Starlark was formerly known as Skylark.  The new
import path for Go packages is @code{\"go.starlark.net/starlark\"}.")
    (license license:bsd-3)))

(define-public go-github-com-google-starlark-go-chunkedfile
  (package
    (name "go-github-com-google-starlark-go-chunkedfile")
    (version "0.0.0-20211203141949-70c0e40ae128")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/google/starlark-go")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0fjafn5hh09l5bbw1rhjf93q5znrr2dlm545867cgjjipvd0c4mv"))))
    (build-system go-build-system)
    (arguments '(#:unpack-path "go.starlark.net"
		 #:import-path "go.starlark.net/internal/chunkedfile"))
    (home-page "https://github.com/google/starlark-go")
    (synopsis "Internal stuff for Starlark in Go")
    (description
      "This is the home of the  project.  Starlark in Go is an interpreter for
Starlark, implemented in Go.  Starlark was formerly known as Skylark.  The new
import path for Go packages is @code{\"go.starlark.net/starlark\"}.")
    (license license:bsd-3)))

(define-public go-github-com-google-starlark-go-compile
  (package
    (name "go-github-com-google-starlark-go-compile")
    (version "0.0.0-20211203141949-70c0e40ae128")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/google/starlark-go")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0fjafn5hh09l5bbw1rhjf93q5znrr2dlm545867cgjjipvd0c4mv"))))
    (build-system go-build-system)
    (arguments '(#:unpack-path "go.starlark.net"
			       #:import-path "go.starlark.net/internal/compile"))
    (inputs
     `(("go-golang-org-x-sys" ,go-golang-org-x-sys)))
    (home-page "https://github.com/google/starlark-go")
    (synopsis "Internal stuff for Starlark in Go")
    (description
      "This is the home of the  project.  Starlark in Go is an interpreter for
Starlark, implemented in Go.  Starlark was formerly known as Skylark.  The new
import path for Go packages is @code{\"go.starlark.net/starlark\"}.")
    (license license:bsd-3)))

(define-public go-github-com-google-starlark-go-spell
  (package
    (name "go-github-com-google-starlark-go-spell")
    (version "0.0.0-20211203141949-70c0e40ae128")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/google/starlark-go")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0fjafn5hh09l5bbw1rhjf93q5znrr2dlm545867cgjjipvd0c4mv"))))
    (build-system go-build-system)
    (arguments '(#:unpack-path "go.starlark.net"
		 #:import-path "go.starlark.net/internal/spell"))
    (home-page "https://github.com/google/starlark-go")
    (synopsis "Internal stuff for Starlark in Go")
    (description
      "This is the home of the  project.  Starlark in Go is an interpreter for
Starlark, implemented in Go.  Starlark was formerly known as Skylark.  The new
import path for Go packages is @code{\"go.starlark.net/starlark\"}.")
    (license license:bsd-3)))

(define-public go-github-com-google-starlark-go-resolve
  (package
    (name "go-github-com-google-starlark-go-resolve")
    (version "0.0.0-20211203141949-70c0e40ae128")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/google/starlark-go")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0fjafn5hh09l5bbw1rhjf93q5znrr2dlm545867cgjjipvd0c4mv"))))
    (build-system go-build-system)
    (arguments '(#:unpack-path "go.starlark.net"
		 #:import-path "go.starlark.net/resolve"))
    (inputs
     `(("go-golang-org-x-sys" ,go-golang-org-x-sys)))
    (home-page "https://github.com/google/starlark-go")
    (synopsis "Internal stuff for Starlark in Go")
    (description
      "This is the home of the  project.  Starlark in Go is an interpreter for
Starlark, implemented in Go.  Starlark was formerly known as Skylark.  The new
import path for Go packages is @code{\"go.starlark.net/starlark\"}.")
    (license license:bsd-3)))

(define-public go-github-com-google-starlark-go-syntax
  (package
    (name "go-github-com-google-starlark-go-syntax")
    (version "0.0.0-20211203141949-70c0e40ae128")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/google/starlark-go")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0fjafn5hh09l5bbw1rhjf93q5znrr2dlm545867cgjjipvd0c4mv"))))
    (build-system go-build-system)
    (arguments '(#:unpack-path "go.starlark.net"
		 #:import-path "go.starlark.net/syntax"))
    (inputs
     `(("go-golang-org-x-sys" ,go-golang-org-x-sys)))
    (home-page "https://github.com/google/starlark-go")
    (synopsis "Internal stuff for Starlark in Go")
    (description
      "This is the home of the  project.  Starlark in Go is an interpreter for
Starlark, implemented in Go.  Starlark was formerly known as Skylark.  The new
import path for Go packages is @code{\"go.starlark.net/starlark\"}.")
    (license license:bsd-3)))

(define-public go-github-com-google-starlark-go-starlarkstruct
  (package
    (name "go-github-com-google-starlark-go-starlarkstruct")
    (version "0.0.0-20211203141949-70c0e40ae128")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/google/starlark-go")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0fjafn5hh09l5bbw1rhjf93q5znrr2dlm545867cgjjipvd0c4mv"))))
    (build-system go-build-system)
    (arguments '(#:unpack-path "go.starlark.net"
		 #:import-path "go.starlark.net/starlarkstruct"))
    (inputs
     `(("go-golang-org-x-sys" ,go-golang-org-x-sys)))
    (home-page "https://github.com/google/starlark-go")
    (synopsis "Internal stuff for Starlark in Go")
    (description
      "This is the home of the  project.  Starlark in Go is an interpreter for
Starlark, implemented in Go.  Starlark was formerly known as Skylark.  The new
import path for Go packages is @code{\"go.starlark.net/starlark\"}.")
    (license license:bsd-3)))

(define-public go-github-com-go-inf-inf
  (package
    (name "go-github-com-go-inf-inf")
    (version "0.9.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/go-inf/inf")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "00k5iqjcp371fllqxncv7jkf80hn1zww92zm78cclbcn4ybigkng"))))
    (build-system go-build-system)
    (arguments '(#:unpack-path "gopkg.in/inf.v0"
		 #:import-path "gopkg.in/inf.v0"))
    (home-page "https://github.com/go-inf/inf")
    (synopsis #f)
    (description
      "Package inf (type inf.Dec) implements \"infinite-precision\" decimal arithmetic.
\"Infinite precision\" describes two characteristics: practically unlimited
precision for decimal number representation and no support for calculating with
any specific fixed precision.  (Although there is no practical limit on
precision, inf.Dec can only represent finite decimals.)")
    (license license:bsd-3)))

(define-public go-github-com-puerkitobio-urlesc
  (package
    (name "go-github-com-puerkitobio-urlesc")
    (version "0.0.0-20170810143723-de5bf2ad4578")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/PuerkitoBio/urlesc")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0n0srpqwbaan1wrhh2b7ysz543pjs1xw2rghvqyffg9l0g8kzgcw"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/PuerkitoBio/urlesc"))
    (home-page "https://github.com/PuerkitoBio/urlesc")
    (synopsis "urlesc")
    (description
      "Package urlesc implements query escaping as per
@url{https://rfc-editor.org/rfc/rfc3986.html,RFC 3986}.  It contains some parts
of the net/url package, modified so as to allow some reserved characters
incorrectly escaped by net/url.  See
@url{https://github.com/golang/go/issues/5684,https://github.com/golang/go/issues/5684}")
    (license license:bsd-3)))

(define-public go-github-com-puerkitobio-purell
  (package
    (name "go-github-com-puerkitobio-purell")
    (version "1.1.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/PuerkitoBio/purell")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0c525frsxmalrn55hzzsxy17ng8avkd40ga0wxfw9haxsdjgqdqy"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/PuerkitoBio/purell"))
    (inputs `(("go-github-com-puerkitobio-urlesc" ,go-github-com-puerkitobio-urlesc)
	      ("go-golang-org-x-net" ,go-golang-org-x-net)
	      ("go-golang-org-x-text" ,go-golang-org-x-text)))
    (home-page "https://github.com/PuerkitoBio/purell")
    (synopsis "Purell")
    (description
      "Package purell offers URL normalization as described on the wikipedia page:
@url{http://en.wikipedia.org/wiki/URL_normalization,http://en.wikipedia.org/wiki/URL_normalization}")
    (license license:bsd-3)))

(define-public go-github-com-mailru-easyjson
  (package
    (name "go-github-com-mailru-easyjson")
    (version "0.7.7")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/mailru/easyjson")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0clifkvvy8f45rv3cdyv58dglzagyvfcqb63wl6rij30c5j2pzc1"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/mailru/easyjson"))
    (propagated-inputs
      `(("go-github-com-josharian-intern" ,go-github-com-josharian-intern)))
    (home-page "https://github.com/mailru/easyjson")
    (synopsis "easyjson")
    (description
      "Package easyjson contains marshaler/unmarshaler interfaces and helper functions.")
    (license license:expat)))

(define-public go-github-com-josharian-intern
  (package
    (name "go-github-com-josharian-intern")
    (version "1.0.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/josharian/intern")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1za48ppvwd5vg8vv25ldmwz1biwpb3p6qhf8vazhsfdg9m07951c"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/josharian/intern"))
    (home-page "https://github.com/josharian/intern")
    (synopsis #f)
    (description
      "Package intern interns strings.  Interning is best effort only.  Interned
strings may be removed automatically at any time without notification.  All
functions may be called concurrently with themselves and each other.")
    (license license:expat)))

(define-public go-github-com-mailru-easyjson
  (package
    (name "go-github-com-mailru-easyjson")
    (version "0.7.7")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/mailru/easyjson")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0clifkvvy8f45rv3cdyv58dglzagyvfcqb63wl6rij30c5j2pzc1"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/mailru/easyjson"))
    (propagated-inputs
      `(("go-github-com-josharian-intern" ,go-github-com-josharian-intern)))
    (home-page "https://github.com/mailru/easyjson")
    (synopsis "easyjson")
    (description
      "Package easyjson contains marshaler/unmarshaler interfaces and helper functions.")
    (license license:expat)))

(define-public go-github-com-niemeyer-pretty
  (package
    (name "go-github-com-niemeyer-pretty")
    (version "0.0.0-20200227124842-a10e7caefd8e")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/niemeyer/pretty")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1jmazh4xzaa3v6g46hz60q2z7nmqs9l9cxdzmmscn3kbcs2znq4v"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/niemeyer/pretty"
		 #:phases (modify-phases %standard-phases (delete 'check))))
    (propagated-inputs `(("go-github-com-kr-text" ,go-github-com-kr-text)))
    (home-page "https://github.com/niemeyer/pretty")
    (synopsis #f)
    (description
      "Package pretty provides pretty-printing for Go values.  This is useful during
debugging, to avoid wrapping long output lines in the terminal.")
    (license license:expat)))

(define-public go-github-com-google-go-cmp
  (package
    (name "go-github-com-google-go-cmp")
    (version "0.5.6")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/google/go-cmp")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0lrb0pacv5iy3m6fn1qb3nv7zwimfhpzqq8f6hwpwx88cx3g6p1s"))))
    (build-system go-build-system)
    (arguments '(#:unpack-path "github.com/google/go-cmp"
		 #:import-path "github.com/google/go-cmp/cmp"))
    (propagated-inputs `(("go-golang-org-x-xerrors" ,go-golang-org-x-xerrors)))
    (home-page "https://github.com/google/go-cmp")
    (synopsis "Package for equality of Go values")
    (description
      "This package is intended to be a more powerful and safer alternative to
@code{reflect.DeepEqual} for comparing whether two values are semantically
equal.")
    (license license:bsd-3)))

(define-public go-github-com-shurcool-go
  (package
    (name "go-github-com-shurcool-go")
    (version "0.0.0-20200502201357-93f07166e636")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/shurcooL/go")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0wgwlhsgx1c2v650xvf099hgrd4av18gfb0kha09klmsh0p0hc5r"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/shurcooL/go"))
    (home-page "https://github.com/shurcooL/go")
    (synopsis "go")
    (description "Common Go code.")
    (license license:expat)))

(define-public go-github-com-shurcool-go-goon
  (package
    (name "go-github-com-shurcool-go-goon")
    (version "0.0.0-20210110234559-7585751d9a17")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/shurcooL/go-goon")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1c0gkv255kjbbcx3ab26driihnq685vp08axrp5ls8vq7g67rrwl"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/shurcooL/go-goon"))
    (home-page "https://github.com/shurcooL/go-goon")
    (synopsis "goon")
    (description
      "Package goon is a deep pretty printer with Go-like notation.  It implements the
goon specification.")
    (license license:expat)))

(define-public go-github-com-sourcegraph-go-diff
  (package
    (name "go-github-com-sourcegraph-go-diff")
    (version "0.6.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/sourcegraph/go-diff")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0ic58wi4cac61kh5sasn9iylcbzbqawlzva964rk0y0nifsyjcmc"))))
    (build-system go-build-system)
    (arguments '(#:unpack-path "github.com/sourcegraph/go-diff"
		 #:import-path "github.com/sourcegraph/go-diff/diff"))
    (propagated-inputs
      `(("go-github-com-google-go-cmp" ,go-github-com-google-go-cmp)))
    (home-page "https://github.com/sourcegraph/go-diff")
    (synopsis "go-diff")
    (description "Diff parser and printer for Go.")
    (license license:expat)))

(define-public go-github-com-go-openapi-swag
  (package
    (name "go-github-com-go-openapi-swag")
    (version "0.19.15")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/go-openapi/swag")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0fyz1wclcc776qwh6qnnajgfa3l8rwp3y6dzyrfb8cfnc3j0jqim"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/go-openapi/swag"
		 #:phases (modify-phases %standard-phases (delete 'check))))
    (propagated-inputs
      `(("go-github-com-sourcegraph-go-diff"
         ,go-github-com-sourcegraph-go-diff)
        ("go-golang-org-x-lint" ,go-golang-org-x-lint)
        ("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
        ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
        ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
        ("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
        ("go-github-com-niemeyer-pretty" ,go-github-com-niemeyer-pretty)
        ("go-github-com-mailru-easyjson" ,go-github-com-mailru-easyjson)
        ("go-github-com-kr-text" ,go-github-com-kr-text)
        ("go-github-com-davecgh-go-spew" ,go-github-com-davecgh-go-spew)))
    (home-page "https://github.com/go-openapi/swag")
    (synopsis "Swag")
    (description
      "Package swag contains a bunch of helper functions for go-openapi and go-swagger
projects.")
    (license license:asl2.0)))

(define-public go-github-com-go-openapi-jsonpointer
  (package
    (name "go-github-com-go-openapi-jsonpointer")
    (version "0.19.5")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/go-openapi/jsonpointer")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0azic9nfwywlz4qxvacyi4g668fbbrkcyv15bag02yfcsi8szg5c"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/go-openapi/jsonpointer"))
    (propagated-inputs
      `(("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
        ("go-github-com-mailru-easyjson" ,go-github-com-mailru-easyjson)
        ("go-github-com-go-openapi-swag" ,go-github-com-go-openapi-swag)))
    (home-page "https://github.com/go-openapi/jsonpointer")
    (synopsis "gojsonpointer")
    (description
      "@url{https://raw.githubusercontent.com/go-openapi/jsonpointer/master/LICENSE,(img
(@ (src http://img.shields.io/badge/license-Apache%20v2-orange.svg) (alt
license)))} @url{http://godoc.org/github.com/go-openapi/jsonpointer,(img (@ (src
https://godoc.org/github.com/go-openapi/jsonpointer?status.svg=) (alt GoDoc)))}
An implementation of JSON Pointer - Go language")
    (license license:asl2.0)))

(define-public go-github-com-go-openapi-jsonreference
  (package
    (name "go-github-com-go-openapi-jsonreference")
    (version "0.19.6")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/go-openapi/jsonreference")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1b4xg5ghzlzd6ricc3jwmlp71hxz1mgg54mgywzzqwyzvpbwn7n9"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/go-openapi/jsonreference"))
    (propagated-inputs
     `(("go-golang-org-x-net" ,go-golang-org-x-net)
       ("go-golang-org-x-text" ,go-golang-org-x-text)
       ("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
       ("go-github-com-go-openapi-jsonpointer"
        ,go-github-com-go-openapi-jsonpointer)
       ("go-github-com-puerkitobio-urlesc" ,go-github-com-puerkitobio-urlesc)
       ("go-github-com-puerkitobio-purell"
        ,go-github-com-puerkitobio-purell)))
    (home-page "https://github.com/go-openapi/jsonreference")
    (synopsis "gojsonreference")
    (description
      "@url{https://raw.githubusercontent.com/go-openapi/jsonreference/master/LICENSE,(img
(@ (src http://img.shields.io/badge/license-Apache%20v2-orange.svg) (alt
license)))} @url{http://godoc.org/github.com/go-openapi/jsonreference,(img (@
(src https://godoc.org/github.com/go-openapi/jsonreference?status.svg=) (alt
GoDoc)))} An implementation of JSON Reference - Go language")
    (license license:asl2.0)))

(define-public go-github-com-kubernetes-kube-openapi-validation-spec
  (package
    (name "go-github-com-kubernetes-kube-openapi-validation-spec")
    (version "0.0.0-20220104150652-0d48a347b383")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/kubernetes/kube-openapi")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0vnz8g9zv4n2xqmp3vzcdhqr5s07i719mimnxp16f53267376nna"))))
    (build-system go-build-system)
    (arguments '(#:unpack-path "k8s.io/kube-openapi"
			       #:import-path "k8s.io/kube-openapi/pkg/validation/spec"))
    (inputs `(("go-github-com-go-openapi-jsonreference" ,go-github-com-go-openapi-jsonreference)))
    (home-page "https://github.com/kubernetes/kube-openapi")
    (synopsis "Kube OpenAPI")
    (description
      "This repo is the home for Kubernetes OpenAPI discovery spec generation.  The
goal is to support a subset of OpenAPI features to satisfy kubernetes use-cases
but implement that subset with little to no assumption about the structure of
the code or routes.  Thus, there should be no kubernetes specific code in this
repo.")
    (license license:asl2.0)))

(define-public go-github-com-kubernetes-kube-openapi-validation-errors
  (package
    (name "go-github-com-kubernetes-kube-openapi-validation-errors")
    (version "0.0.0-20220104150652-0d48a347b383")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/kubernetes/kube-openapi")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0vnz8g9zv4n2xqmp3vzcdhqr5s07i719mimnxp16f53267376nna"))))
    (build-system go-build-system)
    (arguments '(#:unpack-path "k8s.io/kube-openapi"
		 #:import-path "k8s.io/kube-openapi/pkg/validation/errors"
		 #:tests? #f))
    (home-page "https://github.com/kubernetes/kube-openapi")
    (synopsis "Kube OpenAPI")
    (description
      "This repo is the home for Kubernetes OpenAPI discovery spec generation.  The
goal is to support a subset of OpenAPI features to satisfy kubernetes use-cases
but implement that subset with little to no assumption about the structure of
the code or routes.  Thus, there should be no kubernetes specific code in this
repo.")
    (license license:asl2.0)))

(define-public go-github-com-kubernetes-kube-openapi-validation-validate
  (package
    (name "go-github-com-kubernetes-kube-openapi-validation-validate")
    (version "0.0.0-20220104150652-0d48a347b383")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/kubernetes/kube-openapi")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0vnz8g9zv4n2xqmp3vzcdhqr5s07i719mimnxp16f53267376nna"))))
    (build-system go-build-system)
    (arguments '(#:unpack-path "k8s.io/kube-openapi"
		 #:import-path "k8s.io/kube-openapi/pkg/validation/validate"))
    (inputs `(("go-github-com-asaskevich-govalidator" ,go-github-com-asaskevich-govalidator)
	      ("go-github-com-mitchellh-mapstructure" ,go-github-com-mitchellh-mapstructure)
	      ("go-github-com-go-openapi-jsonreference" ,go-github-com-go-openapi-jsonreference)
	      ("go-github-com-go-openapi-swag" ,go-github-com-go-openapi-swag)
	      ("go-github-com-kubernetes-utils-net" ,go-github-com-kubernetes-utils-net)
	      ("go-github-com-kubernetes-utils-internal-third-party-forked-net" ,go-github-com-kubernetes-utils-internal-third-party-forked-net)))
    (home-page "https://github.com/kubernetes/kube-openapi")
    (synopsis "Kube OpenAPI")
    (description
      "This repo is the home for Kubernetes OpenAPI discovery spec generation.  The
goal is to support a subset of OpenAPI features to satisfy kubernetes use-cases
but implement that subset with little to no assumption about the structure of
the code or routes.  Thus, there should be no kubernetes specific code in this
repo.")
    (license license:asl2.0)))


(define-public go-github-com-kubernetes-kube-openapi-validation-strfmt
  (package
    (name "go-github-com-kubernetes-kube-openapi-validation-strfmt")
    (version "0.0.0-20220104150652-0d48a347b383")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/kubernetes/kube-openapi")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0vnz8g9zv4n2xqmp3vzcdhqr5s07i719mimnxp16f53267376nna"))))
    (build-system go-build-system)
    (inputs `(("go-github-com-asaskevich-govalidator" ,go-github-com-asaskevich-govalidator)
	      ("go-github-com-mitchellh-mapstructure" ,go-github-com-mitchellh-mapstructure)
	      ("go-github-com-kubernetes-utils-net" ,go-github-com-kubernetes-utils-net)
	      ("go-github-com-kubernetes-utils-internal-third-party-forked-net" ,go-github-com-kubernetes-utils-internal-third-party-forked-net)))
    (arguments '(#:unpack-path "k8s.io/kube-openapi"
		 #:import-path "k8s.io/kube-openapi/pkg/validation/strfmt"
		 #:tests? #f))
    (home-page "https://github.com/kubernetes/kube-openapi")
    (synopsis "Kube OpenAPI")
    (description
      "This repo is the home for Kubernetes OpenAPI discovery spec generation.  The
goal is to support a subset of OpenAPI features to satisfy kubernetes use-cases
but implement that subset with little to no assumption about the structure of
the code or routes.  Thus, there should be no kubernetes specific code in this
repo.")
    (license license:asl2.0)))

(define-public go-github-com-mitchellh-mapstructure
  (package
    (name "go-github-com-mitchellh-mapstructure")
    (version "1.4.3")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/mitchellh/mapstructure")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0crp7zd5qlvka5pyr42i16ag4dh1swdlzw6pc67i441b33yqbnys"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/mitchellh/mapstructure"))
    (home-page "https://github.com/mitchellh/mapstructure")
    (synopsis "mapstructure")
    (description
      "Package mapstructure exposes functionality to convert one arbitrary Go type into
another, typically to convert a map[string]interface{} into a native Go
structure.")
    (license license:expat)))

(define-public go-github-com-asaskevich-govalidator
  (package
    (name "go-github-com-asaskevich-govalidator")
    (version "0.0.0-20210307081110-f21760c49a8d")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/asaskevich/govalidator")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0aab1pym5c6di8vidynp6ly5j4kcqv6lp2737gw0a07zng0nn8lw"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/asaskevich/govalidator"
		 #:phases (modify-phases %standard-phases (delete 'check))))
    (home-page "https://github.com/asaskevich/govalidator")
    (synopsis "govalidator")
    (description
      "Package govalidator is package of validators and sanitizers for strings, structs
and collections.")
    (license license:expat)))

(define-public go-github-com-kubernetes-utils-net
  (package
    (name "go-github-com-kubernetes-utils-net")
    (version "0.0.0-20211208161948-7d6a63dca704")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/kubernetes/utils")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "05w6xsma7n4kbxcdmncdlkvm3lw3biy5cg7gifn6fsh6w0r40vbg"))))
    (build-system go-build-system)
    (arguments '(#:unpack-path "k8s.io/utils"
		 #:import-path "k8s.io/utils/net"))
    (home-page "https://github.com/kubernetes/utils")
    (synopsis #f)
    (description #f)
    (license #f)))

(define-public go-github-com-kubernetes-utils-internal-third-party-forked-net
  (package
    (name "go-github-com-kubernetes-utils-internal-third-party-forked-net")
    (version "0.0.0-20211208161948-7d6a63dca704")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/kubernetes/utils")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "05w6xsma7n4kbxcdmncdlkvm3lw3biy5cg7gifn6fsh6w0r40vbg"))))
    (build-system go-build-system)
    (arguments '(#:unpack-path "k8s.io/utils"
		 #:import-path "k8s.io/utils/internal/third_party/forked/golang/net"
		 #:tests? #f))
    (home-page "https://github.com/kubernetes/utils")
    (synopsis #f)
    (description #f)
    (license #f)))

(define-public go-github-com-kubernetes-sigs-yaml
  (package
    (name "go-github-com-kubernetes-sigs-yaml")
    (version "1.3.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/kubernetes-sigs/yaml")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0qxs0ppqwqrfqs4aywyn1h28xh1qlj5ds4drmygaz1plrxj02dqn"))))
    (build-system go-build-system)
    (arguments '(#:import-path "sigs.k8s.io/yaml"
		 #:unpack-path "sigs.k8s.io/yaml"))
    (propagated-inputs
      `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
        ("go-github-com-davecgh-go-spew" ,go-github-com-davecgh-go-spew)))
    (home-page "https://github.com/kubernetes-sigs/yaml")
    (synopsis "YAML marshaling and unmarshaling support for Go")
    (description
      "This package provides a wrapper around
@url{https://github.com/go-yaml/yaml,go-yaml} designed to enable a better way of
handling YAML when marshaling to and from structs.")
    (license #f)))

(define-public kustomize
  (package
    (name "kustomize")
    (version "4.4.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kubernetes-sigs/kustomize")
             (commit (string-append "kustomize/v" version))))
       (file-name (git-file-name "kustomize" version))
       (sha256
        (base32
         "02yj7d4fvxjskxn6kh95b2gf1is00zzss05x413cpsazinn55bl2"))))
    (build-system go-build-system)
    (inputs
     `(("node" ,node)
       ("python" ,python)
       ("go-github-com-google-starlark-go" ,go-github-com-google-starlark-go)
       ("go-github-com-google-starlark-go-chunkedfile" ,go-github-com-google-starlark-go-chunkedfile)
       ("go-github-com-google-starlark-go-spell" ,go-github-com-google-starlark-go-spell)
       ("go-github-com-google-starlark-go-compile" ,go-github-com-google-starlark-go-compile)
       ("go-github-com-google-starlark-go-resolve" ,go-github-com-google-starlark-go-resolve)
       ("go-github-com-google-starlark-go-syntax" ,go-github-com-google-starlark-go-syntax)
       ("go-github-com-google-starlark-go-starlarkstruct" ,go-github-com-google-starlark-go-starlarkstruct)
       ("go-github-com-go-inf-inf" ,go-github-com-go-inf-inf)
       ("go-github-com-kubernetes-kube-openapi-validation-spec" ,go-github-com-kubernetes-kube-openapi-validation-spec)
       ("go-github-com-kubernetes-kube-openapi-validation-strfmt" ,go-github-com-kubernetes-kube-openapi-validation-strfmt)
       ("go-github-com-kubernetes-kube-openapi-validation-errors" ,go-github-com-kubernetes-kube-openapi-validation-errors)
       ("go-github-com-kubernetes-kube-openapi-validation-validate" ,go-github-com-kubernetes-kube-openapi-validation-validate)
       ("go-github-com-go-openapi-jsonreference" ,go-github-com-go-openapi-jsonreference)
       ("go-github-com-go-openapi-swag" ,go-github-com-go-openapi-swag)
       ("go-github-com-evanphx-json-patch" ,go-github-com-evanphx-json-patch)
       ("go-github-com-monochromegane-go-gitignore" ,go-github-com-monochromegane-go-gitignore)
       ("go-github-com-xlab-treeprint" ,go-github-com-xlab-treeprint)
       ("go-github-com-google-shlex" ,go-github-com-google-shlex)
       ("go-github-com-go-errors-errors" ,go-github-com-go-errors-errors)
       ("go-github-com-pkg-errors" ,go-github-com-pkg-errors)
       ("go-github-com-davecgh-go-spew" ,go-github-com-davecgh-go-spew)
       ("go-github-com-spf13-pflag" ,go-github-com-spf13-pflag)
       ("go-github-com-spf13-cobra" ,go-github-com-spf13-cobra)
       ("go-github-com-olekukonko-tablewriter" ,go-github-com-olekukonko-tablewriter)
       ("go-github-com-imdario-mergo" ,go-github-com-imdario-mergo)
       ("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
       ("go-github-com-asaskevich-govalidator" ,go-github-com-asaskevich-govalidator)
       ("go-github-com-mitchellh-mapstructure" ,go-github-com-mitchellh-mapstructure)
       ("go-github-com-kubernetes-utils-net" ,go-github-com-kubernetes-utils-net)
       ("go-github-com-kubernetes-utils-internal-third-party-forked-net" ,go-github-com-kubernetes-utils-internal-third-party-forked-net)
       ("go-github-com-kubernetes-sigs-yaml" ,go-github-com-kubernetes-sigs-yaml)))
    (arguments
     '(#:import-path "sigs.k8s.io/kustomize/kustomize"
       #:unpack-path "sigs.k8s.io/kustomize"
       #:install-source? #f))
    (home-page "https://kustomize.sigs.k8s.io/")
    (synopsis "kustomize lets you customize raw, template-free YAML files.")
    (description "kustomize lets you customize raw, template-free YAML files for multiple purposes, leaving the original YAML untouched and usable as is. kustomize targets kubernetes; it understands and can patch kubernetes style API objects. It's like make, in that what it does is declared in a file, and it's like sed, in that it emits edited text.")
    (license license:asl2.0)))
