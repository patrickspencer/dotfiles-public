# dotfiles-public

My vim and neovim configs. They are separate: vim uses a classic
vimrc with [vim-plug](https://github.com/junegunn/vim-plug), and neovim
uses a Lua config with [lazy.nvim](https://github.com/folke/lazy.nvim)
and nvim-native plugins (telescope, nvim-tree, treesitter, LSP via
mason, lualine, gitsigns, flash, vimtex). Keymaps are shared between
the two where possible, with `,` as leader.

## Install

With [GNU stow](https://www.gnu.org/software/stow/):

    git clone https://github.com/patrickspencer/dotfiles-public.git
    cd dotfiles-public
    stow -t ~ vim nvim

### vim

vim-plug installs itself and the plugins the first time vim starts.
`:PlugUpdate` updates them.

### neovim

Needs Neovim 0.12+, plus `tree-sitter-cli` for treesitter parsers and
`ripgrep` for telescope's grep:

    brew install neovim tree-sitter-cli ripgrep

lazy.nvim installs itself and the plugins the first time nvim starts.
`:Lazy` manages plugins and `:Mason` manages language servers.
