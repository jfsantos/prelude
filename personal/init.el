;; Add support for knit and purl
(add-to-list 'load-path "~/.emacs.d/personal/")
(add-to-list 'load-path "~/.emacs.d/personal/o-blog")
(require 'ess-knitr)
(require 'o-blog)
(require 'org-exp-bibtex)

;; LaTeX configuration
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)

;; Setting up SumatraPDF as default reader and configuring SyncTeX
(setq TeX-source-correlate-method (quote synctex))
(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-start-server t)
(setq TeX-view-program-list '(("SumatraPDF" "\"C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe\" -reuse-instance %o")))
(setq TeX-view-program-selection '((output-pdf "SumatraPDF")))
(require 'sumatra-forward)

;; Setting up RefTeX
(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
  )
(add-hook 'org-mode-hook 'org-mode-reftex-setup)
