;;; THIS DOES NOT WORK! DO NOT USE!

(define-module (allanadair ms-teams)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages bootstrap) ; glibc-dynamic-linker
  #:use-module (gnu packages elf)
  #:use-module (gnu packages glib) ; glib, dbus
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages xorg) ; libX11, etc.
  #:use-module (gnu packages nss) ; nss, nspr
  #:use-module (gnu packages xml) ; expat
  #:use-module (gnu packages linux) ; alsa-lib
  #:use-module (gnu packages cups)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages base) ; glibc
  #:use-module (gnu packages security-token))

(define-public ms-teams
  (package
    (name "ms-teams")
    (version "1.3.00.30857")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://packages.microsoft.com/repos/ms-teams/"
			    "pool/main/t/teams/teams_" version "_amd64.deb"))
        (sha256
         (base32
          "06r48h1fr2si2g5ng8hsnbcmr70iapnafj21v5bzrzzrigzb2n2h"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (replace 'unpack
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((source (assoc-ref inputs "source")))
               (invoke "ar" "x" source "data.tar.xz")
               (invoke "tar" "xvf" "data.tar.xz"))))
         (replace 'build
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((teams  "usr/share/teams/teams")
                    (desktop "usr/share/applications/teams.desktop")
                    (out              (assoc-ref outputs "out"))
                    (libc             (assoc-ref inputs "libc"))
		    (glib             (assoc-ref inputs "glib"))
		    (glibc            (assoc-ref inputs "glibc"))
		    (libx11           (assoc-ref inputs "libx11"))
		    (libxcb           (assoc-ref inputs "libxcb"))
		    (libxcomposite    (assoc-ref inputs "libxcomposite"))
		    (libxcursor       (assoc-ref inputs "libxcursor"))
		    (libxdamage       (assoc-ref inputs "libxdamage"))
		    (libxext          (assoc-ref inputs "libxext"))
		    (libxfixes        (assoc-ref inputs "libxfixes"))
		    (libxi            (assoc-ref inputs "libxi"))
		    (libxrender       (assoc-ref inputs "libxrender"))
		    (libxtst          (assoc-ref inputs "libxtst"))
		    (libxrandr        (assoc-ref inputs "libxrandr"))
		    (libxscrnsaver    (assoc-ref inputs "libxscrnsaver"))
		    (nss              (assoc-ref inputs "nss"))
		    (nspr             (assoc-ref inputs "nspr"))
		    (dbus             (assoc-ref inputs "dbus"))
		    (cairo            (assoc-ref inputs "cairo"))
		    (gdk-pixbuf       (assoc-ref inputs "gdk-pixbuf"))
		    (gtk+             (assoc-ref inputs "gtk+"))
		    (pango            (assoc-ref inputs "pango"))
		    (atk              (assoc-ref inputs "atk"))
		    (atk-bridge       (assoc-ref inputs "atk-bridge"))
		    (atspi2           (assoc-ref inputs "atspi2"))
		    (expat            (assoc-ref inputs "expat"))
		    (alsa-lib         (assoc-ref inputs "alsa-lib"))
		    (cups             (assoc-ref inputs "cups"))
		    (gcc              (assoc-ref inputs "gcc:lib"))
		    (rpath            (string-append out "/share/teams" ":"
					      glib "/lib" ":"
					      libx11 "/lib" ":"
					      libxcb "/lib" ":"
					      libxcomposite "/lib" ":"
					      libxcursor "/lib" ":"
					      libxdamage "/lib" ":"
					      libxext "/lib" ":"
					      libxfixes "/lib" ":"
					      libxi "/lib" ":"
					      libxrender "/lib" ":"
					      libxtst "/lib" ":"
					      libxrandr "/lib" ":"
					      libxscrnsaver "/lib" ":"
					      nss "/lib/nss" ":"
					      nspr "/lib" ":"
					      dbus "/lib" ":"
					      cairo "/lib" ":"
					      gdk-pixbuf "/lib" ":"
					      gtk+ "/lib" ":"
					      pango "/lib" ":"
					      atk "/lib" ":"
					      atk-bridge "/lib" ":"
					      atspi2 "/lib" ":"
					      expat "/lib" ":"
					      alsa-lib "/lib" ":"
					      cups "/lib" ":"
					      gcc "/lib" ":"
					      glibc "/lib" ":"
					      ))
                    (ld-so     (string-append libc ,(glibc-dynamic-linker))))
	       (invoke "patchelf" "--set-rpath" rpath teams)
               (invoke "patchelf" "--set-interpreter" ld-so teams)
               (substitute* desktop
                 (("/usr") out)))
             #t))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (with-directory-excursion "usr"
                 (install-file "share/teams/teams" (string-append out "/bin"))
                 (install-file "share/applications/teams.desktop"
                               (string-append out "/share/applications"))
		 (install-file "share/pixmaps/teams.png"
                               (string-append out "/share/pixmaps"))
		 (mkdir-p (string-append out "/share/teams"))
		 (copy-recursively "share/teams" (string-append out "/share/teams")))
               #t))))
       #:substitutable? #f
       #:tests? #f))
    (native-inputs
     `(("patchelf" ,patchelf)))
    (propagated-inputs
     `(("glib"   ,glib)
       ("libx11" ,libx11)
       ("libxcb" ,libxcb)
       ("libxcomposite" ,libxcomposite)
       ("libxcursor" ,libxcursor)
       ("libxdamage" ,libxdamage)
       ("libxext" ,libxext)
       ("libxfixes" ,libxfixes)
       ("libxi" ,libxi)
       ("libxrender" ,libxrender)
       ("libxtst" ,libxtst)
       ("libxrandr" ,libxrandr)
       ("libxscrnsaver" ,libxscrnsaver)
       ("nss" ,nss)
       ("nspr" ,nspr)
       ("dbus" ,dbus)
       ("cairo" ,cairo)
       ("gdk-pixbuf" ,gdk-pixbuf)
       ("gtk+" ,gtk+)
       ("pango" ,pango)
       ("atk" ,atk)
       ("atk-bridge" ,at-spi2-atk)
       ("atspi2" ,at-spi2-core)
       ("expat" ,expat)
       ("alsa-lib" ,alsa-lib)
       ("cups" ,cups)
       ("gcc:lib" ,gcc "lib")
       ("glibc" ,glibc)
       ))
    (home-page "https://www.microsoft.com/en-us/microsoft-teams/group-chat-software")
    (synopsis "Microsoft Teams")
    (description "Microsoft Teams")
    (supported-systems '("x86_64-linux"))
    (license #f)))
