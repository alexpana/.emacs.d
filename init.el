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

;; Darcula theme
;; (load (expand-file-name "darcula-theme.el" user-emacs-directory))
;; (set-frame-font "FiraCode Medium 10")
(set-frame-font "Fira Code 10" nil t)

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

;; Set tab width = 4
(setq-default tab-width 2)

;; Use c++ mode for headers
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Setup line highlighting
(global-hl-line-mode 0)
(set-face-attribute hl-line-face nil :underline nil)

;; Save all backups in the OS temp folder
(setq backup-directory-alist
			`((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
			`((".*" ,temporary-file-directory t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(package-selected-packages
	 (quote
		(yasnippet-snippets yasnippet powerline helm magit company))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
