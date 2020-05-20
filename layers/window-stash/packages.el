(setq window-stash-packages
      '(
        ace-window
        (window-stash :location (recipe :fetcher github :repo "lawrsp/emacs-window-stash"))
        ))

(defun window-stash/init-window-stash ()
  (use-package window-stash
    :init
    (progn
      (spacemacs/set-leader-keys "w C-l" 'window-stash-stash)
      (spacemacs/set-leader-keys "w C-p" 'window-stash-stash-pop)
      )))

(defun window-stash/post-init-ace-window ()
  )
