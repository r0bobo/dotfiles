;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(defun dean-filter-existing-directories (&rest paths)
  "Output directories that exists."
  (let (existing-paths)
    (dolist (path paths existing-paths)
      (when (file-directory-p (expand-file-name path))
        (setq existing-paths (cons path existing-paths))))))
(defun dean/cheatsheet ()
  "Display personal cheetsheet"
  (interactive)
  (let ((buffer-name "*cheatsheet*"))
    (when (not (get-buffer buffer-name))
      (with-current-buffer (get-buffer-create buffer-name)
        (insert-file-contents (concat doom-private-dir "cheatsheet.org"))
        (org-mode)
        (display-line-numbers-mode -1)
        (read-only-mode 1)))
    (pop-to-buffer buffer-name)))
(set-popup-rule! "^\\*cheatsheet\\*$"
  :side 'bottom
  :size 0.4
  :select t
  :quit 'current)
(setq! user-full-name "Dean Lindqvist Todevski"
      user-mail-address "dean.todevski@gmail.com")
(setq evil-snipe-override-evil-repeat-keys nil)
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
 :desc "Undo tree" "u" #'undo-tree-visualize
 :desc "Font Size" "z" #'+hydra/text-zoom/body
 :desc "Cheatsheet" "c" #'dean/cheatsheet

 :prefix ("y" . "yadm")
 :desc "Yadm Magit Status" "g" #'dean/yadm-status
 :desc "Find yadm manged file" "f" #'dean/yadm-find-file
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
          "~/src/" "~/projects/" "/projects/services")))
(setq! doom-font (font-spec :family "Jetbrains Mono" :size 14)
       doom-variable-pitch-font (font-spec :family "Jetbrains Mono" :size 14)
       doom-unicode-font (font-spec :family "Jetbrains Mono" :size 14)
       doom-big-font (font-spec :family "Jetbrains Mono" :size 26))
(setq! doom-theme 'doom-dracula
       display-line-numbers-type t)
(setq fancy-splash-image (concat doom-private-dir "doom-icon.png"))
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
(after! org
  (defun unpackaged/org-element-descendant-of (type element)
    "Return non-nil if ELEMENT is a descendant of TYPE.
TYPE should be an element type, like `item' or `paragraph'.
ELEMENT should be a list like that returned by `org-element-context'."
    ;; MAYBE: Use `org-element-lineage'.
    (when-let* ((parent (org-element-property :parent element)))
      (or (eq type (car parent))
          (unpackaged/org-element-descendant-of type parent))))

;;;###autoload
  (defun unpackaged/org-return-dwim (&optional default)
    "A helpful replacement for `org-return'.  With prefix, call `org-return'.

On headings, move point to position after entry content.  In
lists, insert a new item or end the list, with checkbox if
appropriate.  In tables, insert a new row or end the table."
    ;; Inspired by John Kitchin: http://kitchingroup.cheme.cmu.edu/blog/2017/04/09/A-better-return-in-org-mode/
    (interactive "P")
    (if default
        (org-return)
      (cond
       ;; Act depending on context around point.

       ;; NOTE: I prefer RET to not follow links, but by uncommenting this block, links will be
       ;; followed.

       ;; ((eq 'link (car (org-element-context)))
       ;;  ;; Link: Open it.
       ;;  (org-open-at-point-global))

       ((org-at-heading-p)
        ;; Heading: Move to position after entry content.
        ;; NOTE: This is probably the most interesting feature of this function.
        (let ((heading-start (org-entry-beginning-position)))
          (goto-char (org-entry-end-position))
          (cond ((and (org-at-heading-p)
                      (= heading-start (org-entry-beginning-position)))
                 ;; Entry ends on its heading; add newline after
                 (end-of-line)
                 (insert "\n\n"))
                (t
                 ;; Entry ends after its heading; back up
                 (forward-line -1)
                 (end-of-line)
                 (when (org-at-heading-p)
                   ;; At the same heading
                   (forward-line)
                   (insert "\n")
                   (forward-line -1))
                 ;; FIXME: looking-back is supposed to be called with more arguments.
                 (while (not (looking-back (rx (repeat 3 (seq (optional blank) "\n")))))
                   (insert "\n"))
                 (forward-line -1)))))

       ((org-at-item-checkbox-p)
        ;; Checkbox: Insert new item with checkbox.
        (org-insert-todo-heading nil))

       ((org-in-item-p)
        ;; Plain list.  Yes, this gets a little complicated...
        (let ((context (org-element-context)))
          (if (or (eq 'plain-list (car context))  ; First item in list
                  (and (eq 'item (car context))
                       (not (eq (org-element-property :contents-begin context)
                                (org-element-property :contents-end context))))
                  (unpackaged/org-element-descendant-of 'item context))  ; Element in list item, e.g. a link
              ;; Non-empty item: Add new item.
              (org-insert-item)
            ;; Empty item: Close the list.
            ;; TODO: Do this with org functions rather than operating on the text. Can't seem to find the right function.
            (delete-region (line-beginning-position) (line-end-position))
            (insert "\n"))))

       ((when (fboundp 'org-inlinetask-in-task-p)
          (org-inlinetask-in-task-p))
        ;; Inline task: Don't insert a new heading.
        (org-return))

       ((org-at-table-p)
        (cond ((save-excursion
                 (beginning-of-line)
                 ;; See `org-table-next-field'.
                 (cl-loop with end = (line-end-position)
                          for cell = (org-element-table-cell-parser)
                          always (equal (org-element-property :contents-begin cell)
                                        (org-element-property :contents-end cell))
                          while (re-search-forward "|" end t)))
               ;; Empty row: end the table.
               (delete-region (line-beginning-position) (line-end-position))
               (org-return))
              (t
               ;; Non-empty row: call `org-return'.
               (org-return))))
       (t
        ;; All other cases: call `org-return'.
        (org-return))))))
(map!
 :after evil-org
 :map evil-org-mode-map
 :i [return] #'unpackaged/org-return-dwim)
(after! ansible-doc
  (set-evil-initial-state! '(ansible-doc-module-mode) 'normal))

(set-popup-rule! "^\\*ansible-doc"
  :height 0.4 :quit t :select t :ttl t)
(def-project-mode! +ansible-yaml-mode
  :modes '(yaml-mode)
  :add-hooks '(ansible ansible-auto-decrypt-encrypt ansible-doc-mode)
  :match "/\\(main\\|site\\|encrypted\\|\\(\\(roles\\|tasks\\|handlers\\|vars\\|defaults\\|meta\\|group_vars\\|host_vars\\)/.+\\)\\)\\.ya?ml$")
(setq! magit-repository-directories
      '(("~/src" . 2)
        ("~/projects" . 2)))
(use-package! browse-at-remote
  :config
  (add-to-list 'browse-at-remote-remote-type-domains
               '("git.todevski.com" . "gitlab")))
(use-package! transient
  :config
  (transient-bind-q-to-quit))
(use-package! magit
  :config
  (unbind-key "z" magit-mode-map))
(add-to-list '+lookup-provider-url-alist
             '("Melpa"       "https://melpa.org/#/?q=%s")
             '("go.dev"      "https://pkg.go.dev/search?q=%s"))
(use-package! company
  :config
  (map! :map company-active-map
        :g "<return>" #'company-complete-selection
        :g "RET" #'company-complete-selection)
  (map! :map global-map
        :i [remap indent-for-tab-command] #'company-indent-or-complete-common)
  )
(setq +format-on-save-enabled-modes
      '(not emacs-lisp-mode  ; elisp's mechanisms are good enough
            sql-mode         ; sqlformat is currently broken
            tex-mode         ; latexindent is broken
            latex-mode
            dockerfile-mode
            terraform-mode
            sh-mode
            ruby-mode))
(use-package! plantuml-mode
  :mode ("\\.puml\\'" . plantuml-mode)
  :config
  (setq plantuml-default-exec-mode 'executable))
(use-package! lsp-mode
  :config
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\vendor\\'"))
(setq enable-local-variables :safe)
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
(use-package! tramp
  :config
  (add-to-list 'tramp-methods
               '("yadm"
                 (tramp-login-program "yadm")
                 (tramp-login-args (("enter")))
                 (tramp-login-env (("SHELL") ("/bin/sh")))
                 (tramp-remote-shell "/bin/sh")
                 (tramp-remote-shell-args ("-c")))))

(defun dean/yadm-status ()
  "Open yadm repo in Magit."
  (interactive)
  (magit-status "/yadm::"))
(defun dean-yadm-files ()
  "List all yadm files"
  (let ((default-directory "~"))
    (split-string
     (shell-command-to-string "yadm list"))))

(defun dean/yadm-find-file ()
  "Edit yadm managed file."
  (interactive)
  (find-file
   (concat
    (file-name-as-directory "~")
    (completing-read "YADM file: " (dean-yadm-files) nil t))))
(set-file-template! "/kustomization\\.yaml$" :trigger "__kustomization.yaml" :mode 'yaml-mode)
(map!
 :map embark-region-map
 "s" #'sort-lines)
(use-package! jq-mode
  :mode ("\\.jq" . jq-mode))
(map! :map systemd-mode-map
      :localleader
      "d" #'systemd-doc-directives
      "h" #'systemd-doc-open)
(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))
(setq
 tramp-security-key-confirmed-regexp ""
 tramp-security-key-confirm-regexp "")