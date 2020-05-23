syntax on
set nocompatible
filetype plugin on
set noerrorbells
set number
set showmatch
set noswapfile
set nobackup
set encoding=utf-8
set incsearch
set hlsearch
set ignorecase
set smartcase
set autoindent
set tabstop=2 shiftwidth=4 expandtab

call plug#begin(stdpath('data') . '/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vimwiki/vimwiki'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" vim-misc
" https://github.com/xolox/vim-misc
" Plug 'xolox/vim-misc'

" vim-easytags
" https://github.com/xolox/vim-easytags
" Plug 'xolox/vim-easytags'

" Tagbar
" https://github.com/majutsushi/tagbar
" Plug 'majutsushi/tagbar'

call plug#end()

" Auto start NERD tree when opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" Auto start NERD tree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

" Let quit work as expected if after entering :q the only window left open is NERD Tree itself
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let mapleader=";"

" (e)dit (c)onfiguration
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>

" (s)ource (c)onfiguration
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>

" use ;; for escape
inoremap ;; <Esc>

" Toggle NERDTree
nnoremap <silent> <Space> :NERDTreeToggle<CR>

" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

nnoremap <silent> <leader>tb :TagbarToggle<CR>

nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

let g:airline_theme='monochrome'

let g:easytags_cmd = '/usr/local/bin/ctags'
let g:easytags_suppress_ctags_warning = 1
