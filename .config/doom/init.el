;;; init.el -*- lexical-binding: t; -*-

(setq evil-respect-visual-line-mode t)

(doom! :completion
       (corfu +dabbrev +icons +orderless)
       (vertico +icons)

       :ui
       doom
       doom-dashboard
       indent-guides
       hl-todo
       modeline
       ophints
       (popup +defaults)
       smooth-scroll
       (vc-gutter +pretty)
       vi-tilde-fringe
       workspaces

       :editor
       (evil +everywhere)
       file-templates
       fold
       (format +lsp +onsave)
       multiple-cursors
       parinfer
       rotate-text
       snippets
       (whitespace +guess +trim)
       word-wrap

       :emacs
       (dired +dirvish +icons)
       electric
       (ibuffer +icons)
       tramp
       undo
       vc

       :email
       (mu4e +mbsync +org)

       :term
       vterm

       :checkers
       (syntax +flymake)

       :tools
       ansible
       direnv
       (docker +tree-sitter)
       editorconfig
       (eval +overlay)
       lookup
       lsp
       magit
       make
       (pass +auth)
       pdf
       (terraform +lsp)
       tmux
       tree-sitter
       yadm ;;personal

       :os
       (tty +osc)

       :lang
       data
       (elixir +lsp +tree-sitter)
       emacs-lisp
       (go +lsp +tree-sitter)
       (haskell +lsp +tree-sitter)
       (graphql +lsp)
       (json +lsp +tree-sitter)
       (javascript +lsp +tree-sitter)
       ledger
       lua
       (markdown +grip +tree-sitter)
       (nix +tree-sitter)
       (org +present)
       plantuml
       (python +lsp +tree-sitter)
       rest
       (ruby +lsp +rails)
       (rust +lsp +tree-sitter)
       (sh +tree-sitter)
       (web +tree-sitter)
       (yaml +lsp +tree-sitter)

       :config
       (default +bindings +smartparens))
