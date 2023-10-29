(require 'package)

(add-hook 'html-mode-hook
          (lambda()
            (setq sgml-basic-offset 4)
            (setq indent-tabs-mode t)))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(use-package vterm
  :ensure t
  :bind*(:map vterm-mode-map
 ("C-x C-k" . vterm-copy-mode)
 :map vterm-copy-mode-map
 ("C-x C-k" . vterm-copy-mode))
  )

(use-package multi-vterm
  :ensure t  
  )

;; ;; paren lines
;; (setq-default highlight-indent-guides-method 'column)

(require 'display-line-numbers)
;; (add-hook 'python-mode-hook 'highlight-indent-guides-mode)
(add-hook 'python-mode-hook 'display-line-numbers-mode)

(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'html-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(require 'org-tempo)
;; highlight current line
;; (add-hook 'text-mode-hook #'hl-line-mode)
(setq gc-cons-threshold 4000000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setq lsp-log-io nil) ; if set to true can cause a performance hit
(setq lsp-idle-delay 1)

(global-set-key (kbd "M-c") 'company-complete)

;; global company mode config
(use-package company
  :ensure t
  :defer t
  :config

  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3)
  (setq company-selection-wrap-around t)
  (setq company-quickhelp-color-background "#4F4F4F")
  (setq company-quickhelp-color-foreground "#DCDCCC")
  (global-company-mode 1)
  )

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))
(setq ring-bell-function 'ignore)

(setq-default tab-width 4)

;; keybinds
(global-set-key "\C-x\C-b" 'buffer-menu)


;; doom modeline
(require 'doom-modeline)
(doom-modeline-mode 1)
(setq doom-modeline-icon t)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-buffer-modification-icon t)
(setq doom-modeline-buffer-name t)

(setq lsp-enable-semantic-highlighting nil)

(add-to-list 'default-frame-alist '(font . "Liberation Mono-12.5"))
(set-face-attribute 'default t :font "Liberation Mono-12.5")

;; drop keybinds
(global-set-key (kbd "<mouse-2>") nil)

(eval-after-load "elpy"
  '(cl-dolist (key '("C-c C-m" "C-c C-n"))
     (define-key elpy-mode-map (kbd key) nil)
	 (define-key python-mode-map (kbd "C-c C-ù") 'python-indent-shift-right)
	 (define-key python-mode-map (kbd "C-c C-à") 'python-indent-shift-left)
	 (define-key python-mode-map (kbd "C-c <down>") 'python-nav-end-of-block)
	 (define-key python-mode-map (kbd "C-c <up>") 'python-nav-beginning-of-block)
	 ))


;; ranger keybind
(global-set-key (kbd "C-x p") 'ranger)
(global-set-key (kbd "C-x l") 'vterm)

;; keybinds comment-region
(global-set-key (kbd "C-c C-m") 'comment-region)
;; keybinds uncomment-region
(global-set-key (kbd "C-c C-n") 'uncomment-region)
(set-default 'truncate-lines t)



;; vterm reduce delay
(set-default 'vterm-timer-delay 0.01)

(require 'org-superstar)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
(setq org-superstar-headline-bullets-list '("✙" "♱" "♰" "☥"))
(setq org-startup-indented t
      org-hide-leading-stars t)

(windmove-default-keybindings)

(recentf-mode 1)
(setq recentf-max-menu-items 10)
(setq recentf-max-saved-items 10)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)


;; shrink keybinds
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
(global-set-key (kbd "C-x e") 'mc/edit-lines)

(setq make-backup-files nil) ; stop creating backup files

(with-eval-after-load 'ox
  (require 'ox-hugo))

(toggle-scroll-bar -1)
(menu-bar-mode -1)
(fringe-mode -1)

(with-eval-after-load 'ox-latex
(add-to-list 'org-latex-classes
             '("org-plain-latex"
               "\\documentclass{article}
           [NO-DEFAULT-PACKAGES]
           [PACKAGES]
           [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#27212E" "#964C7B" "#74DFC4" "#FFE261" "#40B4C4" "#EB64B9" "#B4DCE7" "#FFFFFF"])
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#41c7b9")
 '(cua-normal-cursor-color "#adbcbc")
 '(cua-overwrite-cursor-color "#dbb32d")
 '(cua-read-only-cursor-color "#75b938")
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
   '("51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "efcecf09905ff85a7c80025551c657299a4d18c5fcfedd3b2f2b6287e4edd659" "524fa911b70d6b94d71585c9f0c5966fe85fb3a9ddd635362bfabd1a7981a307" "57a29645c35ae5ce1660d5987d3da5869b048477a7801ce7ab57bfb25ce12d3e" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "2229862b727e0caa3b0a53152ef82d37819324bf5d2c657f859b2b0a475b34f7" "bf7f4fb05a45eae1a6bc1a009b7731b09260d945ec4c3c4ed7f5da06647a7946" "f776940c141679a2709f20a3a6f0e227d0dccc693f955ea9cf438b0635509424" "8831121c766f67011fea45ac532a7d6eb9b34f33cf55855ba15bc97b5f2f7703" "3e200d49451ec4b8baa068c989e7fba2a97646091fd555eca0ee5a1386d56077" "833ddce3314a4e28411edf3c6efde468f6f2616fc31e17a62587d6a9255f4633" "d89e15a34261019eec9072575d8a924185c27d3da64899905f8548cbd9491a36" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "c335adbb7d7cb79bc34de77a16e12d28e6b927115b992bccc109fb752a365c72" "37c8c2817010e59734fe1f9302a7e6a2b5e8cc648cf6a6cc8b85f3bf17fececf" "8974263502ed529b371dc110ba0964baff9a05fba59456710d65c646239ca35f" "5db10a96a2282cb35feb180351b4d14f407c093f7bb1bcc76770ed3849feb162" "0c08a5c3c2a72e3ca806a29302ef942335292a80c2934c1123e8c732bb2ddd77" "1cae4424345f7fe5225724301ef1a793e610ae5a4e23c023076dc334a9eb940a" "7ea883b13485f175d3075c72fceab701b5bf76b2076f024da50dff4107d0db25" "b9761a2e568bee658e0ff723dd620d844172943eb5ec4053e2b199c59e0bcc22" "9d29a302302cce971d988eb51bd17c1d2be6cd68305710446f658958c0640f68" "2721b06afaf1769ef63f942bf3e977f208f517b187f2526f0e57c1bd4a000350" "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738" "f053f92735d6d238461da8512b9c071a5ce3b9d972501f7a5e6682a90bf29725" "1aa4243143f6c9f2a51ff173221f4fd23a1719f4194df6cef8878e75d349613d" "dc8285f7f4d86c0aebf1ea4b448842a6868553eded6f71d1de52f3dcbc960039" "2853dd90f0d49439ebd582a8cbb82b9b3c2a02593483341b257f88add195ad76" "5586a5db9dadef93b6b6e72720205a4fa92fd60e4ccfd3a5fa389782eab2371b" "683b3fe1689da78a4e64d3ddfce90f2c19eb2d8ab1bab1738a63d8263119c3f4" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "467dc6fdebcf92f4d3e2a2016145ba15841987c71fbe675dcfe34ac47ffb9195" "a589c43f8dd8761075a2d6b8d069fc985660e731ae26f6eddef7068fece8a414" "2f8eadc12bf60b581674a41ddc319a40ed373dd4a7c577933acaff15d2bf7cc6" "f458b92de1f6cf0bdda6bce23433877e94816c3364b821eb4ea9852112f5d7dc" "016f665c0dd5f76f8404124482a0b13a573d17e92ff4eb36a66b409f4d1da410" "49acd691c89118c0768c4fb9a333af33e3d2dca48e6f79787478757071d64e68" "2e05569868dc11a52b08926b4c1a27da77580daa9321773d92822f7a639956ce" "9dac47a9274aa47ac0b1dd2db1a8dc20c430db5ca9a7f38640d454f98bc73ccf" "7e068da4ba88162324d9773ec066d93c447c76e9f4ae711ddd0c5d3863489c52" "1a1ac598737d0fcdc4dfab3af3d6f46ab2d5048b8e72bc22f50271fd6d393a00" "00cec71d41047ebabeb310a325c365d5bc4b7fab0a681a2a108d32fb161b4006" "afa47084cb0beb684281f480aa84dab7c9170b084423c7f87ba755b15f6776ef" "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33" "89d9dc6f4e9a024737fb8840259c5dd0a140fd440f5ed17b596be43a05d62e67" "ae426fc51c58ade49774264c17e666ea7f681d8cae62570630539be3d06fd964" "60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8" "e1f4f0158cd5a01a9d96f1f7cdcca8d6724d7d33267623cc433fe1c196848554" "adaf421037f4ae6725aa9f5654a2ed49e2cd2765f71e19a7d26a454491b486eb" "443e2c3c4dd44510f0ea8247b438e834188dc1c6fb80785d83ad3628eadf9294" "636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561" "51c71bb27bdab69b505d9bf71c99864051b37ac3de531d91fdad1598ad247138" "512ce140ea9c1521ccaceaa0e73e2487e2d3826cc9d287275550b47c04072bc4" "680f62b751481cc5b5b44aeab824e5683cf13792c006aeba1c25ce2d89826426" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "0c83e0b50946e39e237769ad368a08f2cd1c854ccbcd1a01d39fdce4d6f86478" "8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" "b54376ec363568656d54578d28b95382854f62b74c32077821fdfd604268616a" "a9abd706a4183711ffcca0d6da3808ec0f59be0e8336868669dc3b10381afb6f" "8d8207a39e18e2cc95ebddf62f841442d36fcba01a2a9451773d4ed30b632443" "8721f7ee8cd0c2e56d23f757b44c39c249a58c60d33194fe546659dabc69eebd" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e" "a44e2d1636a0114c5e407a748841f6723ed442dc3a0ed086542dc71b92a87aee" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0" "be84a2e5c70f991051d4aaf0f049fa11c172e5d784727e0b525565bb1533ec78" "3fe1ebb870cc8a28e69763dde7b08c0f6b7e71cc310ffc3394622e5df6e4f0da" "b99e334a4019a2caa71e1d6445fc346c6f074a05fcbb989800ecbe54474ae1b0" "8b6506330d63e7bc5fb940e7c177a010842ecdda6e1d1941ac5a81b13191020e" "5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874" "4fda8201465755b403a33e385cf0f75eeec31ca8893199266a6aeccb4adedfa4" "2078837f21ac3b0cc84167306fa1058e3199bbd12b6d5b56e3777a4125ff6851" "545ab1a535c913c9214fe5b883046f02982c508815612234140240c129682a68" "c865644bfc16c7a43e847828139b74d1117a6077a845d16e71da38c8413a5aaa" "570263442ce6735821600ec74a9b032bc5512ed4539faf61168f2fdf747e0668" "ce4234c32262924c1d2f43e6b61312634938777071f1129c7cde3ebd4a3028da" "56044c5a9cc45b6ec45c0eb28df100d3f0a576f18eef33ff8ff5d32bac2d9700" "70b596389eac21ab7f6f7eb1cf60f8e60ad7c34ead1f0244a577b1810e87e58c" "ddffe74bc4bf2c332c2c3f67f1b8141ee1de8fd6b7be103ade50abb97fe70f0c" "251ed7ecd97af314cd77b07359a09da12dcd97be35e3ab761d4a92d8d8cf9a71" "991ca4dbb23cab4f45c1463c187ac80de9e6a718edc8640003892a2523cb6259" "4ff1c4d05adad3de88da16bd2e857f8374f26f9063b2d77d38d14686e3868d8d" "a138ec18a6b926ea9d66e61aac28f5ce99739cf38566876dc31e29ec8757f6e2" "bbb13492a15c3258f29c21d251da1e62f1abb8bbd492386a673dcfab474186af" "eab123a5ed21463c780e17fc44f9ffc3e501655b966729a2d5a2072832abd3ac" "7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" "5b9a45080feaedc7820894ebbfe4f8251e13b66654ac4394cb416fef9fdca789" "2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9" "6945dadc749ac5cbd47012cad836f92aea9ebec9f504d32fe89a956260773ca4" "ba4ab079778624e2eadbdc5d9345e6ada531dc3febeb24d257e6d31d5ed02577" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" default))
 '(doom-modeline-mode t)
 '(exwm-floating-border-color "#1c1e24")
 '(fci-rule-color "#544863")
 '(frame-brackground-mode 'dark)
 '(highlight-changes-colors '("#f275be" "#af88eb"))
 '(highlight-symbol-colors
   '("#4e3b57c24752" "#1c5d5c5162eb" "#58ac47cc4aec" "#3add4f876dec" "#316958f94870" "#53c94f1e4a56" "#1e6c515d7099"))
 '(highlight-symbol-foreground-color "#cad8d9")
 '(highlight-tail-colors ((("#2e343d") . 0) (("#353340") . 20)))
 '(hl-bg-colors
   '("#ac8a0c" "#b45b24" "#b42e2a" "#b3478d" "#7255b7" "#0068bb" "#00a195" "#489615"))
 '(hl-fg-colors
   '("#103c48" "#103c48" "#103c48" "#103c48" "#103c48" "#103c48" "#103c48" "#103c48"))
 '(hl-paren-colors '("#41c7b9" "#dbb32d" "#4695f7" "#af88eb" "#75b938"))
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
	 ("NEXT" . "#dc752f")
	 ("THEM" . "#2d9574")
	 ("PROG" . "#3a81c3")
	 ("OKAY" . "#3a81c3")
	 ("DONT" . "#f2241f")
	 ("FAIL" . "#f2241f")
	 ("DONE" . "#42ae2c")
	 ("NOTE" . "#b1951d")
	 ("KLUDGE" . "#b1951d")
	 ("HACK" . "#b1951d")
	 ("TEMP" . "#b1951d")
	 ("FIXME" . "#dc752f")
	 ("XXX+" . "#dc752f")
	 ("\\?\\?\\?+" . "#dc752f")))
 '(inhibit-startup-screen t)
 '(ispell-dictionary nil)
 '(jdee-db-active-breakpoint-face-colors (cons "#222228" "#EB64B9"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#222228" "#74DFC4"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#222228" "#4E415C"))
 '(jit-lock-context-time 5)
 '(linum-format "%3i")
 '(lsp-ui-doc-border "#cad8d9")
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   '("#fa5750" "#ed8649" "#dbb32d" "#489615" "#9fe35b" "#0068bb" "#41c7b9" "#f275be" "#af88eb"))
 '(objed-cursor-color "#964C7B")
 '(org-fontify-done-headline nil)
 '(org-fontify-todo-headline nil)
 '(package-selected-packages
   '(bubbleberry-theme planet-theme timu-caribbean-theme timu-macos-theme ample-theme afternoon-theme monokai-theme ido-vertical-mode solarized-theme dracula-theme ranger ox-hugo web-mode lsp-mode emmet-mode spacemacs-theme dired-sidebar neotree multiple-cursors elpygen gruber-darker-theme doom-themes cmake-mode use-package org-superstar multi-vterm elpy doom-modeline))
 '(pdf-view-midnight-colors (cons "#FFFFFF" "#27212E"))
 '(pos-tip-background-color "#184956")
 '(pos-tip-foreground-color "#cad8d9")
 '(powerline-color1 "#3d3d68")
 '(powerline-color2 "#292945")
 '(rustic-ansi-faces
   ["#27212E" "#964C7B" "#74DFC4" "#FFE261" "#40B4C4" "#EB64B9" "#B4DCE7" "#FFFFFF"])
 '(show-paren-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#75b938" "#184956" 0.2))
 '(term-default-bg-color "#103c48")
 '(term-default-fg-color "#adbcbc")
 '(tool-bar-mode nil)
 '(vc-annotate-background "#27212E")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (list
	(cons 20 "#74DFC4")
	(cons 40 "#a2e0a3")
	(cons 60 "#d0e182")
	(cons 80 "#FFE261")
	(cons 100 "#ffd35f")
	(cons 120 "#ffc55d")
	(cons 140 "#FFB85B")
	(cons 160 "#f89c7a")
	(cons 180 "#f18099")
	(cons 200 "#EB64B9")
	(cons 220 "#ce5ca4")
	(cons 240 "#b2548f")
	(cons 260 "#964C7B")
	(cons 280 "#834973")
	(cons 300 "#72466b")
	(cons 320 "#604363")
	(cons 340 "#544863")
	(cons 360 "#544863")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#103c48" "#184956" "#b42e2a" "#fa5750" "#489615" "#75b938" "#ac8a0c" "#dbb32d" "#0068bb" "#4695f7" "#b3478d" "#f275be" "#00a195" "#41c7b9" "#adbcbc" "#103c48"))
 '(xterm-color-names
   ["#184956" "#fa5750" "#75b938" "#dbb32d" "#4695f7" "#f275be" "#41c7b9" "#ece3cc"])
 '(xterm-color-names-bright
   ["#103c48" "#ed8649" "#72898f" "#103c48" "#adbcbc" "#af88eb" "#cad8d9" "#fbf3db"]))
 '(font-lock-maximum-decoration '((c++-mode . 2) (python-mode . 2) (c-mode . 2)))
;; set transparency
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))

;; work with tabs instead of spaces in python coding
;; (add-hook 'python-mode-hook
;;   (lambda ()
;;     (setq indent-tabs-mode t)
;;     (setq python-indent 4)
;;     (setq tab-width 4))
;;     (tabify (point-min) (point-max)))
;;IDO
(require 'ido)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)
(ido-mode 1)


;; custom border color for better readability
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:box (:line-width 1 :color "#23b0ff")))))
 '(mode-line-inactive ((t (:box (:line-width 1 :color "#23b0ff"))))))
;; light blue divider
;; (set-face-foreground 'vertical-border "#23b0ff")
;; light grey divider
(set-face-foreground 'vertical-border "#505050")


;; jump up 5 lines
(global-set-key (kbd "C-n")
				(lambda () (interactive) (next-line 10)))

(global-set-key (kbd "C-p")
				(lambda () (interactive) (previous-line 10)))



;; IDO vertical mode
;; (use-package ido-vertical-mode
;;   :ensure t
;;   :init
;;   (ido-vertical-mode 1))

;; customize-modeline


;; stop elpy problem with strings
(setq elpy-eldoc-show-current-function nil)

;; helps with fast scrolling performance
(setq fast-but-imprecise-scrolling t)

