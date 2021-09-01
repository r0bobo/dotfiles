;;; tools/yadm/config.el -*- lexical-binding: t; -*-

(after! tramp
  (add-to-list 'tramp-methods
               '("yadm"
                 (tramp-login-program "yadm")
                 (tramp-login-args (("enter")))
                 (tramp-login-env (("SHELL") ("/bin/sh")))
                 (tramp-remote-shell "/bin/sh")
                 (tramp-remote-shell-args ("-c")))))
(map!
 :leader
 :prefix ("y" . "yadm")
 :desc "Yadm Magit status" "g" #'+yadm/magit-status
 :desc "Find yadm managed file" "f" #'+yadm/find-file
 )