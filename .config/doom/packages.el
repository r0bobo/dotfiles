;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here, run 'doom sync' on
;; the command line, then restart Emacs for the changes to take effect.
;; Alternatively, use M-x doom/reload.

;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;;(unpin! pinned-package)
;; ...or multiple packages
;;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;;(unpin! t)

(package! jsonnet-mode)

(package! rego-mode)

;; Disable evil-escape since I never use it anyway
(package! evil-escape
  :disable t)

(package! systemd)

(package! bats-mode)

(package! literate-calc-mode)

(package! suggest)

(package! jq-mode)

(package! ssh-config-mode)

(package! kubedoc)

(package! ipcalc)

(package! caddyfile-mode)

(package! nftables-mode)

(package! protobuf-mode
  :recipe (:pre-build ("git" "submodule" "update")))

(package! bazel)

(package! flycheck-eldev)

(package! cue-mode)
