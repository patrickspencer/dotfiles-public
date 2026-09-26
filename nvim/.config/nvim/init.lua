-- ------------------------------------------------
-- nvim init.lua
-- Options, keymaps and autocmds mirror ~/.vimrc; plugins are the
-- nvim-native equivalents, managed by lazy.nvim (lua/plugins/).
-- ------------------------------------------------

-- Leader has to be set before lazy.nvim loads any plugin mappings
vim.g.mapleader = ","
vim.g.maplocalleader = ","

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")

vim.cmd.colorscheme("onedark")
