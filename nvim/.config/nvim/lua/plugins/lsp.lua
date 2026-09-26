-- Language servers (replaces ALE). mason installs servers and
-- mason-lspconfig enables every installed one. Install more with :Mason.
-- nvim's default LSP keys: K hover, grn rename, gra code action,
-- grr references, gri implementation, [d / ]d diagnostics.
return {
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonLog" },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = { "lua_ls", "pyright", "gopls" },
    },
    config = function(_, opts)
      vim.diagnostic.config({ virtual_text = true, severity_sort = true })
      require("mason-lspconfig").setup(opts)
    end,
  },

  -- Makes lua_ls understand the nvim API when editing this config
  { "folke/lazydev.nvim", ft = "lua", opts = {} },
}
