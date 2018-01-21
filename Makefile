SHELL := bash

.PHONY: \
	link-zshrc \
	link-nvim \
	link-tmux

all: \
	link-zshrc \
	link-nvim \
	link-tmux

link-gitconfig:
	ln -sf $(PWD)/.gitconfig ~/.gitconfig

link-zshrc:
	ln -sf $(PWD)/zshrc ~/.zshrc

link-nvim:
	mkdir -p ~/.config && ln -sf $(PWD)/nvim ~/.config/nvim

link-tmux:
	ln -sf $(PWD)/tmux.conf ~/.tmux.conf
