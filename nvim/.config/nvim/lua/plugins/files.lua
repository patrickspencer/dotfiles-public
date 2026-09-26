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
      local actions = require("telescope.actions")

      -- Open files in a new tab, like ctrlp_open_new_file = 't'. From the
      -- start screen or an empty buffer, open in place instead, so no
      -- leftover "[Scratch]" tab is left behind.
      local function open_in_tab(prompt_bufnr)
        local win = require("telescope.actions.state").get_current_picker(prompt_bufnr).original_win_id
        local buf = vim.api.nvim_win_get_buf(win)
        local empty = vim.api.nvim_buf_get_name(buf) == "" and not vim.bo[buf].modified
        if vim.bo[buf].filetype == "snacks_dashboard" or empty then
          actions.select_default(prompt_bufnr)
        else
          actions.select_tab(prompt_bufnr)
        end
      end

      telescope.setup({
        defaults = {
          file_ignore_patterns = { "%.git/", "%.hg/", "%.svn/", "%.DS_Store" },
        },
        pickers = {
          oldfiles = { mappings = { i = { ["<CR>"] = open_in_tab } } },
          find_files = { hidden = true, mappings = { i = { ["<CR>"] = open_in_tab } } },
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
      filters = {
        dotfiles = false,
        custom = {
          "\\~$",
          "\\.swo$",
          "\\.swp$",
          "\\.DS_Store",
          "\\.aux$",
          "\\.blg$",
          "\\.bbl$",
          "\\.fls$",
          "\\.fdb_lat",
          "\\.synctex",
        },
      },
      actions = { open_file = { quit_on_open = true } },
    },
  },

  -- :BufOnly closes every buffer but the current one
  { "duff/vim-bufonly", cmd = "BufOnly" },
}
