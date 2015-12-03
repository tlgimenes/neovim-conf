" NeoVim Settings 
" Author: Tiago Lobato Gimenes (tlgimenes@gmail.com)
" 
" Fell free to change this configuration file
"

" ========== Vim Basic Settings ============="

" Make vim incompatbile to vi.
set modelines=0

"TAB settings.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" More Common Settings.
set scrolloff=3
set showmode
set showcmd
set hidden
set visualbell

set history=1000
set undolevels=10000

set nobackup
set noswapfile

set cursorline
set ruler
set laststatus=2

set number
set norelativenumber

set shell=/bin/bash
set lazyredraw
set matchtime=3

"Changing Leader Key
let mapleader = ","

" Set title to window
set title

" Dictionary path, from which the words are being looked up.
" set dictionary=/usr/share/dict/words

set ignorecase
set smartcase
set showmatch

" Make Vim to handle long lines nicely.
set wrap
set textwidth=80
set colorcolumn=81

" To  show special characters in Vim
"set list
set listchars=tab:▸\ ,eol:¬

" set unnamed clipboard
set clipboard+=unnamedplus

" Navigation
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

" Wildmenu completion "
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"

" Make Sure that Vim returns to the same line when we reopen a file"
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" =========== END Basic Vim Settings ===========

" =========== Vim Plug Settings ===========

call plug#begin('~/.config/nvim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }

" Load always
Plug 'critiqjo/lldb.nvim' " Debugger

Plug 'benekastah/neomake' "Neomake

Plug 'octol/vim-cpp-enhanced-highlight' " STL C++ highlight

Plug 'PetRUShka/vim-opencl' " OpenCL syntastic checker

Plug 'thinca/vim-template' " New file template 

Plug 'vim-scripts/DoxygenToolkit.vim' " Doxygen comments

Plug 'Raimondi/delimitMate' " Auto brackets 

Plug 'godlygeek/tabular' " Tabular pluggin

"Plug 'Shougo/neocomplete' | Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets' " Snippet plugin

call plug#end()

" =========== END Vim Plug Settings ===========

" =========== Vim Plugging Settings ===========
"""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree Options
autocmd vimenter * NERDTree | wincmd p " Automatic starts NERDTree and move cursor1
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.so']  " Don't show these filetypes

"""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

"""""""""""""""""""""""""""""""""""""""""""""""
" Neomake options
let g:neomake_cpp_gpp_maker = {
    \ 'exe': 'g++',
    \ 'args': ['-fsyntax-only', '--std=c++14', '-I./', '-I/usr/include/gtkmm-3.0'],
    \ 'errorformat': '%f:%l:%c: %m',
    \ }

let g:neomake_cpp_enabled_makers = ['gpp']
let g:neomake_verbose = 0
let g:neomake_open_list = 1

autocmd! BufWritePost * Neomake " Launch neomake while saving file

"""""""""""""""""""""""""""""""""""""""""""""""
" Vim-template 
" Change <+FILE+> to the name of the file
" Change <+DATE+> to date
" Set cursor to <+CURSOR+>
autocmd User plugin-template-loaded call s:template_keywords()
function! s:template_keywords()
  if search('<+UPPERCASE_FILE+>')
    silent %s/<+UPPERCASE_FILE+>/\=toupper(expand('%:t:r'))/g
  endif
  if search('<+FILE_ROOT+>')
    silent %s/<+FILE_ROOT+>/\=expand('%:t:r')/g
  endif
  if search('<+UPPERCASE_FILE_EXT+>')
    silent %s/<+UPPERCASE_FILE_EXT+>/\=toupper(expand('%:e'))/g
  endif
  if search('<+FILE+>')
    silent %s/<+FILE+>/\=expand('%:t')/g
  endif
  if search('<+DATE+>')
    silent %s/<+DATE+>/\=strftime('%Y-%m-%d')/g
  endif
  if search('<+CURSOR+>')
    silent execute 'normal! "_da>'
  endif
endfunction

" =========== END Vim Plugging Settings ===========
