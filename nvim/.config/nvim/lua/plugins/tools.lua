return {
  -- Panel listing diagnostics, references, quickfix and location lists
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    keys = {
      { "<Leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (project)" },
      { "<Leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Diagnostics (buffer)" },
      { "<Leader>xr", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", desc = "LSP references" },
      { "<Leader>xq", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix list" },
      { "<Leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Location list" },
    },
  },

  -- Highlights TODO / FIXME / NOTE / HACK / WARN / PERF in comments
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      { "<Leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find TODOs" },
      { "<Leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "TODOs" },
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next TODO",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous TODO",
      },
    },
  },
}
