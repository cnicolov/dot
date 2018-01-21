SHELL := bash

link-zshrc:
	ln -sf $(CWD)/.zshrc ~/.zshrc

link-nvim:
	mkdir -p ~/.config && ln -sf $(CWD)/nvim ~/.config/nvim
