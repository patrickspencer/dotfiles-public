# dotfiles-public

My vim and neovim configs. They are separate: vim uses a classic
vimrc with [vim-plug](https://github.com/junegunn/vim-plug), and neovim
uses a Lua config with [lazy.nvim](https://github.com/folke/lazy.nvim)
and nvim-native plugins (telescope, nvim-tree, treesitter, LSP via
mason, blink.cmp completion, conform format-on-save, which-key,
lualine, gitsigns, flash, vimtex). Keymaps are shared between
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

lazy.nvim installs itself and the plugins the first time nvim starts,
and mason installs the language servers (lua_ls, pyright, gopls,
clangd, texlab) and formatters (stylua, ruff, prettier) the first time
you open a file. `:Lazy` manages plugins and `:Mason` manages servers
and formatters.

Layout of `nvim/.config/nvim/`:

| Path | What's in it |
|---|---|
| `init.lua` | Entry point: leader, config modules, colorscheme |
| `lua/config/` | Options, keymaps and autocmds (ported from the vimrc), lazy.nvim bootstrap |
| `lua/plugins/ui.lua` | Colorschemes (onedark is the default; tokyonight, catppuccin, kanagawa to compare), lualine, which-key |
| `lua/plugins/files.lua` | telescope, nvim-tree |
| `lua/plugins/completion.lua` | blink.cmp autocompletion with friendly-snippets |
| `lua/plugins/formatting.lua` | conform.nvim format on save |
| `lua/plugins/lsp.lua` | mason, nvim-lspconfig, lazydev |
| `lua/plugins/syntax.lua` | treesitter |
| `lua/plugins/editing.lua` | autopairs, surround, flash, endwise |
| `lua/plugins/git.lua` | gitsigns, fugitive |
| `lua/plugins/lang.lua` | vimtex, vim-go |
| `after/ftplugin/` | Per-filetype indent and wrap settings |

Keys worth knowing (leader is `,`; press it and wait for a which-key
popup listing the rest):

| Key | Action |
|---|---|
| `<C-p>` / `,ff` / `,fg` / `,fb` | Recent files / find files / grep / buffers |
| `,nt` | File tree |
| `<Space>` | Jump anywhere on screen (flash) |
| `<C-n>` `<C-p>` `<C-y>` | Select / accept completion |
| `K`, `grn`, `gra`, `grr`, `[d` `]d` | LSP hover, rename, code action, references, diagnostics |
| `,cf` | Format buffer (also runs on save) |
| `,ll` / `,lv` | Compile / view LaTeX (vimtex) |
| `,ev` | Edit `init.lua` |
