;;; ini-mode.el --- Simple major mode for editing Windows INI files

;; Copyright (C) 2001 by Aurélien Tisné
;; Author: Aurélien Tisné <aurelien.tisne@c-s.fr>
;; Created: May 05 2001
;; Keywords: windows ini

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.


;;; Commentary:
;;
;; This mode is designed to edit windows INI files. 
;; (Yes. Some work on Windows. ;-)
;; It is widely inspired by the bat-mode of 
;; Peter Breton <pbreton@i-kinetics.com>. Thanks to him.
;;

;; Usage:
;;
;; Byte-compile this file, and add the following line to your
;; emacs initialization file (.emacs/_emacs):
;; 
;; (setq auto-mode-alist 
;;       (append 
;;        '(("\\.[iI][nN][iI]$" . 'ini-mode))
;;        auto-mode-alist))

;; Support:
;;
;;  Any comments, suggestions, bug reports or upgrade requests are welcome.
;;
;;  This version of show-whitespace was developed with NTEmacs 21.1.1 
;;  under MS Windows XP.
;;  Please, let me know if it works with other OS and versions of Emacs.


;;; Code:

;; Variables:

(defvar ini-mode-map (make-sparse-keymap) "Local keymap for ini-mode buffers.")

(defvar ini-mode-comment-start ";"
  "Comment string to use in ini-mode buffers.")

(defvar ini-mode-syntax-table (make-syntax-table)
  "Syntax table in use in ini-mode buffers.")

(defvar ini-font-lock-keywords
  '(
     ; comments
     (";.*" . 'font-lock-comment-face)
     ; sections
     ("\\[\\(.*\\)\\]" 1 'font-lock-function-name-face)
     ; couples var=val
     ("\\(.*\\)="      1 'font-lock-variable-name-face)
  )
  "Keywords to hilight in INI mode")

;; Make underscores count as words
(if ini-mode-syntax-table
    ()
  (setq ini-mode-syntax-table (make-syntax-table))
  (modify-syntax-entry ?_  "w"  ini-mode-syntax-table)
)


;;;###autoload
(defun ini-mode ()
  "Mode for Windows INI files"
  (interactive)
  (kill-all-local-variables)
  (use-local-map             ini-mode-map)
  (set-syntax-table          ini-mode-syntax-table)

  (make-local-variable       'parse-sexp-ignore-comments)
  (make-local-variable       'comment-start)
  (make-local-variable       'comment-start-skip)
  (make-local-variable       'comment-end)
  (make-local-variable       'executable-command)

  (setq major-mode          'ini-mode
        mode-name           "ini"

        comment-end         ""
        comment-start       ini-mode-comment-start
        comment-start-skip  ";+ *"

        parse-sexp-ignore-comments t

        )

  ;; enable imenu feature
  (setq imenu-generic-expression
        '((nil "\\[\\(.*\\)\\]" 1)))
  (imenu-add-menubar-index)

  (run-hooks 'ini-mode-hook)
)


 ;; font lock support
 (if (boundp 'font-lock-defaults-alist)
     (add-to-list
      'font-lock-defaults-alist 
      (cons 'ini-mode
            (list 'ini-font-lock-keywords nil t nil nil))))


(provide 'ini-mode)


;;; ini-mode.el ends here
