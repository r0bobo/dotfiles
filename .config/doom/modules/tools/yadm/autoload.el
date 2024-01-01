;;; tools/yadm/autoload.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +yadm--files ()
  "List all yadm files"
  (let ((default-directory "~"))
    (split-string
     (shell-command-to-string "yadm list"))))

;;; https://github.com/magit/magit/issues/460#issuecomment-1475082958
;;;###autoload
(defun +yadm/magit-process-environment (env)
  "Detect and set git -bare repo env vars when in tracked dotfile directories."
  (let* ((default (file-name-as-directory (expand-file-name default-directory)))
         (git-dir (expand-file-name "~/.local/share/yadm/repo.git/"))
         (work-tree (expand-file-name "~/"))
         (dotfile-dirs
          (-map (apply-partially 'concat work-tree)
                (-uniq (-keep #'file-name-directory (split-string (shell-command-to-string
                                                                   (format "/usr/bin/git --git-dir=%s --work-tree=%s ls-tree --full-tree --name-only -r HEAD"
                                                                           git-dir work-tree))))))))
    (push work-tree dotfile-dirs)
    (when (member default dotfile-dirs)
      (push (format "GIT_WORK_TREE=%s" work-tree) env)
      (push (format "GIT_DIR=%s" git-dir) env)))
  env)

;;;###autoload
(defun +yadm/find-file ()
  "Edit yadm managed file."
  (interactive)
  (find-file
   (concat
    "~/"
    (completing-read "yadm managed file: " (+yadm--files) nil t))))

;;;###autoload
(defun +yadm/add-file ()
  "Add file to yadm."
  (interactive)
  (shell-command
   (concat "yadm add " (read-file-name ""))))
