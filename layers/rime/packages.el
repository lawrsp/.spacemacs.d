(setq rime-packages
      '(
        rime
        posframe
        ))

(defun rime/init-rime ()
  (use-package rime
    :defer t
    :config
    (setq rime-translate-keybindings
          '("C-f" "C-b" "C-n" "C-p" "<left>" "<right>" "<up>" "<down>" "<prior>" "<next>" "<delete>"))
    :bind
    (:map rime-active-mode-map
          ("<tab>" . 'rime-inline-ascii)
          :map rime-mode-map
          ("C-`" . 'rime-send-keybinding))
    ))

(defun rime/post-init-posframe ()
  (when (eq rime-show-candidate 'posframe)
    (use-package posframe
      :defer t)
    ))

