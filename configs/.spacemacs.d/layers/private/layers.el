;;; layers.el --- private layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Dean Todevski <dean@ThinkPadX1>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(configuration-layer/declare-layer
 (if (equal user-login-name "deatod")
     'private-work
   'private-home))

