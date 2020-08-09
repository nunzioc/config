;; add melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq org-log-done 'time)
;; disable ui
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(custom-set-variables
  '(coq-prog-args '("-R" "DIR/src" "Cpdt"))
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(package-selected-packages (quote (proof-general))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
>>>>>>> 253b84df27e53be68b24821dc49f3a25414cbc91
