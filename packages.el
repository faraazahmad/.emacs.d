;;; packages.el --- Summary
;; All the packages to be installed and their custom configurations
;; are declared here.

;;; Commentary:


;;; Code:
(require 'package)
(setq package-enable-at-startup nil) ; to prevent initialising package twice

;; Add ELPA, MELPA and MELPA (Stable) to package archives
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

(package-initialize)

;; Install "use-package" if it's not already installed and then `require` it
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; automatically install all listed packages if not installed
(setq use-package-always-ensure t)

;; ------------------------- PACKAGE LIST START ----------------------------
;; list all packages to install below. To speed up emacs load time,
;; use :defer t option to skip loading package until emacs loads up.

;; Use Flycheck for on-the-fly syntax checking and reporting
(use-package flycheck
  :defer t
  :hook (prog-mode . flycheck-mode))

;; use Company for text completion UI
(use-package company
  :defer t
  :hook (prog-mode . company-mode)
  :config (setq company-tooltip-align-annotations t)
          (setq company-minimum-prefix-length 1))

;; Use LSP to connect to the Language Server Protocol
;; and add hooks to various major modes
(use-package lsp-mode
  :defer t
  :commands lsp
  :config
  (add-hook 'rust-mode-hook #'lsp)) ;; Add hook for rust-mode

(use-package lsp-ui :defer t)
(use-package company-lsp)

;; ----------- RUST CONFIG START -----------
(use-package toml-mode :defer t)

(use-package rust-mode
  :defer t
  :hook (rust-mode . lsp))

;; Add keybindings for interacting with Cargo
(use-package cargo
  :defer t
  :hook (rust-mode . cargo-minor-mode))

(use-package flycheck-rust
  :defer t
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; ----------- RUST CONFIG END --------------

(use-package markdown-mode :defer t)

;; scroll only 1 line at a time instead of half a page.
(use-package smooth-scrolling
  :defer t
  :custom
  (smooth-scrolling-mode 1))

(use-package magit :defer t)

(use-package evil-visual-mark-mode :defer t)

;; ------------------------------ THEMES ---------------------------------
;; Use :init (load-theme ...) on the theme you want to set to default (see below)

(use-package gotham-theme
  :ensure t
  :init
  (load-theme 'gotham t))

;; ------------------------ PACKAGE LIST END ------------------------------

;;; packages.el ends here
