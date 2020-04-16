;;; init.el --- Summary
;; All the initialisation for the configuration is done here.

;;; Commentary:
;; This file is meant to be as simple and short as possible.  Its work should be to
;; delegate work to other files that are more focused on doing their own task.
;;
;; - packages.el is for declaratively using packages and setting package-specific configs
;; - **TODO: Create config.el to write all user configurations in.**

;;; Code:

;; TODO: doesn't work, fix it.
;; prevent adding/modifying entries in package-selected-packages
;; (defun package--save-selected-packages (&rest opt)
;;   "Do not add or modify package-selected-packages list.
;; whenever a package is installed or deleted; or package contents are refreshed.
;; OPT variable (doesn't have a known use)"
;;  nil)

;; enable ido everywhere
(defvar ido-enable-flex-matching t)
(defvar ido-everywhere t)
(ido-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(package-selected-packages
   (quote
    (zenburn-theme gotham-theme company-lsp toml-mode lsp-ui exec-path-from-shell flycheck-rust flyheck-rust cargo rustic use-package smooth-scrolling rust-mode magit lsp-mode flycheck evil-visual-mark-mode company))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(default ((t (:family "agave Nerd Font Mono" :foundry "PfEd" :slant normal :weight normal :height 130 :width normal))))
 )

;; load all basic configurations for the editor
;; e.g. (font, window size, modeline config, linum-mode, etc)
(load "~/.emacs.d/config.el")

;; load configuration for all external packages.
(load "~/.emacs.d/packages.el")

;;; init.el ends here
