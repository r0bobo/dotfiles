;;; packages.el --- vue layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author:  <dean@thinkpad>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(defconst vue-packages
  '(edit-indirect
    vue-mode)
  )

(defun vue/init-edit-indirect ()
  ;; vue-mode is the only mode using edit-indirect. This should probably be
  ;; moved to the spacemacs-base layer if more layers start requiring
  ;; edit-indirect
  (use-package edit-indirect
    :defer t
    :init
    (spacemacs/set-leader-keys-for-minor-mode 'edit-indirect--overlay
      dotspacemacs-major-mode-leader-key 'edit-indirect-commit
      "c" 'edit-indirect-commit
      "a" 'edit-indirect-abort
      "k" 'edit-indirect-abort)))

(defun vue/init-vue-mode ()
  "Initialize vue-mode"
  (use-package vue-mode
    :defer t
    :init
    (progn
      (defun vue-mode-edit-indirect-at-point-custom ()
        "Switch to js2-mode if editing js code"
        (interactive)
        (vue-mode-edit-indirect-at-point)
        (when (equal major-mode 'js-mode)
          (js2-mode))
        )
      (spacemacs/set-leader-keys-for-major-mode 'vue-mode
        "'" 'vue-mode-edit-indirect-at-point-custom)
      )))

;;; packages.el ends here
