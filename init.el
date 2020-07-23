;; 性能测试
;; (load-file "~/.emacs.d/site-lisp/benchmark-init/benchmark.el")

(setq gc-cons-threshold-original gc-cons-threshold)
(setq gc-cons-threshold (* 1024 1024 200))
(setq file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)
(run-with-idle-timer 5 nil (lambda () 
                             (setq gc-cons-threshold gc-cons-threshold-original) 
                             (setq file-name-handler-alist file-name-handler-alist-original) 
                             (makunbound 'gc-cons-threshold-original) 
                             (makunbound 'file-name-handler-alist-original)
                             ;; (message "gc-cons-threshold and file-name-handler-alist restored")
                             (message
                              "自动优化完毕!\t如果要关闭这条消息可以在~/.emacs.d/init.el里注释掉.")))

;; 递归遍历加载路径
(defun add-subdirs-to-load-path(dir) 
  "Recursive add directories to `load-path`."
  (let ((default-directory (file-name-as-directory dir))) 
    (add-to-list 'load-path dir) 
    (normal-top-level-add-subdirs-to-load-path)))

(let ((gc-cons-threshold most-positive-fixnum) 
      (file-name-handler-alist nil)) 
  (add-subdirs-to-load-path "~/.emacs.d/etc/"))

;; 图形界面插件的设置
(setq graphic-only-plugins-setting ())

(require 'init-config)

;; 透明效果
;; (when (graphic-p) 
;;   (+evan/toggle-transparency) 
;;   (+evan/toggle-transparency) 
;;   (message "透明以开启，想要关闭可以调用命令(+evan/toggle-transparency)"))

(if (graphic-p) 
    (message "检测到当前环境为图形环境，可以正常使用。")
  (message "检测到当前环境为字符环境，部分插件未启用。"))

;; (org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))


;; 下面的可以删掉

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-term-color-vector
   [unspecified "#ffffff" "#cc342b" "#198844" "#fba922" "#3971ed" "#a36ac7" "#3971ed" "#373b41"] t)
 '(ccls-enable-skipped-ranges nil)
 '(ccls-executable "/usr/bin/ccls" t)
 '(ccls-sem-highlight-method 'font-lock)
 '(custom-safe-themes
   '("5c6e56b16058ec861a3e7f7906cd98cce34ef7e1cbcfd8f8f681a25975f898a8" "4a91a64af7ff1182ed04f7453bb5a4b0c3d82148d27db699df89a5f1d449e2a4" "6151e76f90a494363b167acdb0d36aada6d34c1843999523abe46764abb04179" "08765d801b06462a3ce7e414cdb747436ccaf0c073350be201d8f87bd0481435" "e01db763cd9daa56f75df8ebd057f84017ae8b5f351ec90c96c928ad50f3eb25" "8e335b2bc6e218828189e2b3b19b3bd5938fcbc23ab5b28f19ff782a8bc2eec3" "d7d317a4a3629d91129493ed6caa795c38e3b120da4df0156aa7700e9fe7d88c" "fa3bdd59ea708164e7821574822ab82a3c51e262d419df941f26d64d015c90ee" "7d708f0168f54b90fc91692811263c995bebb9f68b8b7525d0e2200da9bc903c" "7f791f743870983b9bb90c8285e1e0ba1bf1ea6e9c9a02c60335899ba20f3c94" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "28fa7536c8f563c6d6296989937a8e87a2dc6477fd7b366e0336a8997a521094" "6bacece4cf10ea7dd5eae5bfc1019888f0cb62059ff905f37b33eec145a6a430" "7c4cfa4eb784539d6e09ecc118428cd8125d6aa3053d8e8413f31a7293d43169" "24132f7b6699c6e0118d742351b74141bac3c4388937e40db9207554eaae78c9" "f2b56244ecc6f4b952b2bcb1d7e517f1f4272876a8c873b378f5cf68e904bd59" "361f5a2bc2a7d7387b442b2570b0ef35198442b38c2812bf3c70e1e091771d1a" "1623aa627fecd5877246f48199b8e2856647c99c6acdab506173f9bb8b0a41ac" "6231254e74298a1cf8a5fee7ca64352943de4b495e615c449e9bb27e2ccae709" "264b639ee1d01cd81f6ab49a63b6354d902c7f7ed17ecf6e8c2bd5eb6d8ca09c" "a83f05e5e2f2538376ea2bfdf9e3cd8b7f7593b16299238c1134c1529503fa88" "845103fcb9b091b0958171653a4413ccfad35552bc39697d448941bcbe5a660d" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "e1ecb0536abec692b5a5e845067d75273fe36f24d01210bf0aa5842f2a7e029f" "51956e440cec75ba7e4cff6c79f4f8c884a50b220e78e5e05145386f5b381f7b" "1263771faf6967879c3ab8b577c6c31020222ac6d3bac31f331a74275385a452" "36746ad57649893434c443567cb3831828df33232a7790d232df6f5908263692" "285efd6352377e0e3b68c71ab12c43d2b72072f64d436584f9159a58c4ff545a" "1526aeed166165811eefd9a6f9176061ec3d121ba39500af2048073bea80911e" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "dd4628d6c2d1f84ad7908c859797b24cc6239dfe7d71b3363ccdd2b88963f336" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(default-input-method "rime")
 '(doom-modeline-mode t)
 '(eaf-find-alternate-file-in-dired t t)
 '(eaf-proxy-host "127.0.0.1")
 '(eaf-proxy-port "1088")
 '(eaf-proxy-type "socks5")
 '(emojify-emojis-dir "~/.emacs.d/var/emojis")
 '(eww-search-prefix "https://google.com/search?q=")
 '(fci-rule-color "#6272a4")
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
	 ("NEXT" . "#dc752f")
	 ("THEM" . "#2d9574")
	 ("PROG" . "#4f97d7")
	 ("OKAY" . "#4f97d7")
	 ("DONT" . "#f2241f")
	 ("FAIL" . "#f2241f")
	 ("DONE" . "#86dc2f")
	 ("NOTE" . "#b1951d")
	 ("KLUDGE" . "#b1951d")
	 ("HACK" . "#b1951d")
	 ("TEMP" . "#b1951d")
	 ("FIXME" . "#dc752f")
	 ("XXX+" . "#dc752f")
	 ("\\?\\?\\?+" . "#dc752f")))
 '(jdee-db-active-breakpoint-face-colors (cons "#1E2029" "#bd93f9"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1E2029" "#50fa7b"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1E2029" "#565761"))
 '(lsp-auto-guess-root nil)
 '(lsp-eldoc-hook nil)
 '(lsp-file-watch-threshold 2000)
 '(lsp-idle-delay 0)
 '(lsp-prefer-flymake nil t)
 '(lsp-python-ms-executable
   "~/.emacs.d/var/python-language-server/output/bin/Release/linux-x64/publish/Microsoft.Python.LanguageServer")
 '(lsp-ui-doc-delay 1)
 '(objed-cursor-color "#ff5555")
 '(org-bullets-bullet-list '("☰" "☷" "☯" "☭"))
 '(org-todo-keyword-faces
   '(("[学习]" :foreground "white" :background "#2ECC71" :weight bold)
	 ("[待办]" :foreground "white" :background "#F1C40F" :weight bold)
	 ("[等待]" :foreground "white" :background "#3498DB" :weight bold)
	 ("[完成]" :foreground "white" :background "#566573 " :weight bold)
	 ("[取消]" :foreground "white" :background "#566573" :weight bold)
	 ("[BUG]" :foreground "white" :background "#E74C3C" :weight bold)
	 ("[新事件]" :foreground "white" :background "#D35400" :weight bold)
	 ("[已知问题]" :foreground "white" :background "#17A589" :weight bold)
	 ("[修改中]" :foreground "white" :background "#BB8FCE" :weight bold)
	 ("[已修复]" :foreground "white" :background "#566573" :weight bold)))
 '(org-todo-keywords
   '((sequence "[学习](s!/@)" "[待办](t!/@)" "[等待](w!))" "|" "[完成](d!/@)" "[取消](c!@)")
	 (sequence "[BUG](b!/@)" "[新事件](i@)" "[已知问题](k!/@)" "[修改中](W!/@)" "|" "[已修复](f!)")))
 '(package-selected-packages
   '(writeroom-mode green-is-the-new-black-theme green-phosphor-theme green-screen-theme organic-green-theme lsp-mode modern-cpp-font-lock ccls simple-httpd ox-hugo indent-guide beacon markdown-mode+ markdown dashboard youdao-dictionary yasnippet-snippets yaml-mode xml-format xml+ which-key web-mode w3m vterm use-package-hydra undo-tree try treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired toc-org telega sudo-edit spacemacs-theme snazzy-theme smartparens rotate rime rainbow-delimiters quickrun prettier-js perspeen pdf-tools page-break-lines ox-reveal org-bullets nyx-theme major-mode-hydra lsp-ui lsp-python-ms lsp-java live-py-mode linum-relative jsonrpc json-rpc-server json-rpc js2-mode ivy-posframe ivy-hydra info-colors iceberg-theme hungry-delete htmlize howdoyou hemera-theme google-translate general flycheck-posframe flycheck-pos-tip flycheck-popup-tip esup emojify emmet-mode elisp-format doom-themes doom-modeline doom dired-icon dired-hacks-utils dash-docs dap-mode dakrone-light-theme counsel-projectile company-tabnine company-box circadian bongo benchmark-init auto-complete amx all-the-icons-ivy-rich all-the-icons-ivy all-the-icons-dired ag))
 '(pdf-view-midnight-colors (cons "#f8f8f2" "#282a36"))
 '(read-process-output-max 1048576 t)
 '(rustic-ansi-faces
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(vc-annotate-background "#282a36")
 '(vc-annotate-color-map
   (list
	(cons 20 "#50fa7b")
	(cons 40 "#85fa80")
	(cons 60 "#bbf986")
	(cons 80 "#f1fa8c")
	(cons 100 "#f5e381")
	(cons 120 "#face76")
	(cons 140 "#ffb86c")
	(cons 160 "#ffa38a")
	(cons 180 "#ff8ea8")
	(cons 200 "#ff79c6")
	(cons 220 "#ff6da0")
	(cons 240 "#ff617a")
	(cons 260 "#ff5555")
	(cons 280 "#d45558")
	(cons 300 "#aa565a")
	(cons 320 "#80565d")
	(cons 340 "#6272a4")
	(cons 360 "#6272a4")))
 '(vc-annotate-very-old-color nil)
 '(which-key-popup-type 'side-window)
 '(winner-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0 :foreground "magenta"))))
 '(flycheck-posframe-border-face ((t (:inherit default))))
 '(hl-line ((t (:inherit highlight :extend t :background "gray8"))))
 '(mode-line ((t (:family "Fira Code Nerd Font" :style "Retina" :height 125))))
 '(mode-line-inactive ((t (:family "Fira Code Nerd Font" :style "Retina" :height 125))))
 '(perspeen-selected-face ((t (:background "violet" :foreground "Black" :weight bold)))))
(put 'dired-find-alternate-file 'disabled nil)
