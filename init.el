(require 'package)
(package-initialize)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-refresh-contents)

(defvar myPackages
  '(better-defaults
    material-theme
    neotree
    py-autopep8
    elpy
    ein
    flycheck))
(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)


(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(setq elpy-rpc-python-command "/Users/theofpa/anaconda/bin/python")
;;(setq elpy-syntax-check-command "/Users/theofpa/anaconda/bin/flake8")
(elpy-enable)
(elpy-use-ipython "/Users/theofpa/anaconda/bin/ipython")

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
(setenv "IPY_TEST_SIMPLE_PROMPT" "1")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck elpy neotree material-theme better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
