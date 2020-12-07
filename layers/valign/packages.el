(setq valign-packages
      '(
        (valign :location (recipe :fetcher github :repo "casouri/valign"))
        ))

(defun valign/init-valign ()
  (use-package valign 
    :ensure t
    :config
    (add-hook 'org-mode-hook #'valign-mode)))
