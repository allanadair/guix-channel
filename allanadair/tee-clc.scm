(define-module (allanadair tee-clc)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages java))

(define-public tee-clc
  (package
   (name "tee-clc")
   (version "14.134.0")
   (source (origin
            (method url-fetch)
            (uri (string-append
                  "https://github.com/Microsoft/team-explorer-everywhere/releases/download/"
                  version "/TEE-CLC-" version ".zip"))
            (sha256
             (base32
              "1ivxdpxva1xkv9ng2gf3mksg4kb1vvrjsrpmlc1zyxcll0ip2jxg"))))
   (build-system trivial-build-system)
   (native-inputs
    `(("unzip" ,unzip)))
   (propagated-inputs
    `(("jre" ,icedtea)))
   (arguments
    `(#:modules ((guix build utils))
      #:builder
      (begin
        (use-modules (guix build utils))
	(let* ((out (assoc-ref %outputs "out"))
               (source (assoc-ref %build-inputs "source"))
               (unzip (string-append (assoc-ref %build-inputs "unzip") "/bin/unzip")))
	  (copy-file source (string-append "TEE-CLC-" ,version ".zip"))
	  (invoke unzip (string-append "TEE-CLC-" ,version ".zip"))
	  (copy-recursively (string-append "TEE-CLC-" ,version) (string-append out "/bin"))))))
   (home-page "https://github.com/Microsoft/team-explorer-everywhere")
   (synopsis "Team Explorer Everywhere Cross-platform Command-line Client for Team Foundation Server")
   (description "The CLC for TFS allows you run version control commands from a console/terminal window against a TFS server on any operating system. This tool is for use with Team Foundation Version Control (TFVC), a centralized version control system.")
   (license license:expat)))
