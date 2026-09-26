" ------------------------------------------------
" nvim init.vim
" Shares ~/.vim and ~/.vimrc so nvim behaves like vim.
" ------------------------------------------------

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Undo nvim defaults that differ from vim {{{
" ==============================================================

   set mouse=                        " vim leaves the mouse off in the terminal
   set guicursor=                    " keep a block cursor in insert mode
   set notermguicolors               " use the cterm colors, same as vim
   " Y yanks the whole line, not y$
   silent! nunmap Y

" }}}
