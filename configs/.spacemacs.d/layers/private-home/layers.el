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
 '(ansible
   common-lisp
   django
   docker
   (elfeed :variables
           rmh-elfeed-org-files (list "~/.spacemacs.d/elfeed.org"))
   github
   javascript
   html
   (markdown :variables
             markdown-command "pandoc")
   nginx
   (org :variables
        org-enable-hugo-support t
        org-projectile-file "TODO.org")
   puppet
   php
   react
   restclient
   ruby
   rust
   salt
   systemd
   vagrant
   version-control
   vimscript
   xkcd))
