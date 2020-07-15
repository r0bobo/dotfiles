;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "Dean Lindqvist Todevski"
      user-mail-address "dean.todevski@gmail.com")
(setq doom-font (font-spec :family "Source Code Pro" :size 14)
      doom-variable-pitch-font (font-spec :family "Source Code Pro" :size 14)
      doom-unicode-font (font-spec :family "Source Code Pro" :size 14)
      doom-big-font (font-spec :family "Source Code Pro" :size 26))

(setq doom-theme 'doom-vibrant
      display-line-numbers-type t)
(setq org-directory "~/org/")
(after! org
  (add-to-list 'org-capture-templates
               '("l" "Link" entry
                 (file+headline "links.org" "New Links")
                 "* %(org-cliplink-capture)\n :PROPERTIES:\n :CATEGORY: %?\n :END:\n %i\n"
                 :prepend t :kill-buffer t)))

(after! org
  (add-to-list 'org-capture-templates
               '("t" "Personal todo" entry
                 (file+headline +org-capture-todo-file "Todos")
                 "* TODO %?\n%i\n%a" :prepend t)))
;;;###autoload
(defun +literate-recompile-maybe-h ()
  (when (and (eq major-mode 'org-mode)
             (file-in-directory-p buffer-file-name (expand-file-name "~/.local/share/chezmoi/doom")))
    (+literate-tangle 'force)))
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
(map! :map systemd-mode-map
      :localleader
      "d" #'systemd-doc-directives
      "h" #'systemd-doc-open)
(setq doom-localleader-key ",")
(use-package! which-key
  :config
  (setq which-key-idle-delay 0.5))
(map!
 :leader
 "b h" #'+doom-dashboard/open)
(setq projectile-project-search-path '("~/src/" "~/projects/"))
(after! python-mode
  (set-pretty-symbols! 'python-mode nil))
(after! js2-mode
  (set-pretty-symbols! 'js2-mode nil))
