;;; tools/yadm/config.el -*- lexical-binding: t; -*-

(after! magit
  (advice-add 'magit-process-environment
              :filter-return #'+yadm/magit-process-environment))

(map!
 :leader
 :prefix ("y" . "yadm")
 :desc "Add file to yadm" "a" #'+yadm/add-file
 :desc "Find yadm managed file" "f" #'+yadm/find-file)
