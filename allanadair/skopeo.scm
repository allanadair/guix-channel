(define-module (allanadair skopeo)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix download)
  #:use-module (guix build-system go)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages selinux))

(define-public skopeo
  (package
    (name "skopeo")
    (version "0.1.34")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/containers/skopeo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1drbbjqih69nvgynjcz0js0vi6sgsax8565zbrmf8fkbk609c7r3"))))
    (build-system go-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("btrfs-progs" ,btrfs-progs)
       ("eudev" ,eudev)
       ("libassuan" ,libassuan)
       ("libselinux" ,libselinux)
       ("libostree" ,libostree)
       ("lvm2" ,lvm2)
       ("glib" ,glib)
       ("gpgme" ,gpgme)))
    (arguments
     '(#:unpack-path "github.com/containers/skopeo"
       #:import-path "github.com/containers/skopeo/cmd/skopeo"
       #:install-source? #f
       #:tests? #f
       #:phases
       (modify-phases %standard-phases
         (replace 'build
           (lambda* (#:key unpack-path #:allow-other-keys)
             (chdir (string-append "src/" unpack-path))
             ;; TODO: build manpages with 'go-md2man'.
             (invoke "make" "binary-local")))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (invoke "make" "install-binary" "install-completions"
                       (string-append "PREFIX=" out))))))))
    (home-page "https://github.com/containers/skopeo")
    (synopsis "Interact with container images and container image registries")
    (description
     "@command{skopeo} is a command line utility providing various operations
with container images and container image registries.  It can:
@enumerate

@item Copy container images between various containers image stores,
converting them as necessary.

@item Convert a Docker schema 2 or schema 1 container image to an OCI image.

@item Inspect a repository on a container registry without needlessly pulling
the image.

@item Sign and verify container images.

@item Delete container images from a remote container registry.

@end enumerate")
    (license license:asl2.0)))
