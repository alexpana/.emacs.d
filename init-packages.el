(require 'package)

;(add-to-list 'package-archives
;             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

;; required packages declaration
(setq package-list '(company magit helm org powerline))

;; activate all the packages
(package-initialize)

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; load the packages
(require 'helm-config)
