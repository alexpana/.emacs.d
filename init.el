(package-initialize)

;; Load user modules
(load "~/.emacs.d/modules/dev/unreal/unreal.el")
(load "~/.emacs.d/modules/dev/clang-format/clang-format.el")

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

;; Always truncate lines
(set-default 'truncate-lines t)

;; Enable line numbers
(global-display-line-numbers-mode)

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

;; Git gutter
(global-git-gutter-mode +1)
(set-face-background 'git-gutter:modified "#356F9B")
(set-face-background 'git-gutter:added "#7DC75C")
(set-face-background 'git-gutter:deleted "#B9433")

;; No tabs when indenting
(setq indent-tabs-mode nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (gruvbox)))
 '(custom-safe-themes
   (quote
    ("cd4d1a0656fee24dc062b997f54d6f9b7da8f6dc8053ac858f15820f9a04a679" "d411730c6ed8440b4a2b92948d997c4b71332acf9bb13b31e9445da16445fe43" default)))
 '(git-gutter:added-sign " ")
 '(git-gutter:deleted-sign " ")
 '(git-gutter:modified-sign " ")
 '(org-agenda-files (quote ("~/org/personal.org")))
 '(package-selected-packages
   (quote
    (go-mode gruvbox-theme git-gutter neotree yasnippet-snippets yasnippet powerline helm magit company))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
