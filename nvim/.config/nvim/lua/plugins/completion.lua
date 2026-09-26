-- Autocompletion from LSP, file paths, snippets and buffer words.
-- Keys (like vim's built-in completion): <C-n>/<C-p> select, <C-y> accept,
-- <C-e> close, <C-space> open menu/docs, <C-k> signature help.
-- friendly-snippets replaces vim-snippets.
return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      keymap = { preset = "default" },
      completion = { documentation = { auto_show = true, auto_show_delay_ms = 300 } },
      signature = { enabled = true },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
  },
}
