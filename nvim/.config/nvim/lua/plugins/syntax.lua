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

  -- Code text objects and motions: af/if function, ac/ic class, aa/ia
  -- argument (e.g. vaf, cif, daa); ]f/[f next/previous function.
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "VeryLazy",
    init = function()
      -- nvim's own ftplugins map ]] and friends; keep them from clashing
      vim.g.no_plugin_maps = true
    end,
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
          -- whole lines for "a function" / "a class", so daf leaves no blank line
          selection_modes = { ["@function.outer"] = "V", ["@class.outer"] = "V" },
        },
        move = { set_jumps = true },
      })
      local select = require("nvim-treesitter-textobjects.select").select_textobject
      local move = require("nvim-treesitter-textobjects.move")
      for key, query in pairs({
        af = "@function.outer",
        ["if"] = "@function.inner",
        ac = "@class.outer",
        ic = "@class.inner",
        aa = "@parameter.outer",
        ia = "@parameter.inner",
      }) do
        vim.keymap.set({ "x", "o" }, key, function()
          select(query, "textobjects")
        end, { desc = query })
      end
      vim.keymap.set({ "n", "x", "o" }, "]f", function()
        move.goto_next_start("@function.outer", "textobjects")
      end, { desc = "Next function" })
      vim.keymap.set({ "n", "x", "o" }, "[f", function()
        move.goto_previous_start("@function.outer", "textobjects")
      end, { desc = "Previous function" })
    end,
  },
}
