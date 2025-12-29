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

;; Prefer donwloading tars instead of cloning repos with git.
(setq straight-vc-use-snapshot-installation t)

(package! bats-mode)
(package! bazel)
(package! caddyfile-mode)
(package! consult-denote)
(package! cue-mode)
(package! denote)
(package! eat)
(package! evil-escape :disable t) ;; Disable evil-escape since I never use it anyway
(package! fish-mode)
(package! flycheck-eldev)
(package! font-lock-studio)
(package! git-link)
(package! ipcalc)
(package! jq-mode)
(package! jsonnet-mode)
(package! kubedoc)
(package! literate-calc-mode)
(package! nftables-mode)
(package! protobuf-mode :recipe (:pre-build ("git" "submodule" "update")))
(package! rego-mode)
(package! ssh-config-mode)
(package! suggest)
(package! systemd)
(package! vc-jj)
