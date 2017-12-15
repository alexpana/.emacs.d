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

;; Searches for the class name by using the buffer name and other declarations
;; present in the buffer. This helps detect class names using prefixes (such as
;; unreal classes) that differ from the file name
(defun cpp-class-name-in-buffer ()
	(interactive)
	(save-excursion
		(isearch-forward nil 1)
		(isearch-yank-string
		 (file-name-nondirectory
			(file-name-sans-extension (buffer-file-name))))
		(isearch-exit)
		(backward-sexp)
		(push-mark)
		(forward-sexp)
		(buffer-substring-no-properties (region-beginning) (region-end))))

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "C-d") 'duplicate-line)
(global-set-key (kbd "C-x ~") 'set-window-width-80)
(global-set-key (kbd "C-M-l") 'clang-format-buffer)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-x C-z") 'undo)
