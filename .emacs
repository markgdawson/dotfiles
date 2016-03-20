(load "package")
(package-initialize)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(setq package-archive-enable-alist '(("melpa" deft magit)))

(setq package-enable-at-startup nil)
(package-initialize)

;; make the fringe stand out from the background
(setq solarized-distinct-fringe-background t)

;; Don't change the font for some headings and titles
(setq solarized-use-variable-pitch nil)

;; make the modeline high contrast
(setq solarized-high-contrast-mode-line t)

;; Use less bolding
(setq solarized-use-less-bold t)

;; Use more italics
(setq solarized-use-more-italic t)

;; Use less colors for indicators such as git:gutter, flycheck and similar
(setq solarized-emphasize-indicators nil)

;; Don't change size of org-mode headlines (but keep other size-changes)
(setq solarized-scale-org-headlines nil)

;; Avoid all font-size changes
(setq solarized-height-minus-1 1)
(setq solarized-height-plus-1 1)
(setq solarized-height-plus-2 1)
(setq solarized-height-plus-3 1)
(setq solarized-height-plus-4 1)

;; Set scroll bar off
(scroll-bar-mode -1)

;; load solarized-dark
(load-theme 'solarized-dark t)

;; disable toolbar
(tool-bar-mode -1)

;load a file named key-chord.el from some directory in the load-path (e.g. "~/.emacs.d")
(evil-mode t)
(require 'key-chord)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode 1)

; Latex Changes
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq TeX-PDF-mode t)
(setq-default TeX-master nil)
(require 'latex-pretty-symbols)

(setenv "PATH" (concat "/usr/texbin:/usr/local/bin:" (getenv "PATH")))
(setq exec-path (append '("/usr/texbin" "/usr/local/bin") exec-path))
;;(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

;;; Flymake for latex
;; (require 'flymake)
;; (defun flymake-get-tex-args (file-name)
;; (list "pdflatex"
;; (list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))
;; (add-hook 'LaTeX-mode-hook 'flymake-mode)
;; 
;; ;;; Flymake
;; (setq ispell-program-name "aspell") ; could be ispell as well, depending on your preferences
;; (setq ispell-dictionary "english") ; this can obviously be set to any language your spell-checking program supports
;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; (add-hook 'LaTeX-mode-hook 'flyspell-buffer)

;;; Reftex mode
;;; C-c = -> shows outline
;; (require 'tex-site)
;; (autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
;; (autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
;; (autoload 'reftex-citation "reftex-cite" "Make citation" nil)
;; (autoload 'reftex-index-phrase-mode "reftex-index" "Phrase Mode" t)
;; (add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
;; ;; (add-hook 'reftex-load-hook 'imenu-add-menubar-index)
;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; (setq LaTeX-eqnarray-label "eq"
;; LaTeX-equation-label "eq"
;; LaTeX-figure-label "fig"
;; LaTeX-table-label "tab"
;; LaTeX-myChapter-label "chap"
;; TeX-auto-save t
;; TeX-newline-function 'reindent-then-newline-and-indent
;; TeX-parse-self t
;; TeX-style-path
;; '("style/" "auto/"
;; "/usr/share/emacs21/site-lisp/auctex/style/"
;; "/var/lib/auctex/emacs21/"
;; "/usr/local/share/emacs/site-lisp/auctex/style/")
;; LaTeX-section-hook
;; '(LaTeX-section-heading
;; LaTeX-section-title
;; LaTeX-section-toc
;; LaTeX-section-section
;; LaTeX-section-label))

; Query for master file.
(setq-default TeX-master nil)

; inhibit initial startup screen
(setq inhibit-startup-screen t)

(defun display-startup-echo-area-message ()
  (message "Let the hacking begin!"))

; Allow more than 800KiB in the cache before we start swapping
(setq gc-cons-threshold 50000000)

; Fix line number mode (fails when line is too long)
(setq line-number-display-limit-width 10000)

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;org-mode configuration
;; Enable org-mode
(require 'org)
;; Make org-mode work with files ending in .org
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen

;; Turn on outline mode for Latex
;;; ->  C-c C-o C-l -> fold
;;; move to a next unit of your document with C-c C-o C-n
;;; or to a previous one with C-c C-o C-p.
;;; If you’re lost and want to see the whole document again, use C-c C-o C-a.
(defun turn-on-outline-minor-mode ()
(outline-minor-mode 1))
(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
(setq outline-minor-mode-prefix "C-c C-o") ; Or something else


;; Setting up matlab-mode
;; (add-to-list 'load-path "~/.emacs.d/personal/matlab-emacs")
;; (autoload "matlab-load" "matlab" "Matlab Editing Mode" t)
;; (add-to-list
 ;; 'auto-mode-alist
 ;; '("\\.m$" . matlab-mode))
;; (setq matlab-indent-function t)
;; (setq matlab-shell-command "matlab")

;; Helm config
(require 'helm)
(require 'helm-config)
(helm-mode 1)
