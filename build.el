; -*- lexical-binding: t -*-

(require 'org)

(defun kakit-build ()
  "Tangle all Org files in `src/' into `src/kakit/'."
  (let* ((project-root (file-name-directory load-file-name))
         (src-dir (expand-file-name "src" project-root)))
    (when (file-directory-p src-dir)
      (dolist (org-file (directory-files src-dir t "\\.org$"))
        (with-current-buffer (find-file-noselect org-file)
          (org-babel-tangle)
          (kill-buffer))))))

(kakit-build)
