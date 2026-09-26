return {
  -- Git changes in the sign column (replaces vim-gitgutter)
  { "lewis6991/gitsigns.nvim", event = "BufReadPre", opts = {} },

  { "tpope/vim-fugitive", cmd = { "G", "Git", "Gdiffsplit", "Gread", "Gwrite", "GBrowse" } },
}
