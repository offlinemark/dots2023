#!/bin/bash

link () {
	echo ">> linking!"

	ln -sfv $PWD/abbr.fish $HOME/.abbr.fish
	ln -sfv $PWD/aliases $HOME/.aliases

	ln -sfv $PWD/fish/config.fish $HOME/.config/fish
	ln -sfv $PWD/fish/functions/fish_prompt.fish $HOME/.config/fish/functions
	ln -sfv $PWD/fish/functions/fish_mode_prompt.fish $HOME/.config/fish/functions
    ln -sfv $HOME/.config/fish/config.fish ~/.fishrc

	ln -sfv $PWD/gitconfig $HOME/.gitconfig
	ln -sfv $PWD/gitignore $HOME/.gitignore

	ln -sfv $PWD/tmux.conf $HOME/.tmux.conf

	ln -sfv $PWD/vimrc $HOME/.vimrc

	ln -sfv $PWD/vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json"
	ln -sfv $PWD/vscode/keybindings.json "$HOME/Library/Application Support/Code/User/keybindings.json"
}

init () {
	echo ">> init!"

	mkdir -v ~/bin
	mkdir -vp ~/.config/fish/functions
	touch ~/.fishrc.local
	touch ~/.aliases.local
	touch $HOME/.vimrc.local
}

init
link
