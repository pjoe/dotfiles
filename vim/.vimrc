set nocompatible
filetype plugin indent on
set t_Co=256
set mouse=a
set ttymouse=xterm2
let mapleader=","

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeMapJumpNextSibling = '<Nop>'
let g:NERDTreeMapJumpPrevSibling = '<Nop>'

Plug 'tomasr/molokai'

Plug 'bling/vim-airline'
set laststatus=2
let g:airline_left_sep=' '
let g:airline_right_sep=' '

Plug 'christoomey/vim-tmux-navigator'
inoremap <silent> <C-h> <c-o>:TmuxNavigateLeft<cr>
inoremap <silent> <C-j> <c-o>:TmuxNavigateDown<cr>
inoremap <silent> <C-k> <c-o>:TmuxNavigateUp<cr>
inoremap <silent> <C-l> <c-o>:TmuxNavigateRight<cr>

Plug 'tpope/vim-fugitive'

Plug 'mrk21/yaml-vim', { 'for': 'yaml' }

Plug 'Chiel92/vim-autoformat'
noremap <leader>f :Autoformat<CR>

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

call plug#end()

" colors
colorscheme molokai
syntax enable

" tabs
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

set number
set cursorline
filetype indent on
set wildmenu
set lazyredraw
set showmatch

" search
set incsearch
set hlsearch

set fillchars-=vert:\| | set fillchars+=vert:\
set listchars=tab:>·,trail:~,extends:>,precedes:<,space:⋅
set timeoutlen=1000 ttimeoutlen=0

autocmd FileType javascript setlocal tabstop=2 softtabstop=2 expandtab shiftwidth=2

" move to beginning/end of line
nnoremap B ^
nnoremap E $

nnoremap <leader><space> :nohlsearch<CR>
