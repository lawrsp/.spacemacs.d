(setq rime-packages
      '(
        rime
        posframe
        ))

(defun rime/init-rime ()
  (use-package rime
    :defer t
    ))

(defun rime/post-init-posframe ()
  (when (eq rime-show-candidate 'posframe)
    (use-package posframe
      :defer t)
    ))

