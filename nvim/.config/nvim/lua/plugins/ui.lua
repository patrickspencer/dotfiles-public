return {
  -- Colorschemes to compare with :Telescope colorscheme enable_preview=true.
  -- The active one is set at the bottom of init.lua.
  -- onedark "dark" uses the same #282c34 background as Ghostty's default
  { "navarasu/onedark.nvim", lazy = false, priority = 1000, opts = { style = "dark" } },
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
  { "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },

  -- Status line (replaces vim-airline). "Bubbles" layout from lualine's
  -- examples: rounded powerline caps ( ), colors follow the colorscheme.
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto",
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = {
        -- Single-letter modes, like the airline_mode_map in ~/.vimrc
        lualine_a = {
          {
            "mode",
            fmt = function(mode)
              return mode:sub(1, 1)
            end,
            separator = { left = "" },
            right_padding = 2,
          },
        },
        lualine_b = { "filename", "branch" },
        lualine_c = { "%=" },
        lualine_x = { "diagnostics" },
        lualine_y = { "filetype", "progress" },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
    },
  },

  -- Floating command line, messages and notifications. blink.cmp already
  -- shows signature help, so noice leaves that alone.
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
        signature = { enabled = false },
      },
      presets = {
        bottom_search = true, -- / and ? stay at the bottom
        long_message_to_split = true, -- long messages open in a split
        lsp_doc_border = true, -- rounded border on hover docs
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
