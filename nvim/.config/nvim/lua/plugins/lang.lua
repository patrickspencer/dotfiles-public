return {
  -- LaTeX (replaces vim-latex). ,ll compiles continuously, ,lv views in
  -- Skim, i$/a$ select math. vimtex should not be lazy-loaded.
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_view_method = "skim"
    end,
  },

  -- Go tooling (:GoRun, :GoTest, ...). gopls itself runs through the LSP
  -- config, so vim-go's copy of it is turned off.
  {
    "fatih/vim-go",
    ft = "go",
    init = function()
      vim.g.go_gopls_enabled = 0
      vim.g.go_def_mapping_enabled = 0
      vim.g.go_fmt_autosave = 0 -- conform formats on save
      vim.g.go_version_warning = 0
    end,
  },
}
