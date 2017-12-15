(require 'package)

;;(add-to-list 'package-archives
;;             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

;;(add-to-list 'package-archives
;;             '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

;; required packages declaration
(setq package-list '(company magit helm org powerline org-bullets
														 yasnippet))

;; activate all the packages
(package-initialize)

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Configurations
;; Helm
(require 'helm-config)

;; org-bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; powerline
;;;###autoload

(setq powerline-default-separator 'contour)

;; (face-spec-set 'powerline-active-1 '((t (:background "#5A80CD" :inherit mode-line))))

(defface powerline-active-a '((t (:background "#5A80CD" :inherit mode-line))) "Powerline face 1." :group 'powerline)
(defface powerline-active-b '((t (:background "#5A5BCD" :inherit mode-line))) "Powerline face 1." :group 'powerline)
(defface powerline-active-c '((t (:background "#5A80CD" :inherit mode-line))) "Powerline face 1." :group 'powerline)
(defface powerline-inactive-a '((t (:background "#5A80CD" :inherit mode-line))) "Powerline face 1." :group 'powerline)
(defface powerline-inactive-b '((t (:background "#5A80CD" :inherit mode-line))) "Powerline face 1." :group 'powerline)
(defface powerline-inactive-c '((t (:background "#5A80CD" :inherit mode-line))) "Powerline face 1." :group 'powerline)

;; second
(face-spec-set 'powerline-active-a '((t (:background "#495FA4" :inherit mode-line))))
;; last
(face-spec-set 'powerline-active-b '((t (:background "#5a80cd" :inherit mode-line))))
;; first
(face-spec-set 'powerline-active-c '((t (:background "#374e94" :inherit mode-line))))

(face-spec-set 'powerline-inactive-a '((t (:background "#41397D" :inherit mode-line))))
(face-spec-set 'powerline-inactive-b '((t (:background "#41396D" :inherit mode-line))))
(face-spec-set 'powerline-inactive-c '((t (:background "#41396D" :inherit mode-line))))

(defun powerline-custom-theme ()
  "Setup the default mode-line."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line-buffer-id (if active 'powerline-active-c 'powerline-inactive-c))
                          (mode-line (if active 'powerline-active-c 'powerline-inactive-c))
                          (face1 (if active 'powerline-active-a 'powerline-inactive-a))
                          (face2 (if active 'powerline-active-b 'powerline-inactive-b))
													
                          (separator-left (intern (format "powerline-%s-%s"
																													(powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           (powerline-current-separator)
                                                           (cdr powerline-default-separator-dir))))
													
                          (lhs (list (powerline-raw "%*" mode-line 'l)
                                     (powerline-buffer-id mode-line-buffer-id 'l)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format nil 'l))
                                     (powerline-raw " " mode-line)
                                     (funcall separator-left mode-line face1)
																		 (powerline-process face1)
																		 
                                     (when (and (boundp 'erc-track-minor-mode) erc-track-minor-mode)
                                       (powerline-raw erc-modified-channels-object face1 'l))
																		 
                                     (powerline-major-mode face1 'l)
                                     ;; (powerline-narrow face1 'l)
                                     (powerline-raw " " face1)
                                     (funcall separator-left face1 face2)
                                     ;; (powerline-vc face2 'r)
																		 
                                     (when (bound-and-true-p nyan-mode) (powerline-raw (list (nyan-create)) face2 'l))
																		 ))
                          (rhs (list (powerline-raw global-mode-string face2 'r)
																		 (powerline-vc face2 'r)
																		 (funcall separator-right face2 face1)
																		 (unless window-system
																			 (powerline-raw (char-to-string #xe0a1) face1 'l))
																		 (powerline-raw " %4l:%3c %p" face1 'r)
																		 )))
										 (concat (powerline-render lhs)
										 				 (powerline-fill face2 (powerline-width rhs))
														 (powerline-render rhs)))))))

(powerline-custom-theme)
