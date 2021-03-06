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

(defun cpp-class-name-in-buffer ()
	"Searches for the class name by using the buffer name and other declarations
   present in the buffer. This helps detect class names using prefixes (such as
   unreal classes) that differ from the file name"
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

(defun tags-file-structure ()
	"Lists symbols in current buffer"
	(interactive)
	(list-tags (file-name-nondirectory (buffer-file-name))))

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "C-d") 'duplicate-line)
(global-set-key (kbd "C-x ~") 'set-window-width-80)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-x C-z") 'undo)
(global-set-key (kbd "M-o") 'ff-find-other-file)
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-<f12>") 'tags-file-structure)

;; Clang format
(global-set-key (kbd "C-M-l") 'clang-format-buffer)

;; Unreal help at point
(global-set-key (kbd "C-?") 'unreal-help-at-point)
(global-set-key (kbd "C-|") 'unreal-open-source-file)

(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key (kbd "C-S-<up>") 'move-line-up)
(global-set-key (kbd "C-S-<down>") 'move-line-down)
