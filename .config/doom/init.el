;;; init.el -*- lexical-binding: t; -*-

;; https://emacs-lsp.github.io/lsp-mode/page/performance/#use-plists-for-deserialization
;; https://discourse.doomemacs.org/t/using-lsp-use-plists-with-rust-analyzer-stops-updating-diagnostics-on-save/2832
(setenv "LSP_USE_PLISTS" "1")

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
       word-wrap

       :emacs
       (dired +dirvish +icons)
       electric
       (ibuffer +icons)
       undo
       vc

       :term
       vterm

       :checkers
       (syntax +flymake)

       :tools
       ansible
       direnv
       docker
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
       (json +lsp +tree-sitter)
       (javascript +lsp)
       lua
       (markdown +grip)
       (nix +tree-sitter)
       (org +present)
       plantuml
       (python +lsp +tree-sitter)
       rest
       (ruby +lsp +rails)
       (rust +lsp +tree-sitter)
       (sh +tree-sitter)
       (web +tree-sitter)
       (yaml +lsp)

       :config
       (default +bindings +smartparens))
