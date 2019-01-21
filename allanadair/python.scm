(define-module (allanadair python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix build-system python)
  #:use-module (guix download)
  #:use-module (gnu packages check)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz))

(define-public python-flake8-import-order
  (package
    (name "python-flake8-import-order")
    (version "0.18")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "flake8-import-order" version))
        (sha256
          (base32
            "1gvcq49xsv98fq7pnw440gl7pcrdmf86ip9km3m5im4isw8cmrcv"))))
    (build-system python-build-system)
    (inputs
     `(("pylama" ,python-pylama)
       ("flake8" ,python-flake8)
       ("pytest" ,python-pytest)))
   (propagated-inputs
    `(("pycodestyle" ,python-pycodestyle)))
    (home-page
      "https://github.com/PyCQA/flake8-import-order")
    (synopsis
      "Flake8 and pylama plugin that checks the ordering of import statements.")
    (description
      "Flake8 and pylama plugin that checks the ordering of import statements.")
    (license license:lgpl3)))

(define-public python2-flake8-import-order
  (package-with-python2 python-flake8-import-order))

(define-public python-pylama
  (package
   (name "python-pylama")
   (version "7.6.5")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "pylama" version))
     (sha256
      (base32
       "0277pr066vg1w8ip6kdava7d5daiv7csixpysb37ss140k222iiv"))))
   (build-system python-build-system)
   (arguments
    `(#:tests? #f)) ; I don't use this package, so don't chase down test dependencies
   (propagated-inputs
    `(("python-mccabe" ,python-mccabe)
      ("python-pycodestyle" ,python-pycodestyle)
      ("python-pydocstyle" ,python-pydocstyle)
      ("python-pyflakes" ,python-pyflakes)))
   (home-page "")
   (synopsis "pylama -- Code audit tool for python")
   (description
    "pylama -- Code audit tool for python")
   (license license:lgpl3)))

(define-public python2-pylama
  (package-with-python2 python-pylama))

(define-public python-pydocstyle
  (package
    (name "python-pydocstyle")
    (version "3.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "pydocstyle" version))
        (sha256
          (base32
            "1m1xv9clkg9lgzyza6dnj359z04vh5g0h49nhzghv7lg81gchhap"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("six" ,python-six)
       ("snowballstemmer" ,python-snowballstemmer)))
    (home-page
      "https://github.com/PyCQA/pydocstyle/")
    (synopsis "Python docstring style checker")
    (description "Python docstring style checker")
    (license license:expat)))
