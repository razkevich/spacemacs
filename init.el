;;; init.el --- Spacemacs Initialization File
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; Without this comment emacs25 adds (package-initialize) here
;; (package-initialize)

(setq gc-cons-threshold 100000000)
;; Increase gc-cons-threshold, depending on your system you may set it back to a
;; lower value in your dotfile (function `dotspacemacs/user-config')

(defconst spacemacs-version         "0.200.13" "Spacemacs version.")
(defconst spacemacs-emacs-min-version   "24.4" "Minimal version of Emacs.")

(if (not (version<= spacemacs-emacs-min-version emacs-version))
    (error (concat "Your version of Emacs (%s) is too old. "
                   "Spacemacs requires Emacs version %s or above.")
           emacs-version spacemacs-emacs-min-version)
  (load-file (concat (file-name-directory load-file-name)
                     "core/core-load-paths.el"))
  (require 'core-spacemacs)
  (spacemacs/init)
  (configuration-layer/sync)
  (spacemacs-buffer/display-startup-note)
  (spacemacs/setup-startup-hook)
  (require 'server)
  (unless (server-running-p) (server-start)))



(defun copy-line ()
  "Copies a line"
  (interactive)
  (move-beginning-of-line 1)
  (kill-line 1)
  (yank)
  (yank)
  (setq kill-ring (cdr kill-ring)))

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

(setq mac-command-modifier 'super)
(global-set-key (kbd "s-S-<up>") 'move-text-line-up)
(global-set-key (kbd "s-S-<down>") 'move-text-line-down)
(global-set-key (kbd "s-d") 'copy-line)
(global-set-key (kbd "s-w") 'er/expand-region)
(global-set-key (kbd "s-y") 'kill-whole-line)
(global-set-key (kbd "s-/") 'spacemacs/comment-or-uncomment-lines)
(global-set-key (kbd "s-z") 'undo)
(global-set-key (kbd "s-S-y") 'redo)
(global-set-key (kbd "s-t") 'treemacs)
(global-set-key (kbd "s-~") 'other-window)
(set-face-attribute 'default nil  :height 150)
