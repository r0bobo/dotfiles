;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq! user-full-name "Dean Lindqvist Todevski"
       user-mail-address "dean.todevski@gmail.com")


;; Theme
(setq! doom-font (font-spec :family "Jetbrains Mono" :size 14)
       doom-variable-pitch-font (font-spec :family "Jetbrains Mono" :size 14)
       doom-unicode-font (font-spec :family "Jetbrains Mono" :size 14)
       doom-big-font (font-spec :family "Jetbrains Mono" :size 26)
       doom-theme 'doom-dracula
       fancy-splash-image (concat doom-private-dir "doom-icon.png")
       display-line-numbers-type t)


;;; Keymaps
(setq! doom-localleader-key ",")

(map!
 :leader
 :desc "Search in project" "/" #'+default/search-project
 :desc "Doom dashboard" "b h" #'+doom-dashboard/open

 :prefix "o"
 :desc "Undo tree" "u" #'undo-tree-visualize
 :desc "Font Size" "z" #'+hydra/text-zoom/body)

(map! :map dired-mode-map
      :localleader
      :desc "Edit filenames" "e" #'wdired-change-to-wdired-mode)

(use-package! which-key
  :config
  (setq! which-key-idle-delay 0.5))


;;; evil
(use-package! evil-snipe
  :config
  (setq! evil-snipe-repeat-keys t
         ;; TODO: Is this used?
         ;; evil-snipe-override-evil-repeat-keys nil
         ))

(setq! evil-split-window-below t
       evil-vsplit-window-right t)


;;; Org-mode
(setq! org-directory "~/org/")

(map! :map org-mode-map
      :localleader
      "=" #'org-babel-tangle)

(add-hook 'org-mode-hook
          'literate-calc-minor-mode)

;;; Ansible
(after! ansible-doc
  (set-evil-initial-state! '(ansible-doc-module-mode) 'normal))

(set-popup-rule! "^\\*ansible-doc"
  :height 0.4 :quit t :select t :ttl t)

(def-project-mode! +ansible-yaml-mode
  :modes '(yaml-mode)
  :add-hooks '(ansible ansible-auto-decrypt-encrypt ansible-doc-mode)
  :match "/\\(main\\|site\\|encrypted\\|\\(\\(roles\\|tasks\\|handlers\\|vars\\|defaults\\|meta\\|group_vars\\|host_vars\\)/.+\\)\\)\\.ya?ml$")


;;; Magit
(setq! magit-repository-directories
       '(("~/src" . 2)
         ("~/projects" . 2)))

(use-package! browse-at-remote
  :config
  (add-to-list 'browse-at-remote-remote-type-regexps
               '("^git\\.todevski\\.com$" . "gitlab")))

(use-package! transient
  :config
  (transient-bind-q-to-quit))

(use-package! magit
  :config
  (unbind-key "z" magit-mode-map))

(add-to-list '+lookup-provider-url-alist
             '("Melpa"       "https://melpa.org/#/?q=%s")
             '("go.dev"      "https://pkg.go.dev/search?q=%s"))

;;; Completion
(use-package! company
  :config
  (map! :map company-active-map
        :g "<return>" #'company-complete-selection
        :g "RET" #'company-complete-selection)
  (map! :map global-map
        :i [remap indent-for-tab-command] #'company-indent-or-complete-common))

;;; Projectile
(use-package! projectile
  :config
  (setq projectile-project-search-path
        (seq-filter #'file-exists-p
                    '("~/src/"
                      "~/projects"
                      "~/projects/services"))))

;;; Autoformat
(setq +format-on-save-enabled-modes
      '(not emacs-lisp-mode  ; elisp's mechanisms are good enough
            sql-mode         ; sqlformat is currently broken
            tex-mode         ; latexindent is broken
            latex-mode
            dockerfile-mode
            terraform-mode
            sh-mode
            ruby-mode))

;;; Plantuml
(use-package! plantuml-mode
  :mode ("\\.puml\\'" . plantuml-mode)
  :config (setq plantuml-default-exec-mode 'executable))

;;; LSP
;; Don't watch go vendor dir for changes. It makes everything crazy slow in some projects.
(use-package! lsp-mode
  :config
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\vendor\\'"))

;;; Local variables
;; (setq enable-local-variables :safe)
(add-to-list 'safe-local-variable-values
             '((+format-on-save-enabled-modes quote (not ruby-mode))))

(add-to-list 'safe-local-eval-forms
             '(ansible))

(add-to-list 'safe-local-eval-forms
             '(ansible-doc-mode))

(add-to-list 'safe-local-eval-forms
             '(web-mode-set-engine "go"))

(add-to-list 'safe-local-eval-forms
             '(electric-indent-mode 0))

(add-to-list 'safe-local-eval-forms
             '(sh-set-shell "zsh"))

;;; File template
(set-file-template! "/kustomization\\.yaml$"
  :trigger "__kustomization.yaml"
  :mode 'yaml-mode)

;;; Embark
(map!
 :map embark-region-map
 "s" #'sort-lines)

;;; jq
(use-package! jq-mode
  :mode ("\\.jq" . jq-mode))

;;; System
(map! :map systemd-mode-map
      :localleader
      "d" #'systemd-doc-directives
      "h" #'systemd-doc-open)

;;; Tree-sitter
(use-package! tree-sitter
  :hook (prog-mode . turn-on-tree-sitter-mode)
  :hook (tree-sitter-after-on . tree-sitter-hl-mode)
  :config (require 'tree-sitter-langs))

;;; Cheatsheet
(map!
 :leader
 :prefix "o"
 :desc "Cheatsheet" "c" #'+cheatsheet/open)

(set-popup-rule! "^\\*cheatsheet\\*$"
  :side 'bottom
  :size 0.4
  :select t
  :quit 'current)
