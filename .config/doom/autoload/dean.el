;;; ~/.config/doom/autoload/dean.el -*- lexical-binding: t; -*-

;;;###autoload
(defun dean-filter-existing-directories (&rest paths)
  "Output directories that exists."
  (let (existing-paths)
    (dolist (path paths existing-paths)
      (when (file-directory-p (expand-file-name path))
        (setq existing-paths (cons path existing-paths))))))
