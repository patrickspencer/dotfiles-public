# dotfiles-public

My vim and neovim config. Neovim shares the vim setup: `init.vim` points
nvim at `~/.vim` and sources `~/.vimrc`, then resets a few nvim defaults
(mouse, cursor shape, truecolor, `Y`) to behave like vim.

## Install

With [GNU stow](https://www.gnu.org/software/stow/):

    git clone https://github.com/patrickspencer/dotfiles-public.git
    cd dotfiles-public
    stow -t ~ vim nvim

Plugins are managed with [Vundle](https://github.com/VundleVim/Vundle.vim):

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
