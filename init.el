;; init.el --- Emacs configuration

;; utf-8
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

;; Setting line numbers to all files
(global-linum-mode 1)

;; replace tabs with 4 space
(setq-default indent-tabs-mode nil)
(add-hook 'after-change-major-mode-hook 
          '(lambda () 
             (setq-default indent-tabs-mode nil)
             (setq c-basic-indent 4)
             (setq tab-width 4)))


;; Set C style to linux
(setq c-default-style "linux"
      c-basic-offset 4)


;; Disable the gaudy colors in shell
(setq ansi-color-names-vector		; better contrast colors
      ["black" "red4" "chartreuse4" "goldenrod3"
       "DodgerBlue4" "magenta4" "cyan4" "white"])
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


;; INSTALL PACKAGES
;; --------------------------------------


(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    elpy
    flycheck
    material-theme
    py-autopep8))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

;; enable elpy
(elpy-enable)

;; (setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally

;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" default)))
 '(package-selected-packages
   (quote
    (sublime-themes material-theme better-defaults dict-tree coffee-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
