(defun spacemacs//mide-wave-setup-global-bindings ()
  "Define keys bindings globally of mide-wave document assistant functions"
  (spacemacs/declare-prefix "mm"  "mind-wave")
  (spacemacs/set-leader-keys
    ;; Document mode
    ;; Selected Content:
    ;; Execute the command mind-wave-translate-to-english, ChatGPT will automatically replace the selected area with the translated content.
    "mmt" 'mind-wave-translate-to-english
    ;; Execute the command mind-wave-proofreading-doc, ChatGPT will automatically replace the selected area with the polished document.
    "mmp" 'mind-wave-proofreading-doc
    ;; Execute the command mind-wave-explain-word, ChatGPT will automatically explain the meaning of the words in the current sentence and provide similar example sentences.
    "mme" 'mind-wave-explain-word
    ;; Execute the command mind-wave-adjust-text. ChatGPT will adjust the text or code according to your instructions.
    "mma" 'mind-wave-adjust-text))

(defun spacemacs//mide-wave-setup-prog-bindings ()
  "Define keys bindings of mind-wave prog assistant functions for mode"
  (let ((mode major-mode))
    (spacemacs/declare-prefix-for-mode mode "mm" "mind-wave")
    (spacemacs/set-leader-keys-for-major-mode mode
      ;; Code Refactoring Mode
      ;; Move the cursor to the desired function for refactoring.
      ;; Execute the command mind-wave-refactory-code, ChatGPT will automatically split the screen to display the refactored code and suggestions for improvement on the right.
      "mr" 'mind-wave-refactory-code
      ;; Execute the command mind-wave-comment-code, ChatGPT will automatically split the screen to display code with comments on the right.
      "mc" 'mind-wave-comment-code
      ;; Execute the command mind-wave-explain-code, ChatGPT will automatically split the screen to display an explanation for the code on the right.
      "mE" 'mind-wave-explain-code
      ;; Execute the command mind-wave-generate-commit-name, ChatGPT will automatically analyze the current diff content and generate a patch name.
      "mg" 'mind-wave-generate-commit-name
      "mR" 'mind-wave-restore-window-configuration)))
