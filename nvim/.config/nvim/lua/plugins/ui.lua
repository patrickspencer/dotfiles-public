return {
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
        lualine_a = { { "mode", fmt = function(mode) return mode:sub(1, 1) end } },
      },
    },
  },

  -- Marks in the sign column
  { "kshenoy/vim-signature", event = "BufReadPost" },
}
