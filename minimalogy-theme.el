;;; minimalogy-theme.el --- Minimalogy: an GNU Emacs theme with multiple color schemes, with a reduced color count.
;; Author: laooree

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; Minimalogy: a theme with multiple color schemes, with a reduced color count.
;; Understory, the flagship color, is heavily based on Miasma theme, by Bozidar Dautovic.

;;; Code:

(deftheme minimalogy
  "A theme with multiple color schemes, with a reduced color count.")

(defgroup minimalogy-theme nil
  "Minimalogy theme"
  :group nil)

(defcustom minimalogy-color-scheme 'understory
  "Current color Minimalogy scheme."
  :type '(choice
          (const :tag "Understory" understory))
  :group 'minimalogy-theme)

(defconst minimalogy-palettes
  '((understory
     :bg    "#202020"
     :bg1   "#151515"
     :bg2   "#303030"
     :bgc   "#2a3c2a"
     :fg    "#e4e4e4"
     :fg1   "#f6f6f6"
     :pl    "#666666"
     :ac1   "#709970"
     :ac2   "#a69b5b")
    ))


(defcustom minimalogy-bg "#202020"
  "Minimalogy background color."
  :type 'color :group 'minimalogy-theme)

(defcustom minimalogy-bg1 "#151515"
  "Minimalogy intense background color."
  :type 'color :group 'minimalogy-theme)

(defcustom minimalogy-bg2 "#303030"
  "Minimalogy mild background color."
  :type 'color :group 'minimalogy-theme)

(defcustom minimalogy-bgc "#2a3c2a"
  "Minimalogy accent-colored background color."
  :type 'color :group 'minimalogy-theme)

(defcustom minimalogy-pl "#666666"
  "Minimalogy pale color."
  :type 'color :group 'minimalogy-theme)

(defcustom minimalogy-fg "#e4e4e4"
  "Minimalogy foreground color."
  :type 'color :group 'minimalogy-theme)

(defcustom minimalogy-fg1 "#f6f6f6"
  "Minimalogy intense foreground color."
  :type 'color :group 'minimalogy-theme)

(defcustom minimalogy-ac1 "#709970"
  "Minimalogy first accent color."
  :type 'color :group 'minimalogy-theme)

(defcustom minimalogy-ac2 "#a69b5b"
  "Minimalogy second accent color."
  :type 'color :group 'minimalogy-theme)

(defface minimalogy-default
  '((t nil))
  "Base face for normal text."
  :group 'minimalogy-theme)

(defface minimalogy-default-i
  '((t nil))
  "Inverted minimalogy-default face."
  :group 'minimalogy-theme)

(defface minimalogy-key
  '((t nil))
  "Face for key elements."
  :group 'minimalogy-theme)

(defface minimalogy-key-i
  '((t nil))
  "Inverted minimalogy-key face."
  :group 'minimalogy-theme)

(defface minimalogy-strong
  '((t nil))
  "Face for strong text."
  :group 'minimalogy-theme)

(defface minimalogy-subtle
  '((t nil))
  "Face for highlighting regions."
  :group 'minimalogy-theme)

(defface minimalogy-popout
  '((t nil))
  "Face for elements needing attention."
  :group 'minimalogy-theme)

(defface minimalogy-critical
  '((t nil))
  "Face for elements needing immediate attention."
  :group 'minimalogy-theme)

(defface minimalogy-pale
  '((t nil))
  "Face for elements with lower importance."
  :group 'minimalogy-theme)

(defface minimalogy-pale-i
  '((t nil))
  "Inverted minimalogy-pale face."
  :group 'minimalogy-theme)

(defun minimalogy-load-colors-and-faces ()
  "Load colors for the current color scheme."
  (let ((palette (cdr (assoc minimalogy-color-scheme minimalogy-palettes))))
    (setq minimalogy-bg   (plist-get palette :bg)
          minimalogy-bg1  (plist-get palette :bg1)
          minimalogy-bg2  (plist-get palette :bg2)
          minimalogy-bgc  (plist-get palette :bgc)
          minimalogy-pl   (plist-get palette :pl)
          minimalogy-fg   (plist-get palette :fg)
          minimalogy-fg1  (plist-get palette :fg1)
          minimalogy-ac1  (plist-get palette :ac1)
          minimalogy-ac2  (plist-get palette :ac2)))

  (set-face-attribute 'minimalogy-default nil
                      :foreground minimalogy-fg
                      :background minimalogy-bg)
  (set-face-attribute 'minimalogy-default-i nil
                      :foreground minimalogy-bg
                      :background minimalogy-fg)
  (set-face-attribute 'minimalogy-strong nil
                      :foreground minimalogy-fg1
                      :weight 'bold)
  (set-face-attribute 'minimalogy-pale nil
                      :foreground minimalogy-pl)
  (set-face-attribute 'minimalogy-pale-i nil
                      :background minimalogy-pl
                      :foreground minimalogy-bg)
  (set-face-attribute 'minimalogy-key nil
                      :foreground minimalogy-ac1)
  (set-face-attribute 'minimalogy-key-i nil
                      :background minimalogy-ac1
                      :foreground minimalogy-bg)
  (set-face-attribute 'minimalogy-popout nil
                      :foreground minimalogy-ac2)
  (set-face-attribute 'minimalogy-subtle nil
                      :background minimalogy-bg2)
  )

(defun minimalogy-apply-theme ()
  "Apply current color scheme."
  (interactive)

  ;; Load colors and faces
  (minimalogy-load-colors-and-faces)

  ;; Apply theme
  (custom-theme-set-faces
   'minimalogy

   ;;;;;;;;;;;;;;;;;;;;;;;
   ;;;;; Theme faces ;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;

   ;;;;; Basic ;;;;;
   `(default           ((t (:background ,minimalogy-bg :foreground ,minimalogy-fg))))
   `(cursor            ((t (:background ,minimalogy-fg :foreground ,minimalogy-bg))))
   `(mouse             ((t (:background ,minimalogy-bg :foreground ,minimalogy-fg))))
   `(highlight         ((t (:background ,minimalogy-bgc :foreground ,minimalogy-fg))))
   `(bold              ((t (:inherit minimalogy-strong))))
   `(italic            ((t (:inherit minimalogy-pale))))
   `(region            ((t (:inherit minimalogy-subtle :foreground ,minimalogy-fg))))
   '(fringe            ((t (:inherit minimalogy-subtle))))
   '(hl-line           ((t (:inherit minimalogy-subtle))))
   '(link              ((t (:inherit minimalogy-key :underline t))))
   '(fixed-pitch       ((t (:inherit default))))
   '(fixed-pitch-serif ((t (:inherit default))))


   ;;;;; Mode line ;;;;;
   `(mode-line           ((t (:background ,minimalogy-bgc :foreground ,minimalogy-fg))))
   `(mode-line-active    ((t (:background ,minimalogy-bgc :foreground ,minimalogy-fg))))
   `(mode-line-highlight ((t (:inherit minimalogy-popout))))
   `(mode-line-buffer-id ((t (:weight regular))))
   `(mode-line-emphasis  ((t (:weight regular))))

   `(mode-line-inactive    ((t (:background ,minimalogy-bg2 :foreground ,minimalogy-pl))))


   ;;;;; Semantic ;;;;;
   `(shadow  ((t (:inherit minimalogy-pale))))
   `(success ((t (:inherit minimalogy-key))))
   `(warning ((t (:inherit minimalogy-popout))))
   `(error   ((t (:inherit minimalogy-critical))))
   `(match   ((t (:inherit minimalogy-popout))))


   ;;;;; Generic ;;;;;
   `(buffer-menu-buffer            ((t (:inherit minimalogy-strong))))
   `(minibuffer-prompt             ((t (:inherit minimalogy-strong))))
   `(isearch                       ((t (:inherit minimalogy-strong))))
   `(isearch-fail                  ((t (:inherit minimalogy-pale))))
   `(show-paren-match              ((t (:inherit minimalogy-strong))))
   `(show-paren-mismatch           ((t (:inherit minimalogy-critical))))
   `(lazy-highlight                ((t (:inherit minimalogy-subtle))))
   `(trailing-whitespace           ((t (:inherit minimalogy-subtle))))
   `(secondary-selection           ((t (:inherit minimalogy-subtle))))
   `(completions-annotations       ((t (:inherit minimalogy-pale))))
   `(completions-common-part       ((t (:inherit minimalogy-strong))))
   `(completions-first-difference  ((t (:inherit minimalogy-default))))
   `(tooltip                       ((t (:inherit minimalogy-subtle))))
   `(read-multiple-choice-face     ((t (:inherit minimalogy-strong))))
   `(nobreak-hyphen                ((t (:inherit minimalogy-popout))))
   `(nobreak-space                 ((t (:inherit minimalogy-popout))))
   `(help-argument-name            ((t (:inherit minimalogy-pale))))
   `(tabulated-list-fake-header    ((t (:inherit minimalogy-strong))))
   `(tool-bar                      ((t (:inherit minimalogy-pale-i))))


   ;;;;; tty ;;;;;
   `(tty-menu-disabled-face        ((t (:inherit minimalogy-pale-i))))
   `(tty-menu-enabled-face         ((t (:inherit minimalogy-default-i))))
   `(tty-menu-selected-face        ((t (:inherit minimalogy-key-i))))


   ;;;;; tab bar ;;;;;
   `(tab-bar                       ((t (:inherit default))))
   `(tab-bar-tab                   ((t (:inherit default))))
   `(tab-bar-tab-inactive          ((t (:inherit minimalogy-pale))))
   `(tab-line                      ((t (:inherit default))))


   ;;;;; line numbers ;;;;;
   `(line-number                  ((t (:inherit minimalogy-pale))))
   `(line-number-current-line     ((t (:inherit (minimalogy-strong hl-line)))))
   `(line-number-major-tick       ((t (:inherit minimalogy-default))))
   `(line-number-minor-tick       ((t (:inherit minimalogy-pale))))


   ;;;;; Font lock ;;;;;
   `(font-lock-comment-face        ((t (:inherit minimalogy-pale))))
   `(font-lock-doc-face            ((t (:inherit minimalogy-pale))))
   `(font-lock-string-face         ((t (:inherit minimalogy-popout))))
   `(font-lock-constant-face       ((t (:inherit minimalogy-key))))
   `(font-lock-warning-face        ((t (:inherit minimalogy-popout))))
   `(font-lock-function-name-face  ((t (:inherit minimalogy-strong))))
   `(font-lock-variable-name-face  ((t (:inherit (minimalogy-strong minimalogy-key)))))
   `(font-lock-builtin-face        ((t (:inherit minimalogy-key))))
   `(font-lock-type-face           ((t (:inherit minimalogy-key))))
   `(font-lock-keyword-face        ((t (:inherit minimalogy-key))))


   ;;;;; custom edit ;;;;;
   `(widget-field              ((t (:inherit minimalogy-subtle))))
   `(widget-button             ((t (:inherit minimalogy-strong))))
   `(widget-single-line-field  ((t (:inherit minimalogy-subtle))))
   `(custom-group-subtitle     ((t (:inherit minimalogy-strong))))
   `(custom-group-tag          ((t (:inherit minimalogy-strong))))
   `(custom-group-tag-1        ((t (:inherit minimalogy-strong))))
   `(custom-comment            ((t (:inherit minimalogy-pale))))
   `(custom-comment-tag        ((t (:inherit minimalogy-pale))))
   `(custom-changed            ((t (:inherit minimalogy-key))))
   `(custom-modified           ((t (:inherit minimalogy-key))))
   `(custom-face-tag           ((t (:inherit minimalogy-strong))))
   `(custom-variable-tag       ((t (:inherit minimalogy-strong))))
   `(custom-invalid            ((t (:inherit minimalogy-popout))))
   `(custom-visibility         ((t (:inherit minimalogy-key))))
   `(custom-state              ((t (:inherit minimalogy-key))))
   `(custom-link               ((t (:inherit minimalogy-key))))
   `(custom-variable-obsolete  ((t (:inherit minimalogy-pale))))


   ;;;;; compilation ;;;;;
   `(compilation-error           ((t (:inherit minimalogy-critical))))
   `(compilation-info            ((t (:inherit minimalogy-default))))
   `(compilation-warning         ((t (:inherit minimalogy-popout))))
   `(compilation-line-number     ((t (:inherit minimalogy-default))))
   `(compilation-column-number   ((t (:inherit minimalogy-default))))
   `(compilation-mode-line-run   ((t (:inherit minimalogy-default-i))))
   `(compilation-mode-line-exit  ((t (:inherit minimalogy-default-i))))
   `(compilation-mode-line-fail  ((t (:inherit minimalogy-critical))))


   ;;;;; buttons ;;;;;
   `(custom-button          ((t (:inherit minimalogy-default-i :box nil))))
   `(custom-button-mouse    ((t (:inherit minimalogy-default-i :box nil))))
   `(custom-button-pressed  ((t (:inherit minimalogy-default-i :box nil))))


   ;;;;; Vertico ;;;;;
   `(vertico-current          ((t (:inherit (minimalogy-strong minimalogy-subtle)))))
   `(vertico-group-separator  ((t (:inherit minimalogy-pale))))
   `(vertico-group-title      ((t (:inherit minimalogy-pale))))
   `(vertico-multiline        ((t (:inherit minimalogy-pale))))


   ;;;;; Corfu ;;;;;
   `(corfu-annotations  ((t (:inherit minimalogy-pale))))
   `(corfu-bar          ((t (:inherit minimalogy-default-i))))
   `(corfu-border       ((t (:inherit minimalogy-default-i))))
   `(corfu-current      ((t (:inherit highlight))))
   `(corfu-default      ((t (:inherit minimalogy-subtle))))
   `(corfu-deprecated   ((t (:inherit minimalogy-pale))))
   `(corfu-echo         ((t (:inherit minimalogy-pale))))


   ;;;;; Orderless ;;;;;
   `(orderless-match-face-0  ((t (:inherit (minimalogy-key minimalogy-strong)))))
   `(orderless-match-face-1  ((t (:inherit (minimalogy-strong)))))
   `(orderless-match-face-2  ((t (:inherit (minimalogy-strong)))))
   `(orderless-match-face-3  ((t (:inherit (minimalogy-strong)))))


   ;;;;; org agenda ;;;;;
   '(org-agenda-calendar-event    ((t (:inherit minimalogy-default))))
   '(org-agenda-calendar-sexp     ((t (:inherit minimalogy-key))))
   '(org-agenda-clocking          ((t (:inherit minimalogy-pale))))
   '(org-agenda-column-dateline   ((t (:inherit minimalogy-pale))))
   '(org-agenda-current-time      ((t (:inherit (minimalogy-strong minimalogy-key)))))
   '(org-agenda-date              ((t (:inherit minimalogy-strong))))
   '(org-agenda-date-today        ((t (:inherit (minimalogy-key minimalogy-strong)))))
   '(org-agenda-date-weekend      ((t (:inherit minimalogy-pale))))
   '(org-agenda-diary             ((t (:inherit minimalogy-pale))))
   '(org-agenda-dimmed-todo-face  ((t (:inherit minimalogy-pale))))
   '(org-agenda-done              ((t (:inherit minimalogy-pale))))
   '(org-agenda-filter-category   ((t (:inherit minimalogy-pale))))
   '(org-agenda-filter-effort     ((t (:inherit minimalogy-pale))))
   '(org-agenda-filter-regexp     ((t (:inherit minimalogy-pale))))
   '(org-agenda-filter-tags       ((t (:inherit minimalogy-pale))))
   '(org-agenda-property-face     ((t (:inherit minimalogy-pale))))
   '(org-agenda-restriction-lock  ((t (:inherit minimalogy-pale))))
   '(org-agenda-structure         ((t (:inherit minimalogy-strong))))


   ;;;;; org mode ;;;;;
   `(org-archived                  ((t (:inherit minimalogy-pale))))
   `(org-block                     ((t (:background ,minimalogy-bg1 :foreground ,minimalogy-fg))))
   `(org-block-begin-line          ((t (:background ,minimalogy-bg2 :foreground ,minimalogy-fg :extend t))))
   `(org-block-end-line            ((t (:inherit org-block-begin-line))))
   `(org-checkbox                  ((t (:inherit minimalogy-pale))))
   `(org-checkbox-statistics-done  ((t (:inherit minimalogy-pale))))
   `(org-checkbox-statistics-todo  ((t (:inherit minimalogy-pale))))
   `(org-clock-overlay             ((t (:inherit minimalogy-pale))))
   `(org-code                      ((t (:inherit minimalogy-key))))
   `(org-column                    ((t (:inherit minimalogy-pale))))
   `(org-column-title              ((t (:inherit minimalogy-pale))))
   `(org-date                      ((t (:inherit minimalogy-pale))))
   `(org-date-selected             ((t (:inherit minimalogy-pale))))
   `(org-default                   ((t (:inherit minimalogy-pale))))
   `(org-document-info             ((t (:inherit minimalogy-pale))))
   `(org-document-info-keyword     ((t (:inherit minimalogy-pale))))
   `(org-document-title            ((t (:inherit minimalogy-pale))))
   `(org-done                      ((t (:inherit minimalogy-pale))))
   `(org-drawer                    ((t (:inherit minimalogy-pale))))
   `(org-ellipsis                  ((t (:inherit minimalogy-pale))))
   `(org-footnote                  ((t (:inherit minimalogy-pale))))
   `(org-formula                   ((t (:inherit minimalogy-pale))))
   `(org-headline-done             ((t (:inherit minimalogy-pale))))
   `(org-hide                      ((t (:foreground ,minimalogy-bg :background ,minimalogy-bg))))
   `(org-latex-and-related         ((t (:inherit minimalogy-pale))))
   `(org-level-1                   ((t (:inherit minimalogy-strong))))
   `(org-level-2                   ((t (:inherit minimalogy-strong))))
   `(org-level-3                   ((t (:inherit minimalogy-strong))))
   `(org-level-4                   ((t (:inherit minimalogy-strong))))
   `(org-level-5                   ((t (:inherit minimalogy-strong))))
   `(org-level-6                   ((t (:inherit minimalogy-strong))))
   `(org-level-7                   ((t (:inherit minimalogy-strong))))
   `(org-level-8                   ((t (:inherit minimalogy-strong))))
   `(org-link                      ((t (:inherit minimalogy-key))))
   `(org-list-dt                   ((t (:inherit minimalogy-pale))))
   `(org-macro                     ((t (:inherit minimalogy-pale))))
   `(org-meta-line                 ((t (:inherit minimalogy-pale))))
   `(org-mode-line-clock           ((t (:inherit minimalogy-pale))))
   `(org-mode-line-clock-overrun   ((t (:inherit minimalogy-pale))))
   `(org-priority                  ((t (:inherit minimalogy-pale))))
   `(org-property-value            ((t (:inherit minimalogy-pale))))
   `(org-quote                     ((t (:inherit minimalogy-pale))))
   `(org-scheduled                 ((t (:inherit minimalogy-pale))))
   `(org-scheduled-previously      ((t (:inherit minimalogy-pale))))
   `(org-scheduled-today           ((t (:inherit minimalogy-pale))))
   `(org-sexp-date                 ((t (:inherit minimalogy-pale))))
   `(org-special-keyword           ((t (:inherit minimalogy-pale))))
   `(org-table                     ((t (:inherit minimalogy-pale))))
   `(org-tag                       ((t (:inherit minimalogy-popout))))
   `(org-tag-group                 ((t (:inherit minimalogy-pale))))
   `(org-target                    ((t (:inherit minimalogy-pale))))
   `(org-time-grid                 ((t (:inherit minimalogy-pale))))
   `(org-todo                      ((t (:inherit minimalogy-key))))
   `(org-upcoming-deadline         ((t (:inherit minimalogy-popout))))
   `(org-verbatim                  ((t (:inherit minimalogy-popout))))
   `(org-verse                     ((t (:inherit minimalogy-pale))))
   `(org-warning                   ((t (:inherit minimalogy-popout))))


   ;;;;; outline ;;;;;
   `(outline-1                      ((t (:inherit minimalogy-strong))))
   `(outline-2                      ((t (:inherit minimalogy-strong))))
   `(outline-3                      ((t (:inherit minimalogy-strong))))
   `(outline-4                      ((t (:inherit minimalogy-strong))))
   `(outline-5                      ((t (:inherit minimalogy-strong))))
   `(outline-6                      ((t (:inherit minimalogy-strong))))
   `(outline-7                      ((t (:inherit minimalogy-strong))))
   `(outline-8                      ((t (:inherit minimalogy-strong))))


   ;;;;; fly-spell ;;;;;
   `(flyspell-duplicate             ((t (:inherit minimalogy-popout :underline t))))
   `(flyspell-incorrect             ((t (:inherit minimalogy-popout :underline t))))


   ;;;;; marginalia ;;;;;
   `(marginalia-archive                     ((t (:inherit minimalogy-pale))))
   `(marginalia-char                        ((t (:inherit minimalogy-pale))))
   `(marginalia-date                        ((t (:inherit minimalogy-pale))))
   `(marginalia-documentation               ((t (:inherit minimalogy-pale))))
   `(marginalia-file-name                   ((t (:inherit minimalogy-pale))))
   `(marginalia-file-owner                  ((t (:inherit minimalogy-pale))))
   `(marginalia-file-priv-dir               ((t (:inherit minimalogy-pale))))
   `(marginalia-file-priv-exec              ((t (:inherit minimalogy-pale))))
   `(marginalia-file-priv-link              ((t (:inherit minimalogy-pale))))
   `(marginalia-file-priv-no                ((t (:inherit minimalogy-pale))))
   `(marginalia-file-priv-other             ((t (:inherit minimalogy-pale))))
   `(marginalia-file-priv-rare              ((t (:inherit minimalogy-pale))))
   `(marginalia-file-priv-read              ((t (:inherit minimalogy-pale))))
   `(marginalia-file-priv-write             ((t (:inherit minimalogy-pale))))
   `(marginalia-function                    ((t (:inherit minimalogy-pale))))
   `(marginalia-installed                   ((t (:inherit minimalogy-pale))))
   `(marginalia-key                         ((t (:inherit minimalogy-pale))))
   `(marginalia-lighter                     ((t (:inherit minimalogy-pale))))
   `(marginalia-list                        ((t (:inherit minimalogy-pale))))
   `(marginalia-mode                        ((t (:inherit minimalogy-pale))))
   `(marginalia-modified                    ((t (:inherit minimalogy-pale))))
   `(marginalia-null                        ((t (:inherit minimalogy-pale))))
   `(marginalia-number                      ((t (:inherit minimalogy-pale))))
   `(marginalia-off                         ((t (:inherit minimalogy-pale))))
   `(marginalia-on                          ((t (:inherit minimalogy-pale))))
   `(marginalia-size                        ((t (:inherit minimalogy-pale))))
   `(marginalia-string                      ((t (:inherit minimalogy-pale))))
   `(marginalia-symbol                      ((t (:inherit minimalogy-pale))))
   `(marginalia-true                        ((t (:inherit minimalogy-pale))))
   `(marginalia-type                        ((t (:inherit minimalogy-pale))))
   `(marginalia-value                       ((t (:inherit minimalogy-pale))))
   `(marginalia-version                     ((t (:inherit minimalogy-pale))))


   ;;;;; magit ;;;;;
   `(magit-blame-highlight                  ((t (:inherit (minimalogy-subtle)))))
   `(magit-diff-added-highlight             ((t (:inherit (minimalogy-subtle minimalogy-key minimalogy-strong)))))
   `(magit-diff-base-highlight              ((t (:inherit (minimalogy-subtle)))))
   `(magit-diff-context-highlight           ((t (:inherit (minimalogy-subtle minimalogy-pale)))))
   `(magit-diff-file-heading-highlight      ((t (:inherit (minimalogy-subtle minimalogy-strong)))))
   `(magit-diff-hunk-heading-highlight      ((t (:inherit (minimalogy-default)))))
   `(magit-diff-our-highlight               ((t (:inherit (minimalogy-subtle)))))
   `(magit-diff-removed-highlight           ((t (:inherit (minimalogy-subtle minimalogy-popout minimalogy-strong)))))
   `(magit-diff-revision-summary-highlight  ((t (:inherit ()))))
   `(magit-diff-their-highlight             ((t (:inherit (minimalogy-subtle)))))
   `(magit-section-highlight                ((t (:inherit (minimalogy-subtle)))))

   `(magit-blame-heading                    ((t (:inherit (minimalogy-subtle minimalogy-strong)))))
   `(magit-diff-conflict-heading            ((t (:inherit (minimalogy-subtle minimalogy-strong)))))
   `(magit-diff-file-heading                ((t (:inherit (minimalogy-strong)))))
   `(magit-diff-hunk-heading                ((t (:inherit (minimalogy-subtle minimalogy-default)))))
   `(magit-diff-lines-heading               ((t (:inherit (minimalogy-subtle minimalogy-strong)))))
   `(magit-section-heading                  ((t (:inherit (minimalogy-key minimalogy-strong)))))

   `(magit-bisect-bad                       ((t (:inherit minimalogy-default))))
   `(magit-bisect-good                      ((t (:inherit minimalogy-default))))
   `(magit-bisect-skip                      ((t (:inherit minimalogy-default))))
   `(magit-blame-date                       ((t (:inherit minimalogy-default))))
   `(magit-blame-dimmed                     ((t (:inherit minimalogy-default))))
   `(magit-blame-hash                       ((t (:inherit minimalogy-pale))))

   `(magit-blame-margin                     ((t (:inherit minimalogy-default))))
   `(magit-blame-name                       ((t (:inherit minimalogy-default))))
   `(magit-blame-summary                    ((t (:inherit minimalogy-default))))

   `(magit-branch-current                   ((t (:inherit (minimalogy-strong minimalogy-key)))))
   `(magit-branch-local                     ((t (:inherit minimalogy-key))))
   `(magit-branch-remote                    ((t (:inherit (minimalogy-key)))))
   `(magit-branch-remote-head               ((t (:inherit (minimalogy-key)))))
   `(magit-branch-upstream                  ((t (:inherit (minimalogy-key)))))

   `(magit-cherry-equivalent                ((t (:inherit minimalogy-default))))
   `(magit-cherry-unmatched                 ((t (:inherit minimalogy-default))))

   `(magit-diff-added                       ((t (:inherit (minimalogy-key minimalogy-strong)))))
   `(magit-diff-base                        ((t (:inherit minimalogy-default))))
   `(magit-diff-context                     ((t (:inherit minimalogy-pale))))
   `(magit-diff-file-heading-selection      ((t (:inherit minimalogy-default))))
   `(magit-diff-hunk-heading-selection      ((t (:inherit minimalogy-default))))
   `(magit-diff-hunk-region                 ((t (:inherit minimalogy-default))))
   `(magit-diff-lines-boundary              ((t (:inherit minimalogy-default))))
   `(magit-diff-our                         ((t (:inherit minimalogy-default))))
   `(magit-diff-removed                     ((t (:inherit (minimalogy-popout minimalogy-strong)))))
   `(magit-diff-revision-summary            ((t (:inherit minimalogy-popout))))
   `(magit-diff-their                       ((t (:inherit minimalogy-default))))
   `(magit-diff-whitespace-warning          ((t (:inherit minimalogy-subtle))))
   `(magit-diffstat-added                   ((t (:inherit minimalogy-default))))
   `(magit-diffstat-removed                 ((t (:inherit minimalogy-default))))

   `(magit-dimmed                           ((t (:inherit minimalogy-pale))))
   `(magit-filename                         ((t (:inherit minimalogy-default))))
   `(magit-hash                             ((t (:inherit minimalogy-pale))))
   `(magit-head                             ((t (:inherit minimalogy-default))))
   `(magit-header-line                      ((t (:inherit minimalogy-default))))
   `(magit-header-line-key                  ((t (:inherit minimalogy-default))))
   `(magit-header-line-log-select           ((t (:inherit minimalogy-default))))

   `(magit-keyword                          ((t (:inherit minimalogy-key))))
   `(magit-keyword-squash                   ((t (:inherit minimalogy-key))))

   `(magit-log-author                       ((t (:inherit minimalogy-default))))
   `(magit-log-date                         ((t (:inherit minimalogy-default))))
   `(magit-log-graph                        ((t (:inherit minimalogy-default))))

   `(magit-mode-line-process                ((t (:inherit minimalogy-default))))
   `(magit-mode-line-process-error          ((t (:inherit minimalogy-critical))))

   `(magit-process-ng                       ((t (:inherit minimalogy-default))))
   `(magit-process-ok                       ((t (:inherit minimalogy-default))))

   `(magit-reflog-amend                     ((t (:inherit minimalogy-default))))
   `(magit-reflog-checkout                  ((t (:inherit minimalogy-default))))
   `(magit-reflog-cherry-pick               ((t (:inherit minimalogy-default))))
   `(magit-reflog-commit                    ((t (:inherit minimalogy-default))))
   `(magit-reflog-merge                     ((t (:inherit minimalogy-default))))
   `(magit-reflog-other                     ((t (:inherit minimalogy-default))))
   `(magit-reflog-rebase                    ((t (:inherit minimalogy-default))))
   `(magit-reflog-remote                    ((t (:inherit minimalogy-default))))
   `(magit-reflog-reset                     ((t (:inherit minimalogy-default))))
   `(magit-refname                          ((t (:inherit minimalogy-default))))
   `(magit-refname-pullreq                  ((t (:inherit minimalogy-default))))
   `(magit-refname-stash                    ((t (:inherit minimalogy-default))))
   `(magit-refname-wip                      ((t (:inherit minimalogy-default))))

   `(magit-section-heading-selection        ((t (:inherit minimalogy-default))))
   `(magit-section-secondary-heading        ((t (:inherit minimalogy-default))))
   `(magit-sequence-done                    ((t (:inherit minimalogy-default))))
   `(magit-sequence-drop                    ((t (:inherit minimalogy-default))))
   `(magit-sequence-exec                    ((t (:inherit minimalogy-default))))
   `(magit-sequence-head                    ((t (:inherit minimalogy-default))))
   `(magit-sequence-onto                    ((t (:inherit minimalogy-default))))
   `(magit-sequence-part                    ((t (:inherit minimalogy-default))))
   `(magit-sequence-pick                    ((t (:inherit minimalogy-default))))
   `(magit-sequence-stop                    ((t (:inherit minimalogy-default))))

   `(magit-signature-bad                    ((t (:inherit minimalogy-default))))
   `(magit-signature-error                  ((t (:inherit minimalogy-default))))
   `(magit-signature-expired                ((t (:inherit minimalogy-default))))
   `(magit-signature-expired-key            ((t (:inherit minimalogy-default))))
   `(magit-signature-good                   ((t (:inherit minimalogy-default))))
   `(magit-signature-revoked                ((t (:inherit minimalogy-default))))
   `(magit-signature-untrusted              ((t (:inherit minimalogy-default))))

   `(magit-tag                              ((t (:inherit minimalogy-strong))))


   ;;;;; evil ;;;;;
   `(evil-ex-info                    ((t (:inherit minimalogy-pale))))
   `(evil-ex-substitute-matches      ((t (:strike-through t))))
   `(evil-ex-substitute-replacement  ((t (:inherit minimalogy-default-i))))

   ;;;;; flymake ;;;;;
   `(flymake-error    ((t (:underline (:style wave :color ,minimalogy-ac2)))))
   `(flymake-warning  ((t (:underline (:style wave :color foreground-color)))))
   `(flymake-note     ((t (:underline (:style wave :color ,minimalogy-pl)))))
   ))

;; Apply the theme
(minimalogy-apply-theme)

(provide-theme 'minimalogy)

;;; minimalogy-theme.el ends here
