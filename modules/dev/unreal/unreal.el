;; Helper commands for working on Ureal Engine projects
(require 'thingatpt)

(defun unreal-help-at-point ()
	"Opens the Unreal Documentation search page for the symbol at point"
	(interactive)
	(browse-url
	 (format
		"https://www.unrealengine.com/bing-search?keyword=%s&filter=Documentation&x=0&y=0"
		(symbol-at-point))))

(defun unreal-open-source-file (file)
	"Opens an unreal source file relative to the unreal-source-path variable"
	(interactive "sUnreal Source File: ")
	(find-file (concat unreal-source-path "/" file))
	(toggle-read-only))

