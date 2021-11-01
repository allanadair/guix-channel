(define-module (allanadair python-vpn-slice)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system python)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz))

(define-public python-vpn-slice
  (package
   (name "python-vpn-slice")
   (version "0.15")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "vpn-slice" version))
     (sha256
      (base32 "0lv3g1bq6ssz6fn6zlzn12dahc4d7nf7kjwxsnb5d7gdrfp36lbx"))))
   (build-system python-build-system)
   (propagated-inputs
    `(("python-dnspython" ,python-dnspython)
      ("python-setproctitle" ,python-setproctitle)))
   (home-page "https://github.com/dlenski/vpn-slice")
   (synopsis "vpnc-script replacement for easy split-tunnel VPN setup")
   (description "vpnc-script replacement for easy split-tunnel VPN setup")
   (license license:gpl3)))

