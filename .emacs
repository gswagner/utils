;;(menu-bar-mode -1)
;;(global-set-key (kbd "C-c q") 'auto-fill-mode)
;;(setq-default fill-column 80)
;;(add-hook 'text-mode-hook' longlines-mode)
;; basic display sets
(setq inhibit-splash-screen t)
(tool-bar-mode -1)
(add-hook 'text-mode-hook' visual-line-mode)
(set-face-attribute 'default nil :height 95)

;; customization for regexp search
(defalias 'qr 'query-replace)
(defalias 'qrr 'query-replace-regexp)
(global-set-key "\M-s" 'isearch-forward-regexp)
(global-set-key "\M-r" 'isearch-backward-regexp)

;; setup custom for latex
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
(setq TeX-PDF-mode t)

;; setup custom for python
(setq auto-mode-alist (cons '("\\.sage\\'" . python-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.pyx\\'" . python-mode) auto-mode-alist))
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'column-number-mode)
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 72)))
(global-set-key "\C-cs" `hs-toggle-hiding)

;;; Set location for external packages
;; (add-to-list 'load-path "~/.emacs.d")
;; (load-library "cython_mode.el")
;; (load "cython-mode.el")
;; (require 'cython-mode)

;; setup for c++
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(setq c-default-style "linux" c-basic-offset 2)

(put 'upcase-region 'disabled nil)


;; ;; Try out auto-complete
;; (require 'auto-complete-config)
;; (ac-config-default)


;; Configure MELPA to try to get better package managment
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;; automatic package managment
;; from https://bigmac.caelum.uberspace.de/paste/ensure-package-installed.html
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.
Return a list of installed packages or nil for every package not installed."
  (mapcar
   (lambda (package)
     (package-installed-p 'evil)
     (if (package-installed-p package)
         package
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         nil)))
   packages))
(ensure-package-installed 'auctex 'auctex-latexmk 'protobuf-mode 'cython-mode 'column-marker)

;; ;; Use the multicolumn library
;; (require 'andersl-old-emacs-support)
;; (require 'multicolumn)
;; ;; New function to generate 2 standard sized windows
;; (defun two () (multicolumn-resize-and-split-frame 80 2))
;; (defun three () (multicolumn-resize-and-split-frame 80 3))

;; Disable funky handling of << in bash mode
(add-hook 'sh-mode-hook (lambda () (sh-electric-here-document-mode -1)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-start-server t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
