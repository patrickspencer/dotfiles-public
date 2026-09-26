local group = vim.api.nvim_create_augroup("vimrc", { clear = true })
local autocmd = function(event, opts)
  vim.api.nvim_create_autocmd(event, vim.tbl_extend("force", { group = group }, opts))
end

-- Markdown and reStructuredText
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.md", "*.rst" },
  callback = function()
    local o = vim.opt_local
    o.autoindent = true
    o.expandtab = true
    o.tabstop = 8
    o.softtabstop = 2
    o.shiftwidth = 2
    o.textwidth = 78
    o.wrap = true
    o.formatoptions = "tcqn"
    o.formatlistpat = [[^\s*[0-9*]\+[\]:.)}\t ]\s*]]
    o.comments = "s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>"
    o.foldlevel = 99
  end,
})

-- Run the current file with F9
autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.keymap.set("n", "<F9>", "<cmd>exec '!python3' shellescape(@%, 1)<CR>", { buffer = true })
  end,
})
autocmd("FileType", {
  pattern = "c",
  callback = function() vim.keymap.set("n", "<F9>", "<cmd>make<CR>", { buffer = true }) end,
})

-- Return to the same line when you reopen a file
autocmd("BufReadPost", {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(args.buf) then
      vim.cmd('normal! g`"zvzz')
    end
  end,
})

-- Delete trailing whitespace on save, unless b:noStripWhitespace is set
local function strip_trailing_whitespace()
  if vim.b.noStripWhitespace or vim.bo.binary then
    return
  end
  local view = vim.fn.winsaveview()
  local search = vim.fn.getreg("/")
  vim.cmd([[keeppatterns %s/\s\+$//e]])
  vim.fn.setreg("/", search)
  vim.fn.winrestview(view)
end
autocmd("BufWritePre", { callback = strip_trailing_whitespace })
vim.keymap.set("n", "<Leader>rtw", strip_trailing_whitespace, { desc = "Strip trailing whitespace" })
autocmd("FileType", {
  pattern = { "markdown", "diff" },
  callback = function() vim.b.noStripWhitespace = true end,
})

-- File type associations
vim.filetype.add({
  extension = { adoc = "asciidoc", jinja = "jinja", jinja2 = "jinja", j2 = "jinja" },
  pattern = { [".*%.jinja2%.html"] = "jinja" },
})
