;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(defun dean-filter-existing-directories (&rest paths)
  "Output directories that exists."
  (let (existing-paths)
    (dolist (path paths existing-paths)
        (when (file-directory-p (expand-file-name path))
          (setq existing-paths (cons path existing-paths))))))
(setq! user-full-name "Dean Lindqvist Todevski"
      user-mail-address "dean.todevski@gmail.com")
(setq! doom-localleader-key ",")
(use-package! which-key
  :config
  (setq! which-key-idle-delay 0.5))
(setq! auth-sources '("~/.authinfo"))
(use-package! evil-snipe
  :config
  (setq! evil-snipe-repeat-keys t)
  )
(setq evil-split-window-below t
      evil-vsplit-window-right t)
(map!
 :leader
 :desc "Search in project" "/" #'+default/search-project
 :desc "Doom dashboard" "b h" #'+doom-dashboard/open

 :prefix "o"
 :desc "Undo tree" "u" 'undo-tree-visualize
 :desc "Font Size" "z" #'+hydra/text-zoom/body

 :prefix ("d" . "dean")
 :desc "Cheatsheet" "c" 'dean/cheatsheet
 :desc "Doom Config" "d" 'dean/doom-config
 )
(defhydra hydra-goto-chg (:timeout 2)
  "goto-chg"
  (";" goto-last-change "goto-last-change")
  ("," goto-last-change-reverse "goto-last-change-reverse")
  ("i" goto-last-change-reverse "goto-last-change-reverse")
  )

(map! :n "g;" 'hydra-goto-chg/goto-last-change)
(map! :map dired-mode-map
      :localleader
      :desc "Edit filenames" "e" #'wdired-change-to-wdired-mode)
(use-package! projectile
  :config
  (setq! projectile-project-search-path
         (dean-filter-existing-directories
          "~/src/" "~/projects/")))
(setq! doom-font (font-spec :family "Source Code Pro" :size 14)
      doom-variable-pitch-font (font-spec :family "Source Code Pro" :size 14)
      doom-unicode-font (font-spec :family "Source Code Pro" :size 14)
      doom-big-font (font-spec :family "Source Code Pro" :size 26))

(setq! doom-theme 'doom-vibrant
      display-line-numbers-type t)
(setq! +ligatures-in-modes '(org-mode)
       +ligatures-extras-in-modes '(org-mode))
(setq! org-directory "~/org/")

(map! :map org-mode-map
      :localleader
      "=" #'org-babel-tangle)
(add-hook 'org-mode-hook
          'literate-calc-minor-mode)
(after! org
  (add-to-list 'org-capture-templates
               '("l" "Link" entry
                 (file+headline "links.org" "New Links")
                 "* %(org-cliplink-capture)\n%?\n %i\n"
                 :prepend t :kill-buffer t)))

(after! org
  (add-to-list 'org-capture-templates
               '("t" "Personal todo" entry
                 (file+headline +org-capture-todo-file "Todos")
                 "* TODO %?\n%i\n%a" :prepend t)))
(after! ansible-doc
  (set-evil-initial-state! '(ansible-doc-module-mode) 'normal))

(set-popup-rule! "^\\*ansible-doc"
  :height 0.4 :quit t :select t :ttl t)

(set-lookup-handlers! 'ansible-mode
  :documentation #'ansible-doc)
(def-project-mode! +ansible-yaml-mode
  :modes '(yaml-mode)
  :add-hooks '(ansible ansible-auto-decrypt-encrypt ansible-doc-mode)
  :match "/\\(main\\|site\\|encrypted\\|\\(\\(roles\\|tasks\\|handlers\\|vars\\|defaults\\|meta\\|group_vars\\|host_vars\\)/.+\\)\\)\\.ya?ml$")
(use-package! chezmoi
    :commands (chezmoi|diff chezmoi|ediff chezmoi|find chezmoi|magit-status chezmoi|write)
    )
(map! :map systemd-mode-map
      :localleader
      "d" #'systemd-doc-directives
      "h" #'systemd-doc-open)
(setq! magit-repository-directories
      '(("~/src" . 2)
        ("~/projects" . 2)))
(use-package! browse-at-remote
  :config
  (add-to-list 'browse-at-remote-remote-type-domains
               '("git.todevski.com" . "gitlab")))
(add-to-list '+lookup-provider-url-alist
             '("Melpa"       "https://melpa.org/#/?q=%s")
             '("go.dev"      "https://pkg.go.dev/search?q=%s"))
(defun dean/doom-config (&optional initial-input)
  "Search Doom private config and jump to a heading."
  (interactive)
  (doom-completing-read-org-headings
   "Config: " (list (concat doom-private-dir "config.org"))
   2 nil initial-input))

(defun dean/cheatsheet (&optional initial-input)
  "Search private cheatsheet and jump to heading."
  (interactive)
  (doom-completing-read-org-headings
   "Cheatsheet: " (list (concat doom-private-dir "cheatsheet.org"))
   2 nil initial-input))
