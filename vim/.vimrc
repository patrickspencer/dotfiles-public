" -----------------------------------------------
" .vimrc
" License: MIT
" ------------------------------------------------

" Base settings {{{
" ============================================================

   " ----------------------------------------------------------
   "  General
   " ----------------------------------------------------------

   set nocompatible                  " needed for many features in plugins

   " Every autocmd below goes in this group so re-sourcing the vimrc
   " (<leader>sv) replaces them instead of adding duplicates.
   augroup vimrc
     autocmd!
   augroup END

   set encoding=utf-8                " set default encoding to utf-8
   set ffs=unix,dos,mac              " set default file type to unix
   set backspace=indent,eol,start    " set backspace to normal
   filetype plugin indent on         " enable plugins and indent
   set shortmess+=I                  " hide welcome screen
   set laststatus=2                  " always show status line
   set autoread                      " reloads file if outside change detected
   set relativenumber                " show relative line numbers
   set ruler                         " show line number, column, and percentage in toolbar
   set so=3                          " keep 3 lines above/below the cursor when moving vertically using j/k
   set history=500                   " increase history memory
   set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·
   set noswapfile
   set nojoinspaces                  " only 1 space after periods during paragraph formatting
   set shell=bash                    " work around vim not reading .zshrc; do ln -s ~/.zshrc ~/.bashrc

   " ----------------------------------------------------------
   "  Folding
   " ----------------------------------------------------------

   set foldmethod=marker             " turn on folding. Use filetype to define folds
   set foldlevelstart=0

   " ----------------------------------------------------------
   "  Colors and Font
   " ----------------------------------------------------------

   syntax on
   " set cursorline                    " highlight current line
   " colorscheme Tomorrow-Night-Eighties
   " colorscheme codeschool
   " colorscheme obsidian
   " colorscheme kafka
   " colorscheme peaksea-custom
   colorscheme peaksea
   " colorscheme wombat
   " colorscheme molokai
   " colorscheme github
   " colorscheme Tomorrow
   " colorscheme railscasts


   " ----------------------------------------------------------
   "  Files
   " ----------------------------------------------------------

   set autochdir                     " change cwd to that of the current file

   " ----------------------------------------------------------
   "  Turn off Macvim sounds
   " ----------------------------------------------------------
   "  " Disable beep in MacVim
    if has("gui_macvim")
	    augroup FeMacVim
		    autocmd!
		    autocmd GUIEnter * set vb t_vb=
	    augroup END
    endif

   " ----------------------------------------------------------
   "  Markers
   " ----------------------------------------------------------

   let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"


   " ----------------------------------------------------------
   "  Searching
   " ----------------------------------------------------------

   set incsearch                     " highlight as you type an expression
   set ignorecase                    " case insensitive search
   set smartcase                     " use case sensitive search when capitals are used
   set hlsearch                      " turn on highlighting of word search


   " ----------------------------------------------------------
   "  Tabs, spaces, wrapping
   " ----------------------------------------------------------

   set tabstop=8        " How many columns Vim gives to tabs
   set shiftwidth=4     " How many columns vim gives to the >> << shift operator
   " set expandtab      " Convert tabs to spaces
   set noet             " Don't convert tabs to spaces
   set softtabstop=8    " How many spaces given to a tab in insert mode
   set wrap             " turn on word wrap visually
   set linebreak        " only wrap at a character in 'breakat' option
   set nolist           " list disables linebreak
   set textwidth=0      " width of text line
   set wrapmargin=0     " # of characters from the right window border where wrapping starts
   set autoindent       " if you're indented, new lines will also be indented


   " ----------------------------------------------------------
   "  Turn on the Wild menu
   " ----------------------------------------------------------

   set wildmenu
   set wildmode=longest,list:full


   " ----------------------------------------------------------
   "  Disable scrollbars
   " ----------------------------------------------------------

   set guioptions-=r
   set guioptions-=R
   set guioptions-=l
   set guioptions-=L


   " ----------------------------------------------------------
   "  No annoying sound on errors
   " ----------------------------------------------------------

   set noerrorbells
   set novisualbell
   set t_vb=
   set tm=500

   autocmd vimrc BufRead,BufNewFile *.md,*.rst
        \ setlocal autoindent expandtab tabstop=8 softtabstop=2 shiftwidth=2
        \ textwidth=78 wrap formatoptions=tcqn
        \ formatlistpat=^\\s*[0-9*]\\+[\\]:.)}\\t\ ]\\s*
        \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>

" }}}
" Keyboard shortcuts {{{
" ==============================================================

   " ----------------------------------------------------------
   "  Base shortcuts
   " ----------------------------------------------------------

   let mapleader=","
   let maplocalleader = ","
   inoremap kj <Esc>
   nnoremap <silent> <C-s> :w<CR>
   nnoremap ; :
   vnoremap ; :

   " disable the q button. I would keep hitting q: instead of q:
   " which would put me in a weird menu
   nnoremap q <Nop>

   " I don't want Ex menu either, whatever that is
   nnoremap Q <Nop>

   if has('mac')
     vnoremap <C-c> "*y:echo "Text has been copied to clipboard"<Cr>
     vnoremap <C-x> "*d:echo "Text has been cut"<Cr>
     inoremap <C-v> <C-r><C-o>*
   elseif has('unix')
     vnoremap <C-c> "+y:echo "Text has been copied to clipboard"<Cr>
     vnoremap <C-x> "+x:echo "Text has been cut"<Cr>
     inoremap <C-v> <C-r><C-p>+
   endif
   " copy file contents to clipboard without losing cursor position
   nnoremap <Leader>a :%y+<CR>
   nnoremap <Leader>p :set paste!<CR>
   nnoremap <Leader>e :set list!<CR>

   " type w!! to save as superuser in case you forget to open vim with sudo
   " (vim only: nvim can't prompt for the sudo password this way)
   if !has('nvim')
     cnoremap w!! w !sudo tee > /dev/null %
   endif

   " ----------------------------------------------------------
   "  Scripts
   " ----------------------------------------------------------

   " run 'make' scripts
   autocmd vimrc FileType python nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>
   autocmd vimrc FileType c nnoremap <buffer> <F9> :make<cr>


   " ----------------------------------------------------------
   "  Opening files
   " ----------------------------------------------------------

    nnoremap <silent> <leader>ev :tabe ~/.vimrc<CR>
    nnoremap <silent> <leader>gev :tabe ~/.gvimrc<CR>
    nnoremap <silent> <leader>sv :so %<CR>


    " ----------------------------------------------------------
    "  Searching
    " ----------------------------------------------------------

    nnoremap <silent> <leader>q :silent :nohlsearch<CR>
    " Keep search matches in the middle of the window.
    nnoremap n nzzzv
    nnoremap N Nzzzv


    " ----------------------------------------------------------
    "  Movement
    " ----------------------------------------------------------

    " noremap j gj
    " noremap k gk
    " nnoremap <Space> zA
    " vnoremap <Space> zA
    " noremap H ^
    " noremap L $
    " vnoremap L g_
    noremap <C-h> gT
    noremap <C-l> gt


    " ----------------------------------------------------------
    "  Add/Delete lines below/above
    " ----------------------------------------------------------

    " Ctrl-j/k inserts a blank line below/above without moving the cursor.
    " noremap <silent><A-J> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
    " noremap <silent><A-K> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
    nnoremap <silent><C-J> :call append(line('.'), '')<CR>
    nnoremap <silent><C-K> :call append(line('.') - 1, '')<CR>

    " ----------------------------------------------------------
    "  Plugin shortcuts
    " ----------------------------------------------------------

    " LaTeX shortcuts are in ~/.vim/ftplugin/tex.vim

    " NERDTree shortcuts
    nnoremap <Leader>nt :NERDTreeToggle<CR>:NERDTreeMirror<CR>

    " EasyMotion shortcuts
    map <Space> <Plug>(easymotion-s)

    " CtrlP shortcuts
    " For some reason this maps :CtrlPMRU to the enter key but I like
    " that so this will stay
    " nnoremap <C-m> :CtrlPMRU<CR> " show the most recently used files

" }}}
" Bundle calls {{{
" ==============================================================

  " ----------------------------------------------------------
  "  Initiate the vim-plug package manager
  " ----------------------------------------------------------

     " Install vim-plug on first run
     let s:plug = expand('~/.vim/autoload/plug.vim')
     if empty(glob(s:plug))
       silent execute '!curl -fsLo ' . s:plug . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
       autocmd vimrc VimEnter * PlugInstall --sync | source $MYVIMRC
     endif

     " plug#end() turns filetype detection and syntax back on
     call plug#begin('~/.vim/plugged')


     " ----------------------------------------------------------
     "  Plugins list
     " ----------------------------------------------------------

     Plug 'vim-latex/vim-latex'
     Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeMirror'] }
     Plug 'airblade/vim-gitgutter'
     Plug 'kshenoy/vim-signature'
     Plug 'francoiscabrol/ranger.vim'
     Plug 'honza/vim-snippets'
     Plug 'Raimondi/delimitMate'
     Plug 'tomtom/tcomment_vim'
     Plug 'easymotion/vim-easymotion'
     Plug 'godlygeek/tabular'  " needed for vim-markdown below
     Plug 'preservim/vim-markdown'
     Plug 'nelstrom/vim-markdown-folding'
     Plug 'ctrlpvim/ctrlp.vim'
     Plug 'tpope/vim-surround'
     Plug 'tpope/vim-fugitive'
     Plug 'tpope/vim-endwise'
     Plug 'Glench/Vim-Jinja2-Syntax'
     Plug 'pearofducks/ansible-vim'
     Plug 'duff/vim-bufonly'
     Plug 'fatih/vim-go', { 'for': 'go' }
     Plug 'flazz/vim-colorschemes'
     Plug 'dense-analysis/ale'
     Plug 'vim-airline/vim-airline'
     Plug 'vim-airline/vim-airline-themes'
     " Plug 'SirVer/ultisnips'
     " Plug 'mattn/emmet-vim'
     " Plug 'thoughtbot/vim-rspec'
     " Plug 'tpope/vim-rails'
     " Plug 'tpope/vim-rvm'
     " Plug 'tpope/vim-unimpaired'
     " Plug 'lervag/vimtex'

     call plug#end()


"}}}
" Bundle options {{{
" ==============================================================

     " ----------------------------------------------------------
     "  UltiSnips
     " ----------------------------------------------------------

     " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
     let g:UltiSnipsExpandTrigger="<tab>"
     let g:UltiSnipsJumpForwardTrigger="<c-b>"
     let g:UltiSnipsJumpBackwardTrigger="<c-z>"

     " If you want :UltiSnipsEdit to split your window.
     let g:UltiSnipsEditSplit="vertical"


     " ----------------------------------------------------------
     "  NERDTree
     " ----------------------------------------------------------

     let NERDTreeShowBookmarks=1
     let NERDTreeIgnore=['\~$', '\.swo$', '\.swp$', '\.hg','\.svn',
               \ '\.bzr', '\.DS_Store', '\.aux', '\.blg', '\.bbl', '\.fls', '\.fdb_lat',
               \ '\.synctex']
     let NERDTreeChDirMode=2
     let NERDTreeQuitOnOpen=1
     let NERDTreeShowHidden=1
     let NERDTreeKeepTreeInNewTab=1
     let NERDTreeShowLineNumbers=1      " enable line numbers
     autocmd vimrc FileType nerdtree setlocal relativenumber " make sure relative line numbers are used


     " ----------------------------------------------------------
     "  Airline
     " ----------------------------------------------------------

     let g:airline_powerline_fonts=1
     " let g:airline_theme='ubaryd'
     " let g:airline_theme='molokai'
     " let g:airline_theme='papercolor'
     let g:airline_theme='bubblegum'
     let g:airline_detect_modified=1
     let g:airline_inactive_collapse=1
     " let g:airline#extensions#tabline#enabled = 1
     let g:airline#extensions#whitespace#enabled = 0
     let g:airline#extensions#wordcount#enabled = 0
     let g:airline_mode_map = {
         \ '__' : '-',
         \ 'n'  : 'N',
         \ 'i'  : 'I',
         \ 'R'  : 'R',
         \ 'c'  : 'C',
         \ 'v'  : 'V',
         \ 'V'  : 'V',
         \ '' : 'V',
         \ 's'  : 'S',
         \ 'S'  : 'S',
         \ '' : 'S',
         \ }

     " set symbols for Airline bar
     let g:airline_left_sep = ''      " used to be 
     let g:airline_left_alt_sep = '|' " used to be 
     let g:airline_right_sep = ''     " used to be 
     let g:airline_right_alt_sep = '' " used to be 
     if !exists('g:airline_symbols')
       let g:airline_symbols = {}
     endif
     if has('mac')
         let g:airline_symbols.branch = ''
         let g:airline_symbols.readonly = ''
         let g:airline_symbols.linenr = ''
         let g:airline_symbols.maxlinenr = ''
     endif

     "
     " ----------------------------------------------------------
     "  delimitMate
     " ----------------------------------------------------------

     let g:delimitMate_expand_cr = 1
     let g:delimitMate_matchpairs = "(:),[:],{:}"
     let g:delimitMate_quotes = "\" ' ` $"
     let delimitMate_expand_space = 1


     " ----------------------------------------------------------
     "  CtrlP
     " ----------------------------------------------------------

     let g:ctrlp_map = '<c-p>'
     let g:ctrlp_cmd = 'CtrlPMRU'
     let g:ctrlp_custom_ignore = {
     \ 'dir':  '\v[\/]\.(git|hg|svn)$',
     \ 'file': '\v\.(exe|so|dll|.DS_Store)$',
     \ }
     let g:ctrlp_open_new_file = 't'  " open files in new tab


     " ----------------------------------------------------------
     "  vim-markdown.vim
     " ----------------------------------------------------------

     let g:vim_markdown_folding_disabled = 1


" }}}
" Custom functions {{{
" ==============================================================

  " ----------------------------------------------------------
  "  Returns to the same line when you reopen a file
  " ----------------------------------------------------------

  augroup line_return
      au!
      au BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \     execute 'normal! g`"zvzz' |
          \ endif
    augroup END


  " ----------------------------------------------------------
  "  Delete trailing white space on save
  " ----------------------------------------------------------

  " Improved whitespace function taken from
  " http://sartak.org/2011/03/end-of-line-whitespace-in-vim.html
  fun! <SID>StripTrailingWhitespaces()
      " Only strip if the b:noStripeWhitespace variable isn't set
      if exists('b:noStripWhitespace') || &binary
        return
      endif
      " Preparation: save last search, and cursor position.
      let _s=@/
      let l = line(".")
      let c = col(".")
      %s/\s\+$//e
      " Clean up: restore previous search history, and cursor position
      let @/=_s
      call cursor(l, c)
  endfun

  autocmd vimrc BufWritePre * :call <SID>StripTrailingWhitespaces()
  nnoremap <Leader>rtw :call <SID>StripTrailingWhitespaces()<CR>

  " autocmd FileType markdown,ruby,perl let b:noStripWhitespace=1
  autocmd vimrc FileType markdown,diff let b:noStripWhitespace=1


" }}}
" File type associations {{{
" ==============================================================

  " Filetype specific settings are in ~/.vim/ftplugin/'filetype'
  " Associate .adoc files with asciidoc file type
  " (vim already detects .md files as markdown)
  autocmd vimrc BufNewFile,BufRead *.adoc setlocal ft=asciidoc
  autocmd vimrc BufNewFile,BufRead *.md setlocal foldlevel=99
  autocmd vimrc BufNewFile,BufRead *.jinja2,*.j2,*.jinja,*.jinja2.html setlocal ft=jinja

  let g:go_version_warning = 0

" }}}
" Postamble {{{
" ==============================================================
    syntax on                         " needs to be last for file coloring to work
" }}}
