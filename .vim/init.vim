call plug#begin('~/.vim/plugged')
"
"Plug 'tpope/vim-fugitive'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'kennethzfeng/vim-raml'
"
call plug#end()
"
""Transparency----------------------------------
"autocmd ColorScheme * highlight Normal ctermbg=None
"autocmd ColorScheme * highlight NonText ctermbg=None
"autocmd ColorScheme * highlight LineNr ctermbg=None
""End Transparency------------------------------
"
""Base------------------------------------------
""autocmd BufWritePost $MYVIMRC so %
set lazyredraw
set ttyfast
set backspace=indent,eol,start
set background=dark
colorscheme candyman
filetype indent plugin on
"set fileencoding=utf-8
""set term=xterm-256color
""set t_Co=256
""set t_ut=
"set modeline
set wildmenu
"set hidden
"set hlsearch
set nobackup
set nowritebackup
set noswapfile
"set wiw=100
"set ea
""End Base--------------------------------------
"
"NERDTree--------------------------------------
autocmd VimEnter * :NERDTreeToggle
let g:NERDTreeDirArrows = 0
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 40
autocmd WinEnter NERD_tree_* setlocal wiw=40
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"End NERDTree----------------------------------
"
""Code------------------------------------------
set nu
syntax enable
autocmd WinEnter * if &modifiable | setlocal wiw=100 | endif
autocmd WinEnter * wincmd =
set expandtab
set shiftwidth=2
set softtabstop=2
set colorcolumn=60,80
"
set nowrap
""End Code--------------------------------------
"
""Key Bindings----------------------------------
let mapleader = "\<Space>"
"
"nnoremap n nzz
"nnoremap N Nzz
"
"noremap <C-h> <C-W>h
"noremap <C-j> <C-W>j
"noremap <C-k> <C-W>k
"noremap <C-l> <C-W>l
"
nnoremap <Leader>n :NERDTreeToggle<CR>
""End Key Bindings------------------------------
