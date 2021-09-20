;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; DOOM
;;; ----------------------------------------------------------------------------
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

       +format-on-save-enabled-modes
       '(not emacs-lisp-mode  ; elisp's mechanisms are good enough
             sql-mode         ; sqlformat is currently broken
             tex-mode         ; latexindent is broken
             latex-mode
             dockerfile-mode
             terraform-mode
             sh-mode
             ruby-mode))

(map!
 :leader
 :desc "Search in project" "/" #'+default/search-project
 :desc "Doom dashboard" "b h" #'+doom-dashboard/open

 :prefix "o"
 :desc "Undo tree" "u" #'undo-tree-visualize
 :desc "Font Size" "z" #'+hydra/text-zoom/body)


(add-to-list '+lookup-provider-url-alist
             '("Melpa"       "https://melpa.org/#/?q=%s")
             '("go.dev"      "https://pkg.go.dev/search?q=%s"))


;;; File template
(set-file-template! "/kustomization\\.yaml$"
  :trigger "__kustomization.yaml"
  :mode 'yaml-mode)


;;; Local variables
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
;;; ----------------------------------------------------------------------------
(use-package! dired
  :config
  (map! :map dired-mode-map
        :localleader
        :desc "Edit filenames" "e" #'wdired-change-to-wdired-mode))


(use-package! which-key
  :config
  (setq! which-key-idle-delay 0.5))


(use-package! evil-snipe
  :config
  (setq! evil-snipe-repeat-keys t
         evil-split-window-below t
         evil-vsplit-window-right t))


(use-package! org
  :config
  (setq! org-directory "~/org/")
  (map! :map org-mode-map
        :localleader
        "=" #'org-babel-tangle))


(use-package! literate-calc-mode
  :hook (org-mode . literate-calc-minor-mode))


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


(use-package! magit
  :config
  (setq! magit-repository-directories
         '(("~/src" . 2)
           ("~/projects" . 2)))
  (unbind-key "z" magit-mode-map))


(use-package! browse-at-remote
  :config
  (add-to-list 'browse-at-remote-remote-type-regexps
               '("^git\\.todevski\\.com$" . "gitlab")))


(use-package! transient
  :config
  (transient-bind-q-to-quit))


(use-package! company
  :config
  (map! :map company-active-map
        :g "<return>" #'company-complete-selection
        :g "RET" #'company-complete-selection)
  (map! :map global-map
        :i [remap indent-for-tab-command] #'company-indent-or-complete-common))


(use-package! projectile
  :config
  (setq projectile-project-search-path
        (seq-filter #'file-exists-p
                    '("~/src/"
                      "~/projects"
                      "~/projects/services"))))


(use-package! plantuml-mode
  :mode ("\\.puml\\'" . plantuml-mode)
  :config (setq plantuml-default-exec-mode 'executable))


(use-package! lsp-mode
  :config
  ;; Don't watch go vendor dir for changes. It makes everything crazy slow in some projects.
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\vendor\\'"))


(use-package! embark
  :config
  (map!
   :map embark-region-map
   "s" #'sort-lines))


(use-package! jq-mode
  :mode ("\\.jq" . jq-mode))


(use-package! systemd
  :config
  (map! :map systemd-mode-map
        :localleader
        "d" #'systemd-doc-directives
        "h" #'systemd-doc-open))


(use-package! tree-sitter
  :hook (prog-mode . turn-on-tree-sitter-mode)
  :hook (tree-sitter-after-on . tree-sitter-hl-mode)
  :config (require 'tree-sitter-langs))


;;; CUSTOM
;;; ----------------------------------------------------------------------------
(map!
 :leader
 :prefix "o"
 :desc "Cheatsheet" "c" #'+cheatsheet/open)

(set-popup-rule! "^\\*cheatsheet\\*$"
  :side 'bottom
  :size 0.4
  :select t
  :quit 'current)
