;;; tools/yadm/autoload.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +yadm--files ()
  "List all yadm files"
  (let ((default-directory "~"))
    (split-string
     (shell-command-to-string "yadm list"))))

;;;###autoload
(defun +yadm--tracked-file-p ()
  "Return t if current buffer is file tracked by yadm."
  (unless (vc-call-backend 'Git 'root default-directory)
    (let* ((default (file-name-as-directory (expand-file-name default-directory)))
           (dotfile-dirs
            (-map (apply-partially 'concat +yadm-work-tree)
                  (-uniq (-keep #'file-name-directory (split-string (shell-command-to-string
                                                                     (format "/usr/bin/git --git-dir=%s --work-tree=%s ls-tree --full-tree --name-only -r HEAD"
                                                                             +yadm-git-dir +yadm-work-tree))))))))
      (push +yadm-work-tree dotfile-dirs)
      (when (member default dotfile-dirs)
        t))))

;;; https://github.com/magit/magit/issues/460#issuecomment-1475082958
;;;###autoload
(defun +yadm/magit-process-environment (env)
  "Add yadm GIT_DIR and GIT_WORK_TREE to magit env if current file is tracked by yadm."
  (when (+yadm--tracked-file-p)
    (push (concat "GIT_WORK_TREE=" +yadm-work-tree) env)
    (push (concat "GIT_DIR=" +yadm-git-dir) env))
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
