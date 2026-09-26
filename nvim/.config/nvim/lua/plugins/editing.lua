-- Commenting (tcomment's gc/gcc) is built into nvim.
return {
  -- Auto-close brackets and quotes (replaces delimitMate)
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },

  -- cs/ds/ys surround operators (replaces vim-surround)
  { "kylechui/nvim-surround", version = "^4.0.0", event = "VeryLazy", opts = {} },

  -- Jump anywhere on screen with <Space> (replaces easymotion)
  {
    "folke/flash.nvim",
    opts = { modes = { search = { enabled = false }, char = { enabled = false } } },
    keys = {
      {
        "<Space>",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash jump",
      },
    },
  },

  -- Adds end/endif/endfunction automatically
  { "tpope/vim-endwise", event = "InsertEnter" },
}
