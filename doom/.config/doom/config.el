;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:

(setq doom-font (font-spec :family "JetBrains Mono" :size 13 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Noto Sans" :size 13))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)
(custom-set-faces!
  `(solaire-default-face :background "#000000")
  `(default :background "#000000"))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(fset 'rainbow-delimiters-mode #'ignore)

(setq-default scroll-margin 10
              tab-width 2)

(map!
 :n
 "C-SPC" nil
 "C-SPC" #'dabbrev-expand)

(after! projectile
  (setq projectile-project-search-path '("~/projects"))
  (projectile-discover-projects-in-search-path))

;; (defun sz/project-bookmark-name (name)
;;   "Generate a project-scoped bookmark name using NAME."
;;   (let ((project (projectile-project-name)))
;;     (format "%s::%s" project name)))

;; (defun sz/set-project-bookmark (name)
;;   "Set a bookmark named NAME scoped to the current project."
;;   (interactive "sBookmark name: ")
;;   (bookmark-set (sz/project-bookmark-name name)))

;; (defun sz/jump-to-project-bookmark (name)
;;   "Jump to a project-scoped bookmark."
;;   (interactive "sBookmark name: ")
;;   (bookmark-jump (sz/project-bookmark-name name)))

;; (defun sz/vertico-project-bookmark-jump ()
;;   "Use Vertico to jump to a bookmark scoped to the current project."
;;   (interactive)
;;   (let* ((project (projectile-project-name))
;;          (prefix (concat project "::"))
;;          (matches (seq-filter (lambda (bm)
;;                                 (string-prefix-p prefix (car bm)))
;;                               (bookmark-maybe-sort-alist))))
;;     (if matches
;;         (let* ((choices (mapcar (lambda (bm)
;;                                   (string-remove-prefix prefix (car bm)))
;;                                 matches))
;;                (selection (completing-read "Project bookmark: " choices)))
;;           (bookmark-jump (concat prefix selection)))
;;       (message "No bookmarks found for project: %s" project))))

;; (map!
;;  :leader
;;  :map projectile-mode-map
;;  :n
;;  "RET" (cmd!
;;         (when (projectile-project-p)
;;           (sz/vertico-project-bookmark-jump)))))

(after! lsp-mode
  (setq lsp-ui-doc-enable nil
        lsp-lens-enable nil
        lsp-headerline-breadcrumb-enable nil
        lsp-ui-sideline-enable nil
        lsp-diagnostics-provider :none
        lsp-modeline-diagnostics-enable nil))

(remove-hook 'doom-first-buffer-hook #'global-flycheck-mode)
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

(after! flycheck
  (global-flycheck-mode -1))

(after! smartparens
  (smartparens-global-mode -1))

(after! evil
  (map!
   :nv
   "C-u" (cmd!
          (evil-scroll-up nil)
          (evil-scroll-line-to-center nil))
   :nv
   "C-d" (cmd!
          (evil-scroll-down nil)
          (evil-scroll-line-to-center nil))))

(setq-default fill-column 100)
(global-display-fill-column-indicator-mode)
