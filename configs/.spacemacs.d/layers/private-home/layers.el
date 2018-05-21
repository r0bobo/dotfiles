;;; layers.el --- private-home layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Dean Todevski <dean.todevski@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(configuration-layer/declare-layers
 '(common-lisp
   django
   docker
   (elfeed :variables
           rmh-elfeed-org-files (list "~/.spacemacs.d/elfeed.org"))
   github
   javascript
   (markdown :variables
             markdown-command "pandoc")
   nginx
   php
   react
   ruby
   rust
   salt
   sql
   systemd
   vagrant
   version-control
   vimscript))
