;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; DOOM
;;  ----------------------------------------------------------------------------
(setq! user-full-name "Dean Lindqvist Todevski"
       user-mail-address "dean.todevski@gmail.com"

       ;; Theme
       doom-font (font-spec :family "Jetbrains Mono" :size 14)
       doom-variable-pitch-font (font-spec :family "Jetbrains Mono" :size 14)
       doom-unicode-font (font-spec :family "Jetbrains Mono" :size 14)
       doom-big-font (font-spec :family "Jetbrains Mono" :size 26)
       doom-theme 'doom-dracula
       fancy-splash-image (concat doom-private-dir "doom-icon.png")
       display-line-numbers-type t

       ;; Keymaps
       doom-localleader-key ","

       ;; Don't overwrite copied text on paste
       evil-kill-on-visual-paste nil

       ;; Disable titlebar and menus
       default-frame-alist '((undecorated . t)))

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(map!
 :leader
 :desc "Search in project" "/" #'+default/search-project
 :desc "Doom dashboard" "b h" #'+doom-dashboard/open
 :desc "Discover projects in search path" "p D" #'projectile-discover-projects-in-search-path

 :prefix "o"
 :desc "Kubedoc" "k" #'kubedoc
 :desc "Kubedoc for context" "K" #'kubedoc-for-context
 :desc "Undo tree" "u" #'undo-tree-visualize
 :desc "Font Size" "z" #'+hydra/text-zoom/body)

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


;;; Local variables
(setq enable-local-variables t)
(let ((vars
       ;; Safe dir-local variables
       '((+format-on-save-enabled-modes quote (not ruby-mode))))

      (forms
       ;; Safe dir-local forms
       '((ansible)
         (ansible-doc-mode)
         (electric-indent-mode 0)
         (sh-set-shell "zsh")
         (web-mode-set-engine "go"))))

  (dolist (var vars) (add-to-list 'safe-local-variable-values var))
  (dolist (form forms) (add-to-list 'safe-local-eval-forms form)))

;;; PACKAGES
;;  ----------------------------------------------------------------------------
(use-package! doom-modeline
  :config
  (setq doom-modeline-persp-name t))

(use-package! ansible
  :init
  (def-project-mode! +ansible-yaml-mode
    :modes '(yaml-mode)
    :add-hooks '(ansible ansible-auto-decrypt-encrypt ansible-doc-mode)
    :match "/\\(main\\|site\\|encrypted\\|\\(\\(roles\\|tasks\\|handlers\\|vars\\|defaults\\|meta\\|group_vars\\|host_vars\\)/.+\\)\\)\\.ya?ml$"))


(use-package! ansible-doc
  :init
  (set-popup-rule! "^\\*ansible-doc"
    :height 0.4 :quit t :select t :ttl t)
  :config
  (set-evil-initial-state! '(ansible-doc-module-mode) 'normal))


(use-package! browse-at-remote
  :config
  (add-to-list 'browse-at-remote-remote-type-regexps '("^git\\.todevski\\.com$" . "gitlab")))

(use-package! caddyfile-mode
  :mode (("Corefile\\'" . caddyfile-mode)
         ("\\.caddyfile\\'" . caddyfile-mode)))

(use-package! company
  :config
  (map! :map global-map
        :i [remap indent-for-tab-command] #'company-indent-or-complete-common))


(use-package! dired
  :config
  (map! :map dired-mode-map
        :localleader
        :desc "Edit filenames" "e" #'wdired-change-to-wdired-mode)
  (dired-async-mode 1))


(use-package! embark
  :config
  (map!
   :map embark-region-map
   "s" #'sort-lines))


(use-package! evil-snipe
  :config
  (setq! evil-snipe-repeat-keys t
         evil-split-window-below t
         evil-vsplit-window-right t))


(use-package! jq-mode
  :mode ("\\.jq" . jq-mode))


(use-package! literate-calc-mode
  :hook (org-mode . literate-calc-minor-mode))


(use-package! lsp-mode
  :config
  (setq! lsp-use-plists "true"
         lsp-go-hover-kind "FullDocumentation"
         lsp-elixir-server-command '("elixir-ls")
         lsp-disabled-clients '(tfls)
         lsp-semantic-tokens-enable t
         lsp-semantic-tokens-honor-refresh-requests t
         lsp-enable-links t
         lsp-terraform-ls-prefill-required-fields t)
  (lsp-register-custom-settings
   '(("gopls.completeUnimported" t t)
     ("gopls.staticcheck" t t)
     ("gopls.analyses.nilness" t t)
     ("gopls.analyses.useany" t t)
     ("gopls.analyses.unusedparams" t t)
     ("gopls.analyses.unusedvariable" t t)
     ("gopls.analyses.unusedwrite" t t)))
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\vendor\\'")

  ;; LSP Booster
  ;; https://github.com/blahgeek/emacs-lsp-booster
  (defun lsp-booster--advice-json-parse (old-fn &rest args)
    "Try to parse bytecode instead of json."
    (or
     (when (equal (following-char) ?#)
       (let ((bytecode (read (current-buffer))))
         (when (byte-code-function-p bytecode)
           (funcall bytecode))))
     (apply old-fn args)))
  (advice-add (if (progn (require 'json)
                         (fboundp 'json-parse-buffer))
                  'json-parse-buffer
                'json-read)
              :around
              #'lsp-booster--advice-json-parse)

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
            (cons "emacs-lsp-booster" orig-result))
        orig-result)))
  (advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command))


(use-package! magit
  :config
  (setq! magit-repository-directories
         '(("~/src" . 2)
           ("~/projects" . 2)))
  (unbind-key "z" magit-mode-map)
  (transient-append-suffix 'magit-commit '(1 3 -1) '("b" "git-absorb" magit-commit-absorb)))


(use-package! org
  :config
  (setq! org-directory "~/org/")
  (map! :map org-mode-map
        :localleader
        "=" #'org-babel-tangle))


(use-package! plantuml-mode
  :mode ("\\.puml\\'" . plantuml-mode)
  :config (setq plantuml-default-exec-mode 'executable))


(use-package! projectile
  :config
  (setq! projectile-enable-caching nil
         projectile-project-search-path
         (seq-filter #'file-exists-p
                     (split-string
                      (getenv "PROJECTPATH") ":"))))


(use-package! systemd
  :config
  (map! :map systemd-mode-map
        :localleader
        "d" #'systemd-doc-directives
        "h" #'systemd-doc-open))


(use-package! transient
  :config
  (transient-bind-q-to-quit))


(use-package! which-key
  :config
  (setq! which-key-idle-delay 0.5))

(use-package! consult-gh
  :after consult)

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
