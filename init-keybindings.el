(load "~/.emacs.d/modules/dev/clang-format/clang-format.el")

(defun duplicate-line ()
  "Duplicate current line"
  (interactive)
  (kill-whole-line)
  (yank)
  (yank)
	(previous-line))

(defun set-window-width (n)
  "Set the selected window's width."
  (adjust-window-trailing-edge (selected-window) (- n (window-width)) t))

(defun set-window-width-80 ()
  "Set the selected window's width to 80 columns."
	(interactive)
	(set-window-width 80))

(defun indent-buffer ()
	(interactive)
	(save-excursion
		(indent-region (point-min) (point-max) nil)))

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "C-d") 'duplicate-line)
(global-set-key (kbd "C-x ~") 'set-window-width-80)
(global-set-key (kbd "C-M-l") 'clang-format-buffer)
