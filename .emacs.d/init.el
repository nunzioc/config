;; enable straight.el package manager
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
;; disable default package manager
(setq package-enable-at-startup nil)
;; use-package with straight
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(setq org-log-done 'time)
;; disable ui
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; janet stuff
(straight-use-package
 '(janet-mode
   :type git
   :host github
   :repo "ALSchwalm/janet-mode"))

(use-package s)
(use-package dash)
(straight-use-package
 '(inf-janet
   :type git
   :host github
   :repo "velkyel/inf-janet"))
(add-hook 'janet-mode-hook #'inf-janet-minor-mode)
