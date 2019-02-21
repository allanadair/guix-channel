(define-module (allanadair emacs)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system emacs)
  #:use-module (guix download)
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
    (license license:gpl3)))

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
    (license license:expat)))

(define-public emacs-plantuml-mode
  (package
   (name "emacs-plantuml-mode")
   (version "20180816.1012")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://melpa.org/packages/plantuml-mode-"
           version
           ".el"))
     (sha256
      (base32
       "02d47rrcvm5f7x55xv1bm8dz34xrvxf25k6msqj3b1d8dgcaswzi"))))
   (build-system emacs-build-system)
   (home-page "unspecified")
   (synopsis "Major mode for PlantUML")
   (description
    "A major mode for plantuml, see: http://plantuml.sourceforge.net/
Plantuml is an open-source tool in java that allows to quickly write :
    - sequence diagram,
    - use case diagram,
    - class diagram,
    - activity diagram,
    - component diagram,
    - state diagram
    - object diagram
")
   (license license:gpl3)))

(define-public emacs-org-static-blog
  (package
   (name "emacs-org-static-blog")
   (version "20180528.648")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://melpa.org/packages/org-static-blog-"
           version
           ".el"))
     (sha256
      (base32
       "0wpn82lzr8nv998sjsb9wi4fizbx7hzsaxm6nssjy75pagn3s296"))))
   (build-system emacs-build-system)
   (home-page
    "https://github.com/bastibe/org-static-blog")
   (synopsis
    "a simple org-mode based static blog generator")
   (description
    "Static blog generators are a dime a dozen. This is one more, which
focuses on being simple. All files are simple org-mode files in a
directory. The only requirement is that every org file must have a
#+TITLE and a #+DATE, and optionally, #+FILETAGS.

This file is also available from marmalade and melpa-stable.

Set up your blog by customizing org-static-blog's parameters, then
call M-x org-static-blog-publish to render the whole blog or
M-x org-static-blog-publish-file filename.org to render only only
the file filename.org.

Above all, I tried to make org-static-blog as simple as possible.
There are no magic tricks, and all of the source code is meant to
be easy to read, understand and modify.

If you have questions, if you find bugs, or if you would like to
contribute something to org-static-blog, please open an issue or
pull request on Github.

Finally, I would like to remind you that I am developing this
project for free, and in my spare time. While I try to be as
accomodating as possible, I can not guarantee a timely response to
issues. Publishing Open Source Software on Github does not imply an
obligation to *fix your problem right now*. Please be civil.
")
   (license license:bsd-3)))

