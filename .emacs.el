;;; package --- my/emacs

;;; Commentary:
;; My Emacs settings

;;; Code:
(desktop-save-mode 1)

; Add MELPA repository
(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-generic-program "open")
 '(custom-safe-themes
   (quote
    ("c51345f0b4464f4b294d6fe26efc3df71c25e9af64e2fac0bb974d6d5643a127" default)))
 '(dante-methods-alist
   (quote
    ((stack "stack.yaml"
	    ("stack" "repl" dante-target)))))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/")
     ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))))
 '(package-selected-packages (quote (flycheck vs-dark-theme haskell-mode))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "Black" :foreground "gray95" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Monaco")))))

(load-theme 'vs-dark)

(add-to-list 'exec-path "/usr/local/bin")

(add-to-list 'exec-path "~/.local/bin")

(use-package dante
  :ensure t
  :after haskell-mode
  :commands 'dante-mode
  :init
  (add-hook 'haskell-mode-hook 'dante-mode)
  ;; (add-hook 'haskell-mode-hook 'flycheck-mode)
  )

(global-set-key (kbd "C-:") 'haskell-search-hoogle)

(defun haskell-search-hoogle ()
  "Search hoogle for the word under the cursor."
  (interactive)
  (browse-url-generic
    (concat "https://hoogle.haskell.org/?hoogle="
            (buffer-substring-no-properties (region-beginning) (region-end)))))

(provide 'emacs)
;;; .emacs ends here
