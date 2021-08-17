;;; ~/.config/doom/autoload/cheatsheet.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +cheatsheet/open ()
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
