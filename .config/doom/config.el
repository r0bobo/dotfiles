;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; DOOM
;;  ----------------------------------------------------------------------------
(setopt user-full-name "Dean Lindqvist Todevski"
        user-mail-address "dean.todevski@gmail.com"

        ;; Theme
        doom-font (font-spec :family "Jetbrains Mono" :size 14)
        doom-variable-pitch-font (font-spec :family "Jetbrains Mono" :size 14)
        doom-unicode-font (font-spec :family "Jetbrains Mono" :size 14)
        doom-big-font (font-spec :family "Jetbrains Mono" :size 26)
        doom-theme 'doom-dracula
        fancy-splash-image (concat doom-user-dir "doom-icon.png")
        display-line-numbers-type t

        ;; Keymaps
        doom-localleader-key ","

        ;; Don't overwrite copied text on paste
        evil-kill-on-visual-paste nil

        ;; Disable titlebar and menus
        default-frame-alist '((undecorated . t))

        flymake-indicator-type 'fringes

        delete-by-moving-to-trash t
        magit-delete-by-moving-to-trash t

        ;; Fix clipped bottom row in which-key
        which-key-allow-imprecise-window-fit nil)


(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Add diff option to `save-some-buffers'
;; https://protesilaos.com/codelog/2024-12-11-emacs-diff-save-some-buffers/
(add-to-list
 'save-some-buffers-action-alist
 (list "d"
       (lambda (buffer) (diff-buffer-with-file (buffer-file-name buffer)))
       "show diff between the buffer and its file"))

(add-to-list
 'auto-mode-alist
 '("CODEOWNERS\\'" . gitignore-mode))

(map!
 :n "C-0" #'doom/reset-font-size
 :n "C-+" #'doom/increase-font-size
 :n "C--" #'doom/decrease-font-size)

(map!
 :leader
 :desc "Search in project" "/" #'+default/search-project
 :desc "Doom dashboard" "b h" #'+doom-dashboard/open)

(map!
 :leader
 :prefix "p"
 :desc "Discover projects in search path" "D" #'projectile-discover-projects-in-search-path)

(map!
 :leader
 :prefix "c"
 :desc "Rotate text" "." #'rotate-text
 :desc "Run make target" "m" #'+make/run
 :desc "Run last make target" "M" #'+make/run-last)

(map!
 :leader
 :prefix "o"
 :desc "Kubedoc" "k" #'kubedoc
 :desc "Kubedoc for context" "K" #'kubedoc-for-context
 :desc "Undo tree" "u" #'undo-tree-visualize
 :desc "Font Size" "z" #'+hydra/text-zoom/body)

(map!
 :leader
 :prefix "g o"
 :desc "Browse file or region" "o" #'git-link-dispatch)

(defun jj-list-conflicts ()
  (interactive)
  (let* ((lines (process-lines "jj" "resolve" "--list"))
         (collection (seq-map #'(lambda (s) (car (string-split s))) lines)))
    (find-file
     (completing-read "files: " collection))))

(defun jj-find-file-in-change ()
  (interactive)
  (let* ((lines (process-lines "jj" "diff" "--name-only")))
    (find-file
     (completing-read "files: " lines))))

(map!
 :leader
 :prefix "j"
 :desc "List conflicts" "c" #'jj-list-conflicts
 :desc "Open file in change" "f" #'jj-find-file-in-change)


(map! :map global-map
      :i "C-<tab>" #'dabbrev-completion
      :i "C-TAB" #'dabbrev-completion)

(add-to-list '+lookup-provider-url-alist
             '("Melpa"       "https://melpa.org/#/?q=%s")
             '("go.dev"      "https://pkg.go.dev/search?q=%s"))

;;; File template
(set-file-template! "/kustomization\\.yaml$"
  :trigger "__kustomization.yaml"
  :mode 'yaml-mode)

(add-hook 'help-mode-hook 'visual-line-mode)

;;; Local variables
(setq enable-local-variables t)
(let ((vars
       ;; Safe dir-local variables
       '((lsp-go-use-gofumpt . t)
         (vc-handled-backends . nil)
         (+format-on-save-enabled-modes quote (not ruby-mode typescript-mode))))

      (forms
       ;; Safe dir-local forms
       '((ansible)
         (ansible-doc-mode)
         (electric-indent-mode 0)
         (sh-set-shell "zsh")
         (web-mode-set-engine "go"))))

  (dolist (var vars) (add-to-list 'safe-local-variable-values var))
  (dolist (form forms) (add-to-list 'safe-local-eval-forms form)))

(defvar todevski-project-path
  (thread-last
    (split-string (getenv "PROJECTPATH") ":")
    (seq-filter #'file-exists-p))
  "Project search path")

;; Don't use lsp-formatting for Bazel files.
;; It's not working for some reason.
(defun todevski/+format-with-lsp-toggle-h (orig-fun &rest args)
  ""
  (unless (derived-mode-p 'bazel-mode)
    (apply orig-fun args)))

(advice-add '+format-with-lsp-toggle-h :around #'todevski/+format-with-lsp-toggle-h)

;; Fix yaml
(setopt yaml-indent-offset 2)
(add-hook! (yaml-mode yaml-ts-mode) (doom/set-indent-width 2))
(add-hook! (go-mode go-ts-mode) (setq go-ts-mode-indent-offset 4))

;;; PACKAGES
;;  ----------------------------------------------------------------------------
(use-package doom-modeline
  :config
  (setq doom-modeline-persp-name t))

(use-package ansible
  :init
  (def-project-mode! +ansible-yaml-mode
    :modes '(yaml-mode)
    :add-hooks '(ansible-mode ansible-auto-decrypt-encrypt ansible-doc-mode)
    :match "/\\(main\\|site\\|encrypted\\|\\(\\(roles\\|tasks\\|handlers\\|vars\\|defaults\\|meta\\|group_vars\\|host_vars\\)/.+\\)\\)\\.ya?ml$"))


(use-package ansible-doc
  :init
  (set-popup-rule! "^\\*ansible-doc"
    :height 0.4 :quit t :select t :ttl t)
  :config
  (set-evil-initial-state! '(ansible-doc-module-mode) 'normal))


(use-package browse-at-remote
  :config
  (add-to-list 'browse-at-remote-remote-type-regexps '("^git\\.todevski\\.com$" . "gitlab")))

(use-package caddyfile-mode
  :mode (("Corefile\\'" . caddyfile-mode)
         ("\\.caddyfile\\'" . caddyfile-mode)))

(use-package corfu
  :config
  (setq corfu-preview-current t))

(use-package dired
  :config
  (map! :map dired-mode-map
        :localleader
        :desc "Edit filenames" "e" #'wdired-change-to-wdired-mode)
  (dired-async-mode 1))

(use-package grip-mode
  :config
  (setq grip-preview-use-webkit nil
        grip-use-mdopen t))

(use-package evil-snipe
  :config
  (setopt evil-snipe-repeat-keys t
          evil-split-window-below t
          evil-vsplit-window-right t))


(use-package jq-mode
  :mode ("\\.jq" . jq-mode))


(use-package literate-calc-mode
  :hook (org-mode . literate-calc-minor-mode))


(use-package lsp-mode
  :config
  (setopt lsp-disabled-clients '(tfls)
          lsp-enable-links t
          lsp-file-watch-threshold 2500
          lsp-semantic-tokens-enable nil
          lsp-semantic-tokens-honor-refresh-requests nil
          lsp-elixir-server-command '("elixir-ls")
          lsp-go-analyses '((fillreturns . t)
                            (nilness . t)
                            (unusedparams . t)
                            (unusedvariable . t)
                            (unusedwrite . t)
                            (useany . t))
          lsp-go-gopls-server-args '("-logfile=/tmp/gopls-client.log"
                                     "-remote.debug=localhost:0"
                                     ;; "-remote.logfile=/tmp/gopls-daemon.log"
                                     ;; "-rpc.trace"
                                     "-remote=auto")
          lsp-go-hover-kind "FullDocumentation"
          lsp-go-use-placeholders nil
          lsp-terraform-ls-prefill-required-fields t)
  (lsp-register-custom-settings
   '(("gopls.completeUnimported" t t)
     ("gopls.staticcheck" t t)))
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\vendor\\'")

  ;; ;; LSP Booster
  ;; ;; https://github.com/blahgeek/emacs-lsp-booster
  (defun lsp-booster--advice-final-command (old-fn cmd &optional test?)
    "Prepend emacs-lsp-booster command to lsp CMD."
    (let ((orig-result (funcall old-fn cmd test?)))
      (if (and (not test?)                             ;; for check lsp-server-present?
               (not (file-remote-p default-directory)) ;; see lsp-resolve-final-command, it would add extra shell wrapper
               lsp-use-plists
               (not (functionp 'json-rpc-connection))  ;; native json-rpc
               (executable-find "emacs-lsp-booster"))
          (progn
            (message "Using emacs-lsp-booster for %s!" orig-result)
            (append '("emacs-lsp-booster" "--disable-bytecode" "--") orig-result))
        orig-result)))
  (advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command))


(use-package magit
  :config
  (setopt magit-repository-directories
          '(("~/src" . 2)
            ("~/projects" . 2)))
  (unbind-key "z" magit-mode-map)
  (transient-append-suffix 'magit-commit '(1 3 -1) '("b" "git-absorb" magit-commit-absorb))
  (magit-wip-mode))


(use-package org
  :config
  (setopt org-directory "~/org/")
  (map! :map org-mode-map
        :localleader
        "=" #'org-babel-tangle))


(use-package plantuml-mode
  :mode ("\\.puml\\'" . plantuml-mode)
  :config (setq plantuml-default-exec-mode 'executable))



(use-package projectile
  :config
  (setopt projectile-enable-caching nil
          projectile-project-search-path (seq-map (lambda (elt) `(,elt . 2)) todevski-project-path))
  (run-with-idle-timer 300 1 #'projectile-discover-projects-in-search-path)
  (run-with-idle-timer 300 1 #'projectile-cleanup-known-projects))


(use-package systemd
  :config
  (map! :map systemd-mode-map
        :localleader
        "d" #'systemd-doc-directives
        "h" #'systemd-doc-open))


(use-package transient
  :config
  (transient-bind-q-to-quit))


(use-package which-key
  :config
  (setopt which-key-idle-delay 0.5))

(use-package bazel
  :commands
  (bazel-build
   bazel-compile-current-file
   bazel-find-build-file
   bazel-gazelle
   bazel-run
   bazel-show-consuming-rule
   bazel-test
   bazel-test-at-point)

  :hook
  ((bazel-build-mode
    bazel-module-mode
    bazel-starlark-mode
    bazel-workspace-mode) . lsp-mode)

  :config
  (defun bazel-gazelle ()
    (interactive)
    (bazel-run "//:gazelle"))

  (map!
   :leader
   :prefix "c"
   (:prefix
    ("b" . "Bazel")
    :desc "Build current file" "b" #'bazel-compile-current-file
    :desc "Build" "B" #'bazel-build
    :desc "Go to BUILD file for pkg" "p" #'bazel-find-build-file
    :desc "Run" "r" #'bazel-run
    :desc "Go to consuming rule" "R" #'bazel-show-consuming-rule
    :desc "Test at point" "t" #'bazel-test-at-point
    :desc "Test" "T" #'bazel-test
    :desc "Gazelle" "g" #'bazel-gazelle))

  (set-formatter! 'buildifier-build '("buildifier" "-type" "build") :modes '(bazel-build-mode))
  (set-formatter! 'buildifier-bzl '("buildifier" "-type" "bzl") :modes '(bazel-starlark-mode))
  (set-formatter! 'buildifier-module '("buildifier" "-type" "module") :modes '(bazel-module-mode))
  (set-formatter! 'buildifier-workspace '("buildifier" "-type" "workspace") :modes '(bazel-workspace-mode))

  (font-lock-add-keywords 'bazel-build-mode
                          '(("^# +\\(gazelle.+?\\) \\(.*$\\)"
                             (1 font-lock-keyword-face)
                             (2 font-lock-string-face))))


  (with-eval-after-load 'lsp-mode
    (add-to-list 'lsp-language-id-configuration '(bazel-build-mode . "bazel"))
    (add-to-list 'lsp-language-id-configuration '(bazel-module-mode . "bazel"))
    (add-to-list 'lsp-language-id-configuration '(bazel-starlark-mode . "bazel"))
    (add-to-list 'lsp-language-id-configuration '(bazel-workspace-mode . "bazel"))
    (lsp-register-client
     (make-lsp-client
      :new-connection (lsp-stdio-connection
                       (lambda ()
                         (list "starpls" "server"
                               "--experimental_goto_definition_skip_re_exports"
                               "--experimental_infer_ctx_attributes"
                               "--experimental_use_code_flow_analysis"
                               (concat "--bazel_path=" (executable-find "bazelisk")))))
      :activation-fn (lsp-activate-on "bazel")
      :environment-fn (lambda ()
                        ;; Skip calling the `tools/bazel' as
                        ;; it might be slow and cause problems.
                        '(("BAZELISK_SKIP_WRAPPER" . "1")))
      :server-id 'starpls))))


(use-package cue-mode
  :hook (cue-mode . lsp-mode)
  :config
  (with-eval-after-load 'lsp-mode
    (add-to-list 'lsp-language-id-configuration '(cue-mode . "cue"))
    (lsp-register-client
     (make-lsp-client :new-connection (lsp-stdio-connection "cuepls")
                      :major-modes '(cue-mode)
                      :server-id 'cuepls))))

;; (use-package typescript-mode
;;   :config
;;   (setq typescript-indent-level 2))

(use-package sh-script
  :config
  (set-formatter! 'shfmt '("shfmt" "-filename" filepath "--apply-ignore" "-")))

(use-package ledger-mode
  :custom
  ((ledger-binary-path "hledger")
   (ledger-mode-should-check-version nil)
   (ledger-report-auto-width nil)
   (ledger-report-links-in-register nil)
   (ledger-report-native-highlighting-arguments '("--color=always")))
  :mode ("\\.hledger\\'" "\\.ledger\\'" "\\.journal\\'"))


(use-package mu4e
  :config
  (setq mu4e-headers-include-related nil)
  (map! :map mu4e-headers-mode-map
        :localleader
        :desc "Mark thread as trashed" "d"
        #'(lambda ()
            (interactive)
            (mu4e-headers-mark-thread nil '(trash)))))

;; (use-package vc-jj)

(use-package pr-review
  :config
  (setq pr-review-ghub-username "dean-todevski_relex"))

(use-package git-link
  :config
  (setq git-link-consider-ssh-config t))

;;; CUSTOM
;;  ----------------------------------------------------------------------------
(map!
 :leader
 :prefix "o"
 :desc "Cheatsheet" "c" #'+cheatsheet/open)

(set-popup-rule! "^\\*cheatsheet\\*$"
  :side 'bottom
  :size 0.4
  :select t
  :quit 'current)

(let ((local-config (file-name-concat doom-user-dir "config.local.el")))
  (when (file-exists-p local-config)
    (load-file local-config)))
