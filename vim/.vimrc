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
   set encoding=utf-8                " set default encoding to utf-8
   set ffs=unix,dos,mac              " set default file type to unix
   set backspace=indent,eol,start    " set backspace to normal
   filetype plugin indent on         " enable plugins and indent
   set shortmess+=I                  " hide welcome screen
   set laststatus=2                  " always show status line
   set autoread                      " reloads file if outside change detected
   set relativenumber                " show relative line numbers
   set ruler                         " show line number, column, and percentage in toolbar
   set so=3                          " set 2 lines to the cursor - when moving vertically using j/k
   set history=500                   " increase history memory
   set listchars=tab:▸\ ,trail:.,eol:¬,extends:❯,precedes:❮,trail:·
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
   set cindent          " automatically indents lines after opening a bracket in programming languages
   set autoindent       " if you're indented, new lines will also be indented


   " ----------------------------------------------------------
   "  Searching
   " ----------------------------------------------------------

   set ignorecase       " Ignore case when searching
   set smartcase        " When searching try to be smart about cases
   set incsearch        " Makes search act like search in modern browsers


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

   autocmd BufRead,BufNewFile *.md,*.rst
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
   nmap <silent> <C-s> :w <CR>
   nmap <silent> <M-a>w :set list!<CR>
   nmap ; :
   vmap ; :

   " disable the q button. I would keep hitting q: instead of q:
   " which would put me in a weird menu
   nmap q <Nop>

   " I don't want Ex menu either, whatever that is
   nmap Q <Nop>

   if has('mac')
     vmap <C-c> "*y:echo "Text has been copied to clipboard"<Cr>
     vmap <C-x> "*d:echo "Text has been cut"<Cr>
     imap <C-v> <Esc> "*p
   elseif has('unix')
     vmap <C-c> "+y:echo "Text has been copied to clipboard"<Cr>
     vmap <C-x> "+x:echo "Text has been cut"<Cr>
     imap <C-v> <C-r><C-p>+
   endif
   " copy file contents to clipboard without losing cursor position
   nnoremap <Leader>a :%y+<CR>
   nnoremap <Leader>p :set paste!<CR>
   nnoremap <Leader>e :set list!<CR>

   " type w!! to save as superuser in case you forget to open vim with sudo
   cmap w!! w !sudo tee > /dev/null %

   " ----------------------------------------------------------
   "  Scripts
   " ----------------------------------------------------------

   " run 'make' scripts
   autocmd FileType python nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>
    autocmd FileType c nnoremap <buffer> <F9> :make<cr>


   " ----------------------------------------------------------
   "  Opening files
   " ----------------------------------------------------------

    if has('mac') || has('unix')
        nmap <silent> <leader>ev :tabe ~/.vimrc<CR>
        nmap <silent> <leader>gev :tabe ~/.gvimrc<CR>
    endif
    nmap <silent> <leader>sv :so %<CR>
    if has('mac') || has('unix')
      nmap <silent> <leader>es :UltiSnipsEdit<CR>
    endif


    " ----------------------------------------------------------
    "  Opening files
    " ----------------------------------------------------------

    autocmd FileType py nmap <silent> <leader>c :w <CR> :! python %<CR>


    " ----------------------------------------------------------
    "  Searching
    " ----------------------------------------------------------

    nmap <silent> <leader>q :silent :nohlsearch<CR>
    " Keep search matches in the middle of the window.
    nnoremap n nzzzv
    nnoremap N Nzzzv


    " ----------------------------------------------------------
    "  Select inside dollar signs for latex
    " ----------------------------------------------------------

    :onoremap <silent> i$ :<c-u>normal! T$vt$<cr>
    :vnoremap i$ T$ot$

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

    " Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
    " noremap <silent><A-J> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
    " noremap <silent><A-K> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
    noremap <silent><C-J> :set paste<CR>m`o<Esc>``:set nopaste<CR>
    noremap <silent><C-K> :set paste<CR>m`O<Esc>``:set nopaste<CR>

    " ----------------------------------------------------------
    "  Keyboard shortcuts for changing font size quickly
    " ----------------------------------------------------------

    noremap <C-\> :LargerFont<CR>
    noremap <A-\> :SmallerFont<CR>

    " ----------------------------------------------------------
    "  Plugin shortcuts
    " ----------------------------------------------------------

    " Vim Latex shortcuts
    if has("mac")
      autocmd FileType tex map <Leader>c :w<CR><Leader>ll<Leader>ls
      autocmd FileType tex map <Leader>g :w<CR>:call RunLatexOnce()<CR><Leader>ls
      autocmd FileType tex map <Leader>f :w<CR>:call RunLatexOnce()<CR>
      " autocmd FileType tex map <Leader>f :w<CR>:call RunLatexOnce()<CR>
      autocmd FileType tex map <Leader>b :call RunBibtexOnce()<CR>
    elseif has("unix")
      autocmd FileType tex map <Leader>c :w<CR><Leader>ll
      autocmd FileType tex map <Leader>f :call RunLatexOnce()<CR>
    endif

    " NERDTree shortcuts
    map <Leader>nt :NERDTreeToggle<CR>:NERDTreeMirror<CR>

    " EasyMotion shortcuts
    map <Space> <Plug>(easymotion-s)

    " CtrlP shortcuts
    " For some reason this maps :CtrlPMRU to the enter key but I like
    " that so this will stay
    " nnoremap <C-m> :CtrlPMRU<CR> " show the most recently used files

    " Surround.vim

    " char2nr is the ascii representation of the character
    autocmd FileType tex let b:surround_{char2nr('b')} = "\\begin{\1environment: \1} \n\t\r\n\\end{\1\r}.*\r\1}"
    autocmd FileType tex let b:surround_{char2nr('$')} = "$\r$"
    autocmd FileType tex let b:surround_{char2nr('e')} = "\\\1command: \1{\r}"

    " Vim-rspec
    autocmd FileType ruby map <Leader>t :call RunCurrentSpecFile()<CR>
    autocmd FileType ruby map <Leader>s :call RunNearestSpec()<CR>
    autocmd FileType ruby map <Leader>l :call RunLastSpec()<CR>
    autocmd FileType ruby map <Leader>a :call RunAllSpecs()<CR>

    " LaTeX-Box
    "


" }}}
" Bundle calls {{{
" ==============================================================

  " ----------------------------------------------------------
  "  Initiate the Vundle package manager
  " ----------------------------------------------------------

     filetype off " required!

     if has("mac")
       set rtp+=~/.vim/bundle/Vundle.vim
     elseif has("unix")
       set rtp+=~/.vim/bundle/Vundle.vim
     elseif has("win32")
       set rtp+=C:/Program\ Files/Vim/vimfiles/bundle/Vundle.vim/
     endif
     call vundle#begin()


     " ----------------------------------------------------------
     "  Plugins list
     " ----------------------------------------------------------

     Plugin 'VundleVim/Vundle.vim'
     Plugin 'jcf/vim-latex'
     Plugin 'scrooloose/nerdtree'
     Plugin 'airblade/vim-gitgutter'
     Plugin 'kshenoy/vim-signature'
     Plugin 'francoiscabrol/ranger.vim'
     Plugin 'honza/vim-snippets'
     Plugin 'Raimondi/delimitMate'
     Plugin 'tomtom/tcomment_vim'
     Plugin 'easymotion/vim-easymotion'
     Plugin 'godlygeek/tabular'  " needed for vim-markdown below
     Plugin 'plasticboy/vim-markdown'
     Plugin 'nelstrom/vim-markdown-folding'
     Plugin 'kien/ctrlp.vim'
     Plugin 'tpope/vim-surround'
     Plugin 'tpope/vim-fugitive'
     Plugin 'tpope/vim-endwise'
     Plugin 'Glench/Vim-Jinja2-Syntax'
     Plugin 'chase/vim-ansible-yaml'
     Plugin 'duff/vim-bufonly'
     Plugin 'fatih/vim-go'
     Plugin 'flazz/vim-colorschemes'
     Plugin 'dense-analysis/ale'
     Plugin 'bling/vim-airline'
     Plugin 'vim-airline/vim-airline-themes'
     " Plugin 'SirVer/ultisnips'
     " Plugin 'mattn/emmet-vim'
     " Plugin 'thoughtbot/vim-rspec'
     " Plugin 'tpope/vim-rails'
     " Plugin 'tpope/vim-rvm'
     " Plugin 'tpope/vim-unimpaired'
     " Plugicolorscheme wombatn 'dagwieers/asciidoc-vim'
     " Plugin 'pearofducks/ansible-vim'
     " Plugin 'LaTeX-Box-Team/LaTeX-Box'
     " Plugin 'lervag/vimtex'

     call vundle#end()


"}}}
" Bundle options {{{
" ==============================================================

     " ----------------------------------------------------------
     "  Latex-suite
     " ----------------------------------------------------------

     " Note about inverse searching : make sure the file mvim, which ships with macvim, is moved to
     " /usr/local/bin, Also remember to use the pdfsync package

     let g:tex_flavor= "pdflatex"
     let g:Tex_DefaultTargetFormat = "pdf"
     let g:Tex_MultipleCompileFormats = "pdf"
     " let g:Tex_DefaultTargetFormat = "dvi"
     " let g:Tex_MultipleCompileFormats = "dvi"
     let Tex_FoldedSections=""
     let Tex_FoldedEnvironments=""
     let Tex_FoldedMisc=""

     " Synctex settings: http://mactex-wiki.tug.org/wiki/index.php/SyncTex
     if has('mac')
         let $PATH=$PATH . ':/usr/texbin'
         let g:Tex_ViewRule_pdf = "Skim"
         let g:Tex_ViewRule_dvi = "xdvi"
         let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style  $*'
         let g:Tex_CompileRule_pdf = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error-style  $*'
         let g:Tex_CompileRule_dvi = 'latex -src-specials -interaction=nonstopmode $*'
         " set macmeta " Allows us to use the meta (option / alt) key on Mac OSX
     elseif has('unix')
         " let g:Tex_ViewRule_pdf = "evince"
         let g:Tex_ViewRule_pdf = "okular --unique"
         " let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -src-specials -interaction=nonstopmode -file-line-error-style $*'
         let g:Tex_CompileRule_pdf = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error-style  $*'

         function! SyncTexForward()
             let s:syncfile = fnamemodify(fnameescape(Tex_GetMainFileName()), ":r").".pdf"
             " let execstr = "silent !evince --unique ".s:syncfile."\\#src:".line(".").expand("%\:p").' &'
             let execstr = "silent !okular --unique ".s:syncfile."\\#src:".line(".").expand("%\:p").' &'
             exec execstr
         endfunction
         nnoremap <Leader>s :call SyncTexForward()<CR>
     endif
     "
     " " Note - In order to set up inverse search in Okular go to Settings
     " " > Okular settings > Editor. Then choose 'Custom Text Editor' in
     " " the dropdown and then use the command:
     " " 'gvim --servername GVIM --remote +%l %f'
     "
     " " let g:Tex_Leader = '/'
     "
     " let g:Tex_IgnoredWarnings ='
     " \"LaTeX Font Warning\n"'
     "     \"Underfull\n".
     "     \"Overfull\n".
     "     \"specifier changed to\n".
     "     \"You have requested\n".
     "     \"Missing number, treated as zero.\n".
     "     \"There were undefined references\n".
     "     \"Citation %.%# undefined\n".
     "     \"\oval, \circle, or \line size unavailable\n"'

     " ----------------------------------------------------------
     "  LaTeX-Box
     " ----------------------------------------------------------

     let g:tex_flavor= "pdflatex"
     let g:vimtex_latexmk_continuous = 0
     let g:LatexBox_show_warnings = 0
     " calling okular from the command line from vim causes a bunch of
     " bad output to mess up the vim window
     function! SyncTexForward()
       let s:syncfile = LatexBox_GetOutputFile()"
       " let execstr = "silent !evince --unique ".s:syncfile."\\#src:".line(".").expand("%\:p").' >/dev/null 2>&1 &'
       let execstr = "silent !okular --unique ".s:syncfile."\\#src:".line(".").expand("%\:p").' &'
       " exec execstr
       echo execstr
     endfunction
     nnoremap <Leader>ls :call SyncTexForward()<CR>


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
     autocmd FileType nerdtree setlocal relativenumber " make sure relative line numbers are used


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
     if exists('g:airline_symbols')
       if has('mac')
         let g:airline_symbols.branch = ''
         let g:airline_symbols.readonly = ''
         let g:airline_symbols.linenr = ''
         let g:airline_symbols.linenr = ''
         let g:airline_symbols.maxlinenr = ''
       endif
     endif
     if !exists('g:airline_symbols')
       let g:airline_symbols = {}
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
     "  vim-rspec.vim
     " ----------------------------------------------------------

     let g:rspec_runner = "os_x_iterm"


     " ----------------------------------------------------------
     "  vim-markdown.vim
     " ----------------------------------------------------------

     let g:vim_markdown_folding_disabled = 1


     " ----------------------------------------------------------
     "  vimtex.vim
     " ----------------------------------------------------------

     " let g:vimtex_quickfix_latexlog = {'default' : 0}
     " let g:vimtex_quickfix_latexlog = {
     "    \ 'default' : 0,
     "    \ 'general' : 0,
     "    \ 'overfull' : 0,
     "    \ 'underfull' : 0,
     "    \ 'font' : 0,
     "    \ 'packages' : {
     "    \   'default' : 0,
     "    \   'natbib' : 0,
     "    \   'biblatex' : 0,
     "    \   'babel' : 0,
     "    \   'hyperref' : 0,
     "    \   'scrreprt' : 0,
     "    \   'fixltx2e' : 0,
     "    \   'titlesec' : 0,
     "    \ },
     "    \}

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
  "  Delete trailing white space on sace
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

  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
  nnoremap <Leader>rtw :call <SID>StripTrailingWhitespaces()<CR>

  " autocmd FileType markdown,ruby,perl let b:noStripWhitespace=1
  autocmd FileType markdown,diff let b:noStripWhitespace=1

  " ----------------------------------------------------------
  "  Run latex once
  " ----------------------------------------------------------

  function! RunLatexOnce()
    let s:syncfile = fnamemodify(fnameescape(Tex_GetMainFileName()), ":r").".tex"
    exec "silent ! pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style  $* ".s:syncfile
  endfunction

  " this doesn't seem to be working right now
  function! RunBibtexOnce()
    let s:syncfile = fnamemodify(fnameescape(Tex_GetMainFileName()), ":r")
    exec "silent ! bibtex ".s:syncfile
  endfunction

  " ----------------------------------------------------------
  " Change font size quickly
  " ----------------------------------------------------------

  let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
  let s:minfontsize = 6
  let s:maxfontsize = 16
  function! AdjustFontSize(amount)
    if has("gui_gtk2") && has("gui_running")
      let fontname = substitute(&guifont, s:pattern, '\1', '')
      let cursize = substitute(&guifont, s:pattern, '\2', '')
      let newsize = cursize + a:amount
      if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
    " " let newfont = fontname . newsize
    " " let &guifont = newfont
      endif
    else
      echoerr "You need to run the GTK2 version of Vim to use this function."
    endif
  endfunction

  function! LargerFont()
    call AdjustFontSize(1)
  endfunction
  command! LargerFont call LargerFont()

  function! SmallerFont()
    call AdjustFontSize(-1)
  endfunction
  command! SmallerFont call SmallerFont()


" }}}
" File type associations {{{
" ==============================================================

  " Filetype specific settings are in ~/.vim/ftplugin/'filetype'
  " Associate .adoc files with asciidoc file type
  " Associate .md files with markdown file type
  au BufNewFile,BufRead *.adoc setlocal ft=asciidoc
  au BufNewFile,BufRead *.md setlocal ft=markdown
  au BufNewFile,BufRead *.md setlocal foldlevel=99
  autocmd BufNewFile,BufRead *.jinja2,*.j2,*.jinja,*.jinja2.html set ft=jinja

  let g:go_version_warning = 0

" }}}
" Postamble {{{
" ==============================================================
    syntax on                         needs to be last for file coloring to work
" }}}
