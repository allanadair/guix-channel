(define-module (allanadair emacs)
  #:use-module (guix build-system emacs)
  #:use-module (guix download)
  #:use-module (guix licenses)
  #:use-module (guix packages))

(define-public emacs-editorconfig
  (package
    (name "emacs-editorconfig")
    (version "20181115.709")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://melpa.org/packages/editorconfig-"
               version
               ".tar"))
        (sha256
          (base32
            "0b89y956d60a4syhjhzpbb0ny5w0v7v7b418gjz9wgw7fysf3hci"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/editorconfig/editorconfig-emacs#readme")
    (synopsis "EditorConfig Emacs Plugin")
    (description
      "EditorConfig helps developers define and maintain consistent
coding styles between different editors and IDEs.

The EditorConfig project consists of a file format for defining
coding styles and a collection of text editor plugins that enable
editors to read the file format and adhere to defined styles.
EditorConfig files are easily readable and they work nicely with
version control systems.
")
    (license gpl3)))

(define-public emacs-nord-theme
  (package
    (name "emacs-nord-theme")
    (version "20180913.1749")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://melpa.org/packages/nord-theme-"
               version
               ".el"))
        (sha256
          (base32
            "04dk4xryhxinxsv7sm6jikv3yvq3qf7shrmra7iwn1iq435hwfdz"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/arcticicestudio/nord-emacs")
    (synopsis
      "An arctic, north-bluish clean and elegant theme")
    (description
      "Nord is a 16 colorspace theme build to run in GUI- and terminal
mode with support for many third-party syntax- and UI packages.
")
    (license expat)))
