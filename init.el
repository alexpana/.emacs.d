(package-initialize)

(load "~/.emacs.d/init-packages.el")
(load "~/.emacs.d/init-keybindings.el")

;; Hide splash-screen and startup-message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; disable extra UI
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)

;; enable powerline
(powerline-default-theme)

;; Darcula theme
;; (load (expand-file-name "darcula-theme.el" user-emacs-directory))
;; (set-frame-font "FiraCode Medium 10")
(set-frame-font "Fira Code Medium 11" nil t)

;; Enable line numbers
;; (global-linum-mode t)

;; Enable standard keyboard shortcuts for copy / paste
;;(cua-mode 1)

;; Automatically insert close bracket
(electric-pair-mode 1)

;; Turn on paren match highlighting
(show-paren-mode 1)

;; Wrap on whitespace
(global-visual-line-mode 1)

;; Highlight cursor line
;; (global-hl-line-mode 1)

;; Set tab width = 4
(setq-default tab-width 2)

(custom-set-variables
 '(custom-enabled-themes (quote (wombat)))
 '(package-selected-packages (quote (powerline helm magit company))))

(custom-set-faces
 )
