return {
  -- Colorschemes to compare with :Telescope colorscheme enable_preview=true.
  -- The active one is set at the bottom of init.lua.
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
  { "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },

  -- Status line (replaces vim-airline)
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto",
        section_separators = "",
        component_separators = "|",
      },
      sections = {
        -- Single-letter modes, like the airline_mode_map in ~/.vimrc
        lualine_a = {
          {
            "mode",
            fmt = function(mode)
              return mode:sub(1, 1)
            end,
          },
        },
      },
    },
  },

  -- Press , and wait to see every leader mapping
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        { "<Leader>c", group = "code" },
        { "<Leader>f", group = "find" },
        { "<Leader>g", group = "git" },
        { "<Leader>l", group = "latex" },
      },
    },
  },

  -- Marks in the sign column
  { "kshenoy/vim-signature", event = "BufReadPost" },
}
