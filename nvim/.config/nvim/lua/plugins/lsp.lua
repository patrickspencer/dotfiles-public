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
      ensure_installed = { "lua_ls", "pyright", "gopls", "clangd", "texlab" },
    },
    config = function(_, opts)
      vim.diagnostic.config({ virtual_text = true, severity_sort = true })
      require("mason-lspconfig").setup(opts)

      -- Formatters used by conform (lua/plugins/formatting.lua). mason puts
      -- them on nvim's PATH. gofmt comes with Go itself.
      local registry = require("mason-registry")
      registry.refresh(function()
        for _, name in ipairs({ "stylua", "ruff", "prettier" }) do
          local ok, pkg = pcall(registry.get_package, name)
          if ok and not pkg:is_installed() then
            pkg:install()
          end
        end
      end)
    end,
  },

  -- Makes lua_ls understand the nvim API when editing this config
  { "folke/lazydev.nvim", ft = "lua", opts = {} },
}
