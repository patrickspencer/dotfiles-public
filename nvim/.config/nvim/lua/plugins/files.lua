return {
  -- Fuzzy finder (replaces ctrlp)
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      -- <C-p> opened ctrlp's most recently used list
      { "<C-p>", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
      { "<Leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<Leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Grep" },
      { "<Leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
      { "<Leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          file_ignore_patterns = { "%.git/", "%.hg/", "%.svn/", "%.DS_Store" },
        },
        pickers = {
          -- open files in a new tab, like ctrlp_open_new_file = 't'
          oldfiles = { mappings = { i = { ["<CR>"] = "select_tab" } } },
          find_files = { hidden = true, mappings = { i = { ["<CR>"] = "select_tab" } } },
        },
      })
      telescope.load_extension("fzf")
    end,
  },

  -- File tree (replaces NERDTree)
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<Leader>nt", "<cmd>NvimTreeToggle<CR>", desc = "File tree" },
    },
    opts = {
      sync_root_with_cwd = true,
      view = { number = true, relativenumber = true },
      renderer = { icons = { show = { file = false, folder = false, folder_arrow = true, git = true } } },
      filters = {
        dotfiles = false,
        custom = { "\\~$", "\\.swo$", "\\.swp$", "\\.DS_Store", "\\.aux$", "\\.blg$", "\\.bbl$",
          "\\.fls$", "\\.fdb_lat", "\\.synctex" },
      },
      actions = { open_file = { quit_on_open = true } },
    },
  },

  -- :BufOnly closes every buffer but the current one
  { "duff/vim-bufonly", cmd = "BufOnly" },
}
