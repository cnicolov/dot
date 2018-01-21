SHELL := bash

.PHONY: \
	brew-bundle \
	link-zshrc \
	link-nvim \
	link-gitconfig \
	link-tmux \
	install-fzf

all: \
	brew-bundle \
	link-zshrc \
	link-nvim \
	link-tmux \
	link-gitconfig \
	install-fzf

link-gitconfig:
	ln -sf $(PWD)/gitconfig ~/.gitconfig

link-zshrc:
	ln -sf $(PWD)/zshrc ~/.zshrc

link-nvim:
	mkdir -p ~/.config && ln -sf $(PWD)/nvim ~/.config/nvim

link-tmux:
	ln -sf $(PWD)/tmux.conf ~/.tmux.conf

brew-bundle:
	brew bundle

install-fzf:
	$$(brew --prefix)/opt/fzf/install
