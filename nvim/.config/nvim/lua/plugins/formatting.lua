-- Format on save (replaces ALE's fixers). Only the filetypes listed here
-- are formatted; everything else is left alone. :ConformInfo shows what
-- runs for the current buffer.
return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    keys = {
      {
        "<Leader>cf",
        function()
          require("conform").format({ async = true })
        end,
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_organize_imports", "ruff_format" },
        go = { "gofmt" },
        css = { "prettier" },
        html = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
      },
      format_on_save = { timeout_ms = 1000 },
    },
  },
}
