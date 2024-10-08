;;; funcs.el --- aichat layer funcs file for Spacemacs. -*- lexical-binding: t -*-
;;
;; Copyright (c) 2012-2022 Sylvain Benner & Contributors
;;
;; Author: lawrsp <lawrancersp@gmail.com>
;; URL: https://github.com/lawrsp
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.



(defun spacemacs/aichat-bingai-reset-session ()
    (interactive)
    (aichat-bingai-conversation-reset))

(defun spacemacs//aichat-setup-global-bindings ()
  "Define keys bindings globally of aichat functions"
  (spacemacs/declare-prefix "ai"  "aichat")
  (spacemacs/declare-prefix "aio"  "openai")
  (spacemacs/set-leader-keys
    ;; aichat-bingai-chat : Send a conversation message, adding C-u prefix will start a new conversation
    "aic" 'aichat-bingai-chat
    ;; aichat-bingai-assistant : Send the selected region or the input content, and the returned result is displayed in the Buffer defined by aichat-bingai-assistant-buffer
    "aia" 'aichat-bingai-assistant
    ;; aichat-bingai-replace-or-insert
    "aii" 'aichat-bingai-replace-or-insert
    "aioa" 'aichat-openai-assistant
    "air" 'spacemacs/aichat-bingai-reset-session))

(defun spacemacs//aichat-setup-tools ()
  (aichat-bingai-prompt-create "translator"
                               :input-prompt "=请翻译=: "
                               :text-format "请翻译成中文，回答里只包含翻译完成后的内容，要翻译的内容如下:\n%s"
                               :chat t
                               :assistant t
                               :replace-or-insert t) 
  (spacemacs/declare-prefix "ait"  "translator")
  (spacemacs/set-leader-keys
    "aitc" 'aichat-bingai-chat-translator
    "aita" 'aichat-bingai-assistant-translator
    "aiti" 'aichat-bingai-replace-or-insert-translator))

;; :text-format "Please identify the language I am speaking. If it is Chinese, please translate it into English; if it is not Chinese, please translate it into Chinese. Your answer must only contain the translated content. The following is the sentence I want to translate:\r\n%s"
