;;; config.el --- Summary
;; All the configuration options for the modes present by default

;;; Commentary:

;;; Code:

;; set default font family and size
(add-to-list 'default-frame-alist '(font . "agave Nerd Font Mono-13"))

;; Show row and column in modeline
(column-number-mode 1)

;; Disable Toolbar in GUI mode
(tool-bar-mode -1)

;; globally add line numbers to gutter
;; Emacs 26+ has a new line numbers mode
(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode t))

;; Set window height and width on startup
(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 150))

;;; config.el ends here
