;;; tools/yadm/config.el -*- lexical-binding: t; -*-

(defconst +yadm-git-dir (expand-file-name "~/.local/share/yadm/repo.git/")
  "YADM GIT_DIR path.")

(defconst +yadm-work-tree (expand-file-name "~/")
  "YADM GIT_WORK_TREE path.")

(after! magit
  ;; Inspired by:
  ;; https://github.com/magit/magit/issues/460#issuecomment-1475082958
  (advice-add 'magit-process-environment
              :filter-return #'+yadm/magit-process-environment))

(map!
 :leader
 :prefix ("y" . "yadm")
 :desc "Add file to yadm" "a" #'+yadm/add-file
 :desc "Find yadm managed file" "f" #'+yadm/find-file)
