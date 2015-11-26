"vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"git interface
Plugin 'tpope/vim-fugitive'
"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" ctrl+p find files ****
Plugin 'kien/ctrlp.vim' 

"python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-powerline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'majutsushi/tagbar'

"python comment
Plugin 'scrooloose/nerdcommenter'

"auto-completion stuff
"Plugin 'klen/python-mode'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'klen/rope-vim'
"Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
""code folding
Plugin 'tmhedberg/SimpylFold'

"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

call vundle#end()

filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 1

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_semantic_triggers = {}
let g:ycm_semantic_triggers.c = ['->', '.', ' ', '(', '[', '&']
let g:ycm_cache_omnifunc=0
let g:ycm_min_num_of_chars_for_completion=1
set completeopt-=preview

" tagbar
let mapleader=";"
let tagbar_left=0
nmap <Leader>t :TagbarToggle<CR> 
let tagbar_width=32 
let g:tagbar_compact=1
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
"autocmd BufReadPost *.py,*.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"custom keys
"
syntax enable
set background=dark
colorscheme solarized
"set guifont=Monaco:h14

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"fold
set foldmethod=indent
set foldlevel=99


" vim self complete

set wildmenu

"quick key
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>n :tabnext<CR>
nmap <Leader>b :tabprevious<CR>
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>je :YcmCompleter GoToDefinition<CR>

let g:Powerline_colorscheme='solarized256'

"I don't like swap files
set noswapfile

"set others
set ruler
set laststatus=2

"turn on numbering
set nu
set smartindent
set cindent

"python with virtualenv support
py << EOF
import os.path
import sys
import vim
if 'VIRTUA_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
"----------Stop python PEP 8 stuff--------------

