SHELL := bash

.PHONY: \
	brew-bundle \
	link-zshrc \
	link-nvim \
	link-gitconfig \
	link-tmux \
	link-zshfunctions \
	link-zshaliases \
	link-zshenv \
	link-fzf \
	install-python%-bundle \
	run-tests

all: \
	brew-bundle \
	link-zshrc \
	link-nvim \
	link-tmux \
	link-gitconfig \
	link-zshfunctions \
	link-zshaliases \
	link-zshenv \
	link-fzf \
	install-python2-bundle \
	install-python3-bundle \
	run-tests

link-fzf:
	ln -sf $(PWD)/fzf.zsh ~/.fzf.zsh

link-zshaliases:
	ln -sf $(PWD)/zshaliases ~/.zshaliases

link-zshfunctions:
	ln -sf $(PWD)/zshfunctions ~/.zshfunctions

link-zshenv:
	ln -sf $(PWD)/zshenv ~/.zshenv

link-gitconfig:
	ln -sf $(PWD)/gitconfig ~/.gitconfig

link-zshrc:
	ln -sf $(PWD)/zshrc ~/.zshrc

link-nvim:
	if [[ ! -d ~/.config/nvim ]]; then mkdir -p ~/.config && ln -sf $(PWD)/nvim ~/.config/nvim; fi

link-tmux:
	ln -sf $(PWD)/tmux.conf ~/.tmux.conf

brew-bundle:
	brew bundle

install-python%-bundle:
	pip$* install -r python$*-requirements.txt

run-tests:
	python3 -m unittest $(wildcard tests/*.py)
