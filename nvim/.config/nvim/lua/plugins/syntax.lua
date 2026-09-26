local parsers = {
  "bash",
  "c",
  "css",
  "go",
  "html",
  "jinja",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "query",
  "ruby",
  "vim",
  "vimdoc",
  "yaml",
}

return {
  -- Treesitter highlighting. Needs the tree-sitter CLI (brew install tree-sitter-cli).
  -- LaTeX is left to vimtex.
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install(parsers)
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter", { clear = true }),
        callback = function(args)
          if vim.bo[args.buf].filetype ~= "tex" then
            pcall(vim.treesitter.start, args.buf)
          end
        end,
      })
    end,
  },
}
