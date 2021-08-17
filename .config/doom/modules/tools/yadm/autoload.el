;;; tools/yadm/autoload.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +yadm--files ()
  "List all yadm files"
  (let ((default-directory "~"))
    (split-string
     (shell-command-to-string "yadm list"))))

; Inspired by https://philjackson.github.io//yadm/emacs/magit/2021/07/25/using-yadm-via-magit/
;;;###autoload
(defun +yadm/magit-status ()
  "Show Magit status for yadm repo."
  (interactive)
  (magit-status "/yadm::"))

;;;###autoload
(defun +yadm/find-file ()
  "Edit yadm managed file."
  (interactive)
  (find-file
   (concat
    (file-name-as-directory "/yadm::")
    (completing-read "yadm managed file: " (+yadm--files) nil t))))

;;;###autoload
(defun +yadm/add-file ()
  "Edit yadm managed file."
  (interactive)
  (shell-command
   (concat "yadm add" (find-file))))
