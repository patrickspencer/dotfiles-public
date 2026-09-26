local opt = vim.opt

-- General
opt.fileformats = { "unix", "dos", "mac" }
opt.shortmess:append("I")          -- hide welcome screen
opt.relativenumber = true          -- show relative line numbers
opt.scrolloff = 3                  -- keep 3 lines above/below the cursor
opt.history = 500
opt.listchars = { tab = "▸ ", eol = "¬", extends = "❯", precedes = "❮", trail = "·" }
opt.swapfile = false
opt.shell = "bash"                 -- same as vim; do ln -s ~/.zshrc ~/.bashrc
opt.autochdir = true               -- change cwd to that of the current file

-- Folding
opt.foldmethod = "marker"
opt.foldlevelstart = 0

-- Searching
opt.ignorecase = true
opt.smartcase = true

-- Tabs, spaces, wrapping
opt.tabstop = 8
opt.shiftwidth = 4
opt.expandtab = false
opt.softtabstop = 8
opt.wrap = true
opt.linebreak = true               -- only wrap at a character in 'breakat'
opt.list = false                   -- list disables linebreak
opt.textwidth = 0
opt.wrapmargin = 0

-- Wild menu
opt.wildmode = { "longest", "list:full" }

opt.timeoutlen = 500

-- Behave like vim in the terminal
opt.mouse = ""                     -- no mouse
opt.guicursor = ""                 -- block cursor in insert mode
opt.termguicolors = true           -- peaksea and the plugins look best with truecolor

-- nvim-tree replaces netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
