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

(package! consult-gh
  :recipe (:host github :repo "armindarvish/consult-gh"))

(package! flycheck-eldev)

(package! casual-dired)

(package! cue-mode)
;; Fix segfaults in newer versions
(package! company :pin "b0a522ac5bf8ba3d2f4f22e3aa846a4f82978a16")
(package! corfu :pin "35cd5a0f3cba89766072e3e933d1fe2ee02f2289")
