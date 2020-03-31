;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2013, 2015 Andreas Enge <andreas@enge.fr>
;;; Copyright © 2013, 2014, 2015, 2016, 2017, 2018, 2019 Ludovic Courtès <ludo@gnu.org>
;;; Copyright © 2014, 2015, 2016, 2017, 2018, 2019 Mark H Weaver <mhw@netris.org>
;;; Copyright © 2015 Sou Bunnbu <iyzsong@gmail.com>
;;; Copyright © 2016, 2017, 2018, 2019 Efraim Flashner <efraim@flashner.co.il>
;;; Copyright © 2016 Alex Griffin <a@ajgrf.com>
;;; Copyright © 2017 Clément Lassieur <clement@lassieur.org>
;;; Copyright © 2017 ng0 <ng0@n0.is>
;;; Copyright © 2017, 2018 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2018 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2019 Ivan Petkov <ivanppetkov@gmail.com>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (allanadair firefox)
  #:use-module ((srfi srfi-1) #:hide (zip))
  #:use-module (ice-9 match)
  #:use-module (gnu packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix hg-download)
  #:use-module (guix gexp)
  #:use-module (guix store)
  #:use-module (guix monads)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cargo)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages libcanberra)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages kerberos)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages libreoffice)  ;for hunspell
  #:use-module (gnu packages image)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages node)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages assembly)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages sqlite))



(define %icecat-build-id "20191204000000") ;must be of the form YYYYMMDDhhmmss



(define-public firefox
  (package
    (name "firefox")
    (version "73.0.1")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://ftp.mozilla.org/pub/firefox/releases/"
            version "/source/"
            "firefox-" version ".source.tar.xz"))
      (sha256
       (base32
        "1ln3w049m2bhhalifc1mclggbdpm7grizkh02z4hz9jdwy052hak"))))
    (build-system gnu-build-system)
    (inputs
     `(("alsa-lib" ,alsa-lib)
       ("bzip2" ,bzip2)
       ("cups" ,cups)
       ("dbus-glib" ,dbus-glib)
       ("gdk-pixbuf" ,gdk-pixbuf)
       ("glib" ,glib)
       ("gtk+" ,gtk+)
       ("gtk+-2" ,gtk+-2)
       ("graphite2" ,graphite2)
       ("pango" ,pango)
       ("freetype" ,freetype)
       ("harfbuzz" ,harfbuzz)
       ("libcanberra" ,libcanberra)
       ("libgnome" ,libgnome)
       ("libjpeg-turbo" ,libjpeg-turbo)
       ("libogg" ,libogg)
       ;; ("libtheora" ,libtheora) ; wants theora-1.2, not yet released
       ("libvorbis" ,libvorbis)
       ("libxft" ,libxft)
       ("libevent" ,libevent)
       ("libxinerama" ,libxinerama)
       ("libxscrnsaver" ,libxscrnsaver)
       ("libxcomposite" ,libxcomposite)
       ("libxt" ,libxt)
       ("libffi" ,libffi)
       ("ffmpeg" ,ffmpeg)
       ("libvpx" ,libvpx-1.7)
       ("icu4c" ,icu4c)
       ("pixman" ,pixman)
       ("pulseaudio" ,pulseaudio)
       ("mesa" ,mesa)
       ("mit-krb5" ,mit-krb5)
       ;; See <https://bugs.gnu.org/32833>
       ;;   and related comments in the 'remove-bundled-libraries' phase.
       ;; UNBUNDLE-ME! ("nspr" ,nspr)
       ;; UNBUNDLE-ME! ("nss" ,nss)
       ("sqlite" ,sqlite)
       ("startup-notification" ,startup-notification)
       ("unzip" ,unzip)
       ("zip" ,zip)
       ("zlib" ,zlib)))
    (native-inputs
     ;; The following patches are specific to the Guix packaging of IceCat,
     ;; and therefore we prefer to leave them out of 'source', which should be
     ;; a tarball suitable for compilation on any system that IceCat supports.
     ;; (Bug fixes and security fixes, however, should go in 'source').
     `(;; XXX TODO: Adapt these patches to IceCat 68.
       ;; ("icecat-avoid-bundled-libraries.patch"
       ;;  ,(search-patch "icecat-avoid-bundled-libraries.patch"))
       ;; ("icecat-use-system-graphite2+harfbuzz.patch"
       ;;  ,(search-patch "icecat-use-system-graphite2+harfbuzz.patch"))
       ;; ("icecat-use-system-media-libs.patch"
       ;;  ,(search-patch "icecat-use-system-media-libs.patch"))

       ("patch" ,(canonical-package patch))

       ("rust" ,rust-1.39)
       ("cargo" ,rust-1.39 "cargo")
       ("rust-cbindgen" ,rust-cbindgen)
       ("llvm" ,llvm)
       ("clang" ,clang)
       ("perl" ,perl)
       ("node" ,node)
       ("python" ,python)
       ("python-2" ,python-2)
       ("python2-pysqlite" ,python2-pysqlite)
       ("yasm" ,yasm)
       ("nasm" ,nasm)  ; XXX FIXME: only needed on x86_64 and i686
       ("pkg-config" ,pkg-config)
       ("autoconf" ,autoconf-2.13)
       ("which" ,which)))
    (arguments
     `(#:tests? #f          ; no check target
       #:out-of-source? #t  ; must be built outside of the source directory

       ;; XXX: There are RUNPATH issues such as
       ;; $prefix/lib/icecat-31.6.0/plugin-container NEEDing libmozalloc.so,
       ;; which is not in its RUNPATH, but they appear to be harmless in
       ;; practice somehow.  See <http://hydra.gnu.org/build/378133>.
       #:validate-runpath? #f

       #:configure-flags `("--enable-default-toolkit=cairo-gtk3"

                           "--with-distribution-id=org.gnu"

                           ;; Do not require addons in the global app
                           ;; directory to be signed by Mozilla.
                           "--with-unsigned-addon-scopes=app"

                           "--enable-startup-notification"
                           "--enable-pulseaudio"

                           "--disable-tests"
                           "--disable-updater"
                           "--disable-crashreporter"
                           "--disable-eme"
                           "--disable-gconf"

                           ;; Building with debugging symbols takes ~5GiB, so
                           ;; disable it.
                           "--disable-debug"
                           "--disable-debug-symbols"

                           ;; Clang is needed to build Stylo, Mozilla's new
                           ;; CSS engine.  We must specify the clang paths
                           ;; manually, because otherwise the Mozilla build
                           ;; system looks in the directories returned by
                           ;; llvm-config --bindir and llvm-config --libdir,
                           ;; which return paths in the llvm package where
                           ;; clang is not found.
                           ,(string-append "--with-clang-path="
                                           (assoc-ref %build-inputs "clang")
                                           "/bin/clang")
                           ,(string-append "--with-libclang-path="
                                           (assoc-ref %build-inputs "clang")
                                           "/lib")

                           ;; Hack to work around missing
                           ;; "unofficial" branding in icecat.
                           "--enable-official-branding"

                           ;; Avoid bundled libraries.
                           "--with-system-zlib"
                           "--with-system-bz2"
                           "--with-system-jpeg"        ; must be libjpeg-turbo
                           ;; UNBUNDLE-ME! "--with-system-libevent"
                           ;; UNBUNDLE-ME! "--with-system-ogg"
                           ;; UNBUNDLE-ME! "--with-system-vorbis"
                           ;; UNBUNDLE-ME! "--with-system-theora" ; wants theora-1.2, not yet released
                           ;; UNBUNDLE-ME! "--with-system-libvpx"
                           "--with-system-icu"
                           
                           ;; See <https://bugs.gnu.org/32833>
                           ;;   and related comments in the
                           ;;   'remove-bundled-libraries' phase below.
                           ;; UNBUNDLE-ME! "--with-system-nspr"
                           ;; UNBUNDLE-ME! "--with-system-nss"
                           
                           ;; UNBUNDLE-ME! "--with-system-harfbuzz"
                           ;; UNBUNDLE-ME! "--with-system-graphite2"
                           "--enable-system-pixman"
                           "--enable-system-ffi")
                           ;; UNBUNDLE-ME! "--enable-system-sqlite"

                           ;; Fails with "--with-system-png won't work because
                           ;; the system's libpng doesn't have APNG support".
                           ;; According to
                           ;; http://sourceforge.net/projects/libpng-apng/ ,
                           ;; "the Animated Portable Network Graphics (APNG)
                           ;; is an unofficial extension of the Portable
                           ;; Network Graphics (PNG) format";
                           ;; we probably do not wish to support it.
                           ;; "--with-system-png"
                           

       #:imported-modules ,%cargo-utils-modules ;for `generate-all-checksums'

       #:modules ((ice-9 ftw)
                  (ice-9 rdelim)
                  (ice-9 match)
                  (srfi srfi-34)
                  (srfi srfi-35)
                  ,@%gnu-build-system-modules)
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'apply-guix-specific-patches
           (lambda* (#:key inputs native-inputs #:allow-other-keys)
             (let ((patch (string-append (assoc-ref (or native-inputs inputs)
                                                    "patch")
                                         "/bin/patch")))
               (for-each (match-lambda
                           ((label . file)
                            (when (and (string-prefix? "icecat-" label)
                                       (string-suffix? ".patch" label))
                              (format #t "applying '~a'...~%" file)
                              (invoke patch "--force" "--no-backup-if-mismatch"
                                      "-p1" "--input" file))))
                         (or native-inputs inputs)))
             #t))
         (add-after 'apply-guix-specific-patches 'remove-bundled-libraries
           (lambda _
             ;; Remove bundled libraries that we don't use, since they may
             ;; contain unpatched security flaws, they waste disk space and
             ;; memory, and may cause confusion.
             (for-each (lambda (file)
                         (format #t "deleting '~a'...~%" file)
                         (delete-file-recursively file))
                       '(;; FIXME: Removing the bundled icu breaks configure.
                         ;;   * The bundled icu headers are used in some places.
                         ;;   * The version number is taken from the bundled copy.
                         ;;"intl/icu"
                         ;;
                         ;; FIXME: A script from the bundled nspr is used.
                         ;;"nsprpub"
                         ;;
                         ;; FIXME: With the update to IceCat 60, using system NSS
                         ;;        broke certificate validation.  See
                         ;;        <https://bugs.gnu.org/32833>.  For now, we use
                         ;;        the bundled NSPR and NSS.  TODO: Investigate,
                         ;;        and try to unbundle these libraries again.
                         ;; UNBUNDLE-ME! "security/nss"
                         ;;
                         ;; TODO: Use more system media libraries.  See:
                         ;; <https://bugzilla.mozilla.org/show_bug.cgi?id=517422>
                         ;;   * libtheora: esr60 wants v1.2, not yet released.
                         ;;   * soundtouch: avoiding the bundled library would
                         ;;     result in some loss of functionality.  There's
                         ;;     also an issue with exception handling
                         ;;     configuration.  It seems that this is needed in
                         ;;     some moz.build:
                         ;;       DEFINES['ST_NO_EXCEPTION_HANDLING'] = 1
                         ;;   * libopus
                         ;;   * speex
                         ;;
                         "modules/freetype2"
                         "modules/zlib"
                         ;; "media/libjpeg"  ; needed for now, because media/libjpeg/moz.build is referenced from config/external/moz.build
                         ;; UNBUNDLE-ME! "ipc/chromium/src/third_party/libevent"
                         ;; UNBUNDLE-ME! "media/libvpx"
                         ;; UNBUNDLE-ME! "media/libogg"
                         ;; UNBUNDLE-ME! "media/libvorbis"
                         ;; UNBUNDLE-ME! "media/libtheora" ; wants theora-1.2, not yet released
                         ;; UNBUNDLE-ME! "media/libtremor"
                         ;; UNBUNDLE-ME! "gfx/harfbuzz"
                         ;; UNBUNDLE-ME! "gfx/graphite2"
                         "js/src/ctypes/libffi"))
                         ;; UNBUNDLE-ME! "db/sqlite3"
                         
             #t))
         (add-after 'remove-bundled-libraries 'link-libxul-with-libraries
           (lambda _
             ;; libxul.so dynamically opens libraries, so here we explicitly
             ;; link them into libxul.so instead.
             ;;
             ;; TODO: It might be preferable to patch in absolute file names in
             ;; calls to dlopen or PR_LoadLibrary, but that didn't seem to
             ;; work.  More investigation is needed.
             (substitute* "toolkit/library/moz.build"
               (("^# This library needs to be last" all)
                (string-append "OS_LIBS += [
    'GL', 'gnome-2', 'canberra', 'Xss', 'cups', 'gssapi_krb5',
    'avcodec', 'avutil', 'pulse' ]\n\n"
                               all)))
             #t))
         (add-after 'link-libxul-with-libraries 'fix-ffmpeg-runtime-linker
           (lambda* (#:key inputs #:allow-other-keys)
             ;; Arrange to load libavcodec.so by its absolute file name.
             (substitute* "dom/media/platforms/ffmpeg/FFmpegRuntimeLinker.cpp"
               (("libavcodec\\.so")
                (string-append (assoc-ref inputs "ffmpeg") "/lib/libavcodec.so")))
             #t))
         (replace 'bootstrap
           (lambda _
             (invoke "sh" "-c" "autoconf old-configure.in > old-configure")
             ;; 'configure' must be newer than 'old-configure.in', or else the
             ;; build system will raise an alarm and abort.
             (invoke "touch" "configure")))
         (add-after 'patch-source-shebangs 'patch-cargo-checksums
           (lambda _
             (use-modules (guix build cargo-utils))
             (let ((null-hash "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"))
               (substitute* '("Cargo.lock" "gfx/wr/Cargo.lock")
                 (("(\"checksum .* = )\".*\"" all name)
                  (string-append name "\"" null-hash "\"")))
               (generate-all-checksums "third_party/rust"))
             #t))
         (add-before 'configure 'augment-CPLUS_INCLUDE_PATH
           (lambda* (#:key build inputs #:allow-other-keys)
             ;; Here, we add additional entries to CPLUS_INCLUDE_PATH, to work
             ;; around a problem that otherwise occurs when attempting to
             ;; build Stylo, which requires Rust and Clang.  Without these
             ;; additional entries, errors occur during the build indicating
             ;; that the <cstddef> and "c++config.h" headers cannot be found.
             ;; Note that the 'build' keyword argument contains the GNU
             ;; triplet, e.g. "x86_64-unknown-linux-gnu".
             (let ((gcc (assoc-ref inputs "gcc")))
               (setenv "CPLUS_INCLUDE_PATH"
                       (string-append gcc "/include/c++" ":"
                                      gcc "/include/c++/" build)))
             #t))
         (replace 'configure
           ;; configure does not work followed by both "SHELL=..." and
           ;; "CONFIG_SHELL=..."; set environment variables instead
           (lambda* (#:key outputs configure-flags #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bash (which "bash"))
                    (abs-srcdir (getcwd))
                    (srcdir (string-append "../" (basename abs-srcdir)))
                    (flags `(,(string-append "--prefix=" out)
                             ;;; XXX
                             ;; ,(string-append "--with-l10n-base="
                             ;;                 abs-srcdir "/l10n")
                             ,@configure-flags)))
               (setenv "SHELL" bash)
               (setenv "CONFIG_SHELL" bash)
               (setenv "AUTOCONF" (which "autoconf")) ; must be autoconf-2.13
               (setenv "CC" "gcc")  ; apparently needed when Stylo is enabled
               (setenv "MOZ_BUILD_DATE" ,%icecat-build-id) ; avoid timestamp
               (mkdir "../build")
               (chdir "../build")
               (format #t "build directory: ~s~%" (getcwd))
               (format #t "configure flags: ~s~%" flags)
               (apply invoke bash
                      (string-append srcdir "/configure")
                      flags))))
         (replace 'build
           ;; The build system often spuriously fails.  See
           ;; <https://bugs.gentoo.org/show_bug.cgi?id=680934>.  To
           ;; work around this, we try the standard 'build' phase up
           ;; to 5 times.
           (lambda args
             (let ((build (assoc-ref %standard-phases 'build)))
               (let retry ((remaining-attempts 5))
                 (if (= remaining-attempts 1)
                     (apply build args)
                     (guard (c ((invoke-error? c)
                                (format #t "~%Retrying build! (~a attempts remaining)~%~%"
                                        (- remaining-attempts 1))
                                (force-output)
                                (retry (- remaining-attempts 1))))
                       (apply build args)))))))
         ;; (add-before 'configure 'install-desktop-entry
         ;;   (lambda* (#:key outputs #:allow-other-keys)
         ;;     ;; Install the '.desktop' file.
         ;;     (let* ((desktop-file "taskcluster/docker/icecat-snap/icecat.desktop")
         ;;            (out          (assoc-ref outputs "out"))
         ;;            (applications (string-append out "/share/applications")))
         ;;       (substitute* desktop-file
         ;;         (("^Exec=icecat")     (string-append "Exec=" out "/bin/icecat"))
         ;;         (("IceCat")           "GNU IceCat")
         ;;         (("Icon=.*")          "Icon=icecat\n")
         ;;         (("NewWindow")        "new-window")
         ;;         (("NewPrivateWindow") "new-private-window"))
         ;;       (install-file desktop-file applications)
         ;;       #t)))
         ;; (add-after 'install-desktop-entry 'install-icons
         ;;   (lambda* (#:key outputs #:allow-other-keys)
         ;;     (let ((out (assoc-ref outputs "out")))
         ;;       (with-directory-excursion "browser/branding/official"
         ;;         (for-each
         ;;          (lambda (file)
         ;;            (let* ((size (string-filter char-numeric? file))
         ;;                   (icons (string-append out "/share/icons/hicolor/"
         ;;                                         size "x" size "/apps")))
         ;;              (mkdir-p icons)
         ;;              (copy-file file (string-append icons "/icecat.png"))))
         ;;          '("default16.png" "default22.png" "default24.png"
         ;;            "default32.png" "default48.png" "content/icon64.png"
         ;;            "mozicon128.png" "default256.png"))
         ;;         #t))))
         ;; This fixes the file chooser crash that happens with GTK 3.
         (add-after 'install 'wrap-program
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (lib (string-append out "/lib"))
                    (gtk (assoc-ref inputs "gtk+"))
                    (gtk-share (string-append gtk "/share"))
                    (pulseaudio (assoc-ref inputs "pulseaudio"))
                    (pulseaudio-lib (string-append pulseaudio "/lib")))
               (wrap-program (car (find-files lib "^firefox$"))
                 `("XDG_DATA_DIRS" prefix (,gtk-share))
                 `("LD_LIBRARY_PATH" prefix (,pulseaudio-lib)))
               #t))))))
    (home-page "https://www.mozilla.org/firefox/")
    (synopsis "Firefox is a free and open-source web browser ")
    (description
     "Mozilla Firefox, or simply Firefox, is a free and open-source web browser developed by the Mozilla Foundation and its subsidiary, Mozilla Corporation.")
    (license license:mpl2.0)     ;and others, see toolkit/content/license.html
    (properties
     `((ftp-directory . "/gnu/gnuzilla")
       (cpe-name . "firefox_esr")
       (cpe-version . ,(first (string-split version #\-)))))))